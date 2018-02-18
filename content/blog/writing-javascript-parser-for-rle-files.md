+++
author = "Alexander Shchapov"
categories = ["tech", "pegjs", "javascript", "programming"]
date = 2015-01-10T07:43:52Z
description = ""
draft = false
image = "/images/2015/01/Screenshot-2015-01-10-14-23-52.png"
slug = "writing-javascript-parser-for-rle-files"
tags = ["tech", "pegjs", "javascript", "programming"]
title = "Writing JavaScript parser for RLE files with PEG.js"

+++

#### Intro
I spent some time recently thinking on implementation of [Conway's Game of Life](http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life). Since it effectively has only four rules explaining all the "mechanics", there is not much to implement. The main purpose for me was to refresh knowledge of JavaScript and get a bit more familiar with Node.js and D3.js.

At some point of implementation I found a [LifeWiki](http://www.conwaylife.com/wiki/Main_Page) which has tons of information about different patterns and their behavior. Notably, there is also an archive of 3k+ patterns of life available for download as a single archive. I decided to widen the result a bit to include DIY RLE parser and a simple browser for that collection.

#### RLE Format
Wikipedia says that
> [Run-length encoding](http://en.wikipedia.org/wiki/Run-length_encoding) (RLE) is a very simple form of data compression in which runs of data (that is, sequences in which the same data value occurs in many consecutive data elements) are stored as a single data value and count, rather than as the original run. This is most useful on data that contains many such runs. 

With some modifications it can be easily used for cellular automata data. For example, here is the famous [Gosper Glider Gun]() described in RLE format:

    #N Gosper glider gun
    #C This was the first gun discovered.
    #C As its name suggests, it was discovered by Bill Gosper.
    x = 36, y = 9, rule = B3/S23
    24bo$22bobo$12b2o6b2o12b2o$11bo3bo4b2o12b2o$2o8bo5bo3b2o$2o8bo3bob2o4bobo$10bo5bo7bo$11bo3bo$12b2o!
    
Spending some time we can create a dumb regex based parser for this format, but why we want to to that if we can describe format grammar instead and let parser to be generated for us based on grammar specifications? Here is where PEG.js kicks in.

#### PEG.js
> [PEG.js](http://pegjs.org/) is a simple parser generator for JavaScript that produces fast parsers with excellent error reporting. You can use it to process complex data or computer languages and build transformers, interpreters, compilers and other tools easily.

[Building parsers](http://en.wikipedia.org/wiki/Parsing) is a giant branch of Computer Science which learns how to analyze and process either natural or synthetic languages. Every programming language compiler or interpreter begins from parsing data passed to it as an input. We are not going to dive deep, instead we will concentrate on a simple task of writing format interpreter for RLE file describing Life pattern.

PEG.js does all the magic for us behind the scenes, requiring us only to defince a grammar using simple [grammar syntax and semantics](http://pegjs.org/documentation#grammar-syntax-and-semantics). By the way, it also offers [online playground](http://pegjs.org/online), which is nice to try.

#### Creating a Grammar
Grammar creation starts with a definitions of "atoms", simpliest things in our format.
Lets describe basic building bits first, which do not have any transformations, for convenience we define their names here:

    comma
     = ","
     
    equals
     = "="

    digit
     = [0-9]

    nl "new line"
     = "\n"

    ws "white space"
     = [ \t]

    _ "any number of whitespaces"
     = ws*

    __ "extended whitespace"
     = nl* / ws*

As you can see, we say that `nl` is our new line, and a `ws` stands for white space, which can be represented by a space or tab character. For convenience we call any number of white spaces a `_`, and we also define a `__` version of a whitespace, which also includes line breaks. This can be useful in order to ignore whitespaces and we'll see that in a moment. Here we declare that a digit is anything that match pattern `[0-9]`. Interpolation of that range is done by JavaScript regex parser as well as other quantifiers as `*` or `+`.

We also want to make some transformations on parsed values. Here _actions_ come. Any group matched by `+` or `*` results in an array in action arguments. Action is an anonymous function which follows expression. Let's define _integer_ and _string_.

    str "comment string"
     = characters:([^\n])+ {
        return characters.join("");
    }

    int "integer"
     = digits:digit+ {
        return parseInt(digits.join(""));
    }

    signed_int "signed integer"
     = sign:[+-]? n:int {
        return parseInt(
            sign + n
        )
    }
   
Lets take a closer look. First we declare `str`, which in out case has specific usage: meta comments. We state that string can contain any character except a new line; we also assign captured value to a variable called `characters`; finally a `+` sign from a regular expression results an array of characters captured in `characters` variable, so that in _action_ part we `join` them into a string.
An `integer` in our Universe is a number of digits, we join them to a string and then apply `parseInt`.
A `signed integer` also has a sign prefix.

Then we move on to parsing meta comments. We have comments of several types:

* `#N` stores title of pattern
* `#C` or `#c` is a text comment
* `#O` stores author's name
* `#R` (or `#P`) shows top left corner of the field (can be used to center pattern)
* `#r` shows the rule for a totalistic cellular automaton in the form survival_counts/birth_counts (e.g. 23/3 for Life)

Here is our grammar declaration for comments:

    meta_name "name comment (#N)"
     = "#N" _ data:str {
        return {
            "type": "name",
            "value": data
        }
    }

    meta_comment "comment (#C, #c)"
     = "#"[Cc] _ data:str? {
        return {
            "type": "comment",
            "value": data || ""
        }
    }
    
    ...

    meta_top_left_coordinates "TL coordinates comment (#R, #P)"
     = "#"[RP] _ x:signed_int _ y:signed_int  {
        return {
            "type": "topLeftCoordinates",
            "x": x,
            "y": y,
        }
    }
    
These declarations are pretty straightforward. By `_` we indicate any number of whitespaces between `#x` and comment content. For `#R` and `#P` we perform additional check for format `#R -100 200`. All matched data we convert to objects.

We also can group all meta declarations under one definition to use it later:

    meta_tags "comment line (#)"
     = meta_name / meta_comment / meta_rules / meta_author / meta_top_left_coordinates
     
Next goes header line, which shows field width and height. It can optionally declare game rules: `x = m, y = n, rule = abc`. Header is declared in grammar similar to comments above, so lets move on to pattern itself.

The pattern itself begins on the next line and it is encoded as a sequence if items of the form `<run_count><tag>`, where `<tag>` is one of the following:

* `b` = a dead cell
* `o` = a live cell
* `$` = end of a line of the pattern

and `<run_count>` is the number of occurrences of `<tag>`. 

Additional rules are:

* `run_count` can be omitted if equal to 1;
* dead cells at the end of a pattern line do not need to be encoded, nor does the end of the last line of the pattern;
* the last `<run_count><tag>` item is followed by a `!` character;
* lines can be separated by new line;
* anything after the final `!` is ignored.

First we declare a tag, EOF and EOF:

    tag "cell tag"
     // b = a dead cell
     // o = a live cell
     = [bo]

    pattern_tag_eol
     = "$"

    pattern_eof
     = "!" .*

Then we declare normal and tagless forms:

    normal_or_countless_tag
     = run_count:int? __ tag:tag __ {
       return [run_count || 1, tag]
    }
    
    tagless_dead_tag
     = run_count:int {
       return [run_count, "b"];
    }
    
Finally we declare single tag, pattern line and match all pattern lines:

    pattern_lines
     = pattern_lines:pattern_line+ {
        return {
            "type": "lines",	
            "items": pattern_lines
        }
    }

    pattern_line
     = tag:pattern_single_tag* __ (pattern_tag_eol / pattern_eof) __ {
        return tag
    }

    pattern_single_tag
     = normal_or_countless_tag / tagless_dead_tag
     
 At this point we have everything declared, it's time to glue items together. `start` is a special PEG.js directive which identified entry point for parser.
 
 We say that a line is a meta comment, header or a pattern, which are separated by line breaks:
 
     line
     = line:(meta_tags / header / pattern_lines) nl? { return line }
     
And we declare the entrypoint as a multiple lines:

    start
     = line+

That's it!