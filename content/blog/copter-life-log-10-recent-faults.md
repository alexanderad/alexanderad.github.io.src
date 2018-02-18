+++
author = "Alexander Shchapov"
categories = ["copter build log"]
date = 2014-09-15T18:43:31Z
description = ""
draft = false
slug = "copter-life-log-10-recent-faults"
tags = ["copter build log"]
title = "Copter Life Log 10: Broken Things"

+++

#### Things are Broken

It's time to change term "build" into "life", I guess, since we've everything built now and current stage is actual multicopter usage. Recent weeks I did dozen of flights in different locations and under different weather conditions. Basically learning how to flight, performing crazy acrobatic aerotricks, making tiny PI controller adjustments and other improvements.

In this post I want to summarize faults and constructive problems I observed during those weeks of usage.

#### Broken Screws in Propeller Mount
Since my NTM motor has a short shaft it requires additional propeller mounting kit. After several flights vibrations or collisions broke couple of screws:
![](/content/images/2014/Sep/2014-09-09-22-28-29-1.jpg)
**Solution**: screws replacement.

#### Severely Damaged Propellers
Propellers can be easily broken in a short time by a newbie pilot like me. First set survived for two weeks and got damage incompatible with further life or flight. Although a set of new ones cost as much as $2.5 I intentionally used my first set until it was completely wasted. Even with absolutely awful condition of props copter is able to take off, however it is almost impossible to control the flight.
**Solution**: new set of propellers.  
**Side note conclusion**: you can omit balancing of propellers in case if you are novice; that is just a waste of time at this point.

#### Unscrewing Motor Mount
Motors are mounted using long screws which tend to unscrew on their own. This problem has two sides: on the one side I can't screw them harded, since frame beams are made of aluminium-like material which is soft enough. On the other side motors mounted not hard enough unscrew themselves in a blink of eye.
![](/content/images/2014/Sep/2014-09-15-21-10-35.jpg)
**Solution**: screws replacement + [Grower](https://en.wikisource.org/wiki/Grover,_John_William_(DNB01))'s [spring washer](https://www.google.com/search?q=spring+washer&es_sm=93&source=lnms&tbm=isch&sa=X&ei=cAMXVKv9J-HqyQOshoG4Bw&ved=0CAgQ_AUoAQ&biw=1906&bih=952)

> A _split washer_ or a _spring lock washer_ is a ring split at one point and bent into a helical shape. This causes the washer to exert a spring force between the fastener's head and the substrate, which maintains the washer hard against the substrate and the bolt thread hard against the nut or substrate thread, creating more friction and _resistance to rotation_.

#### Lost Motor Shaft Washer
As a result of hard collision in a crash rotor disassembled with stator and small washer that holds them together was lost. Motor seems to survive and its geometry is preserved, but I have no idea where I can find something similar to that lost washer.
![](/content/images/2014/Sep/2014-09-15-21-27-48.jpg)
**Solution**: motor replacement with spare one. Luckily I had ordered five of them.

#### More Flight Videos
Also I've mounted iphone using ribbons and bootlaces and recorded couple of videos. Because of such barbarous mounting phone ideally receives all vibrations produced by whole construction so that you can enjoy jello effect while watching.

<iframe width="1280" height="720" src="//www.youtube.com/embed/E38ZUwPigk0?rel=0" frameborder="0" allowfullscreen></iframe>

<iframe width="1280" height="720" src="//www.youtube.com/embed/Mms4iluLYCo?rel=0" frameborder="0" allowfullscreen></iframe>