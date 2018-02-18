+++
author = "Alexander Shchapov"
date = 2014-08-13T08:18:08Z
description = ""
draft = false
slug = "git-rebase-step-by-step"
tags = ["tech"]
title = "git rebase step by step"
+++

A lot of mysterios stories are hidden behind `rebase` command, and from the start it seems to be a tricky part of git work flow. The truth is that everything becomes clear once you have a full picture in front of you. Here I'm trying to summarize `rebase` command usage in one example of _typical_ (not necessarily the best one) flow.

#### Step 1: create a feature branch

Assuming you're on a `master` branch of repository, create a feature branch:

    $ git checkout master
    $ git checkout -b feature-x

#### Step 2: write the code

Now feel free to _do your work_. Write the code. Commit as many times as you need or want.

Just one little change to your usual workflow: in order to make your `rebase` procedure easier (for you), mark your first commit with `r` (where "r" stands for "reword") and all subsequent commits with `s` (stands for "squash"). Don't ask questions yet, you'll see in a minute. Let's imagine you did the following:

    $ echo "c1" > test # some work done here
    $ git commit -am "r: first commit"

    $ echo "c2" >> test # more work done here
    $ git commit -am "s: second commit"

    $ echo "c3" >> test # some final changes are commited in here
    $ git commit -am "s: third commit"

Note: `-am` is not a good practice, it is used here just for demonstration.

#### Step 3: it's time to rebase

Now your `feature-x` branch has three commits and you've decided that it's time to present team a pull request. Your history looks like this:

    $ git log master..feature-x --oneline
    83c9a8a s: third commit
    cfafc3d s: second commit
    ad79f34 r: first commit

But what you really want to is to present one commit instead of bunch of dummy "work in progress" commits. This procedure is called squashing: you want to squash three commits into one. In order to do that it's time for rebase with following command: `git rebase -i HEAD~N` where `N` is a number of commits you've made:

    $ git rebase -i HEAD~3

Hint: if you are lazy to count or you have many of commits to rebase, you can ask git to count for you:

    $ git log master..feature-x --oneline | wc -l
    3

Ok, with rebase command you'll enter interactive rebase, which looks something like this:

    pick ad79f34 r: first commit
    pick cfafc3d s: second commit
    pick 83c9a8a s: third commit

    # Rebase 4d7fa87..83c9a8a onto 4d7fa87
    #
    # Commands:
    #  p, pick = use commit
    #  r, reword = use commit, but edit the commit message
    #  e, edit = use commit, but stop for amending
    #  s, squash = use commit, but meld into previous commit
    #  f, fixup = like "squash", but discard this commit's log message
    #  x, exec = run command (the rest of the line) using shell
    #
    # These lines can be re-ordered; they are executed from top to bottom.
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    # However, if you remove everything, the rebase will be aborted.
    #
    # Note that empty commits are commented out

Replace first `pick` command with `r` or `reword` and all subsequent commits with `s` or `squash`. Do you remember we've marked commits with `r` and `s`? That was optional, in fact, just for you to remembers what you want to squash and what to leave. Do not touch commit messages for now, you'll be able to do that in a moment.

    r ad79f34 r: first commit
    s cfafc3d s: second commit
    s 83c9a8a s: third commit

    # Rebase 4d7fa87..83c9a8a onto 4d7fa87

Now save the changes, you'll jump into "reword" for first commit. Modify your message now, if you want. Save the changes, you'll jump into final commit message editor:

    This is a combination of 3 commits.
    # The first commit's message is:
    This commit message is final.

    # This is the 2nd commit message:

    s: second commit

    # This is the 3rd commit message:

    s: third commit

    # Please enter the commit message for your changes.

Feel free to change this final message as you wish. Finally save the changes.

     1 file changed, 3 insertions(+)
     create mode 100644 test
    Successfully rebased and updated refs/heads/feature-x.

#### Optional step 4: rebasing on top of latest master

You did that. Now you branch has all changes in one commit and that's definitely for good. But it is highly possible that while you're working on your `feature-x` one has made something useful on `master` branch and you need to update your branch to match latest changes. Tricky part in this is to put your commit on top of latest changes to keep history clean. In fact, you need to merge changes from `master` into `feature-x`. But what if we just take last commit on `master` and put your changes on top of that last commit?

    $ git checkout master
    $ git pull
    Already up-to-date.
    $ git checkout feature-x
    $ git rebase master
    First, rewinding head to replay your work on top of it...
    Applying: This commit message is final.

That's it! Now you have your latest `master` branch in your `feature-x` branch and your changes _on top of latest_ `master`.

#### Optional step 5: changing commit timestamp

One thing can make you unhappy about: if you melt all commits into first one you'll have one commit in history and its timestamp is equal to first commit timestamp. Imagine it took you 3 days to finish work, after which you squashed everything into one commit, in this case you can wish to change timestamp to reflect reality, it can be done easily:

    $ git commit --amend --date=""

`date=""` in here means you want latest commit to take current date as timestamp.

#### Optional step 6: pushing changes to remote

Push your changes to remote side, go and create a nice pull request now!

    $ git push origin feature-x

Remember, that using rebase you change history, that is why if you branch is present on remote side, git can refuse to accept your changes. Force can help you.

    $ git push -f

#### Afterwords

Use rebase wisely and carefuly. Remember that if someone else is working with you in your branch (or have a copy fetched) you should consider avoid using rebase until all the work is done in branch.

Yay!
