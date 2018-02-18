+++
author = "Alexander Shchapov"
categories = ["copter build log"]
date = 2014-08-23T18:29:14Z
description = ""
draft = false
slug = "copter-build-log-6-propellers"
tags = ["copter build log"]
title = "Copter Build Log 6: Propellers and Maiden Flight"

+++

#### Propellers
Size is main characteristic of propeller and it is expressed by two figures, for example, _10 x 4.5_, which mean _length_ and _pitch_ correspondingly in inches.

Prop size illustration from [R/C Airplane World](http://www.rc-airplane-world.com/propeller-size.html) clarifies that a bit:
![](http://www.rc-airplane-world.com/image-files/propeller-pitch.gif)

In short: the bigger are those values the more thrust engine can produce. However, the more thrust to be gained the more power engine must generate. If propeller is too large engine can overheat or simply not be able to spin it at required speed. If propeller is too small, engine works underloaded still producing not enough thrust to pull the model up.

#### Balancing
In simple case unbalanced propeller has one blade heavier than other. During high-speed rotations that difference results in vibrations. Last can affect gyro and accelerometer, for example. For video flyers unbalanced prop also creates wobbles or "[jello effect](http://en.wikipedia.org/wiki/Rolling_shutter)". In real life if you don't care much about video, in most cases PI-controller is able to compensate unbalanced props. However, in this "course" we can't omit balancing stage, at least, it is interesting :-)

I don't know about expensive ones, but most of cheap plastic props are unbalanced out of the box. I think, the reason for that is the process how they are made (stamped, I guess?). I have several sets of _10 x 4.5_, _12 x 4.5_ and _8 x 4.5_ propellers. 10 inch props are "main size" as it was calculated during design sprint, 12 and 8 inch props are for tests and adjustments. First set used on this quad was perfectly _unbalanced_.  Balancing procedure is quite easy. Ideal balancer looks something like this:
![](http://3.bp.blogspot.com/-vW8fykbfFBM/UBbniOly1UI/AAAAAAAABYk/u9VqKZOrlCo/s1600/DSC04336.jpg) 
This one (as see on [Tao of RC](http://blog.pannuhuone.pro/2012/07/diy-propeller-balancer.html)) has neat frame with magnets. Mine is much simplier: I'm using similar blue balancer (on picture in the center) being placed between two wine glasses instead of fancy magnet holders. The goal of balancing is to get propeller to stabilize in any position (at any angle) you set it, so that it does not perform any further revolutions. I just used tape to add weight to lighter blade and got 4 balanced props in 10 minutes of time.

#### First Flight (not really)
Ok, as we have everything set up now I decided to spend Friday's evening for maiden flight. I engaged Artem to participate as iphone camera operator, chief adviser and simply interested in copter building. 

To make long story short, we've spent hour and a half trying to take it off without any particular luck. The main problem was that instead of taking off copter did some kind of flip just of the ground, damaging the propellers and doing all kind of tricks but not actual take off. Of course, that was disappointing but we had tried to do differential diagnosis using two heads to fix that. We tried exchanging props, recalibrating accelerometer, recalibrating throttle range on ESCs, trying soft take off, etc, etc. Finially we mentioned that in case of _very_ gentle throttle copter takes off (well, tries to) using exactly same three of four motors, so that three motors are hanging in the air, while one is glued to ground. We exchanged motors, but that didn't help much, as exactly same right upper beam was standing on the ground while other three were hanging 3-4 cm over 

We run out of ideas we can try and as dark fell we finished experiments without successfull maiden flight recorded.

Later that day I discovered the source of the issue: it was one of ESCs which I used while setting up copter for the first time. It seems I changed unintentionally some of the settings in it (most likely, startup mode from _normal_ to _soft_). Startup mode regulates how fast motor gets power requested by throttle stick. _Normal_ means motor reacts to change almost immediatly, while _soft_ means it gets current gradually, during several seconds period. Reset of settings to default for all ESCs resolved issue and I got it flying as expected. Unfortunately I don't have recording, but I'll make one soon.

#### Next steps
Well, real maiden flight. PI-controller and auto-level adjustments.