+++
author = "Alexander Shchapov"
categories = ["copter build log"]
date = 2014-09-29T19:51:11Z
description = ""
draft = false
slug = "copter-life-log-11-multiwii"
tags = ["copter build log"]
title = "Copter Life Log 11: Multiwii"

+++

#### Foreword
If you have ever tried to keep writing something like a blog on regular basis you know how hard that can be. It is so easy postpone one post a day, then do something different other day, then it is Friday, when you obviously have no time or else. Finally you bail out of all that. One of possible ways to avoid that is a keep a rhythm. There is simple rule you can try to maintain for rhythm: word count per week, or, if you want, per day. 

[Ghost blog platform](https://github.com/TryGhost/Ghost), I'm using here has a nice word count feature right on post edit page. It says that I have 113 words which means I'm almost half way through for today's goal :-)

#### Multiwii
Ok, let's make an overview for last several days of my multicopter-side life. First of all, I received shiny new flight controller, it is [Multiwii](http://www.multiwii.com/) by [Ready to Fly Quads](http://witespyquad.gostorego.com/), which has missing features:

* it is built on Atmega2560
* it has amazing set of base sensors: MPU6050 Six Axis Gyro/Accelerometer, MS5611 Barometer, HMC5883L Magnetometer
* 4 (four!) serial interfaces on board for different perephirals, like GPS, Bluetooth, LCD or whatever-you-invent
* it's firmware is [opensource](https://code.google.com/p/multiwii/) and has growing communtity of funs
* USB interface on board for programming

![](/content/images/2014/Sep/2014-09-27-13-25-59.jpg)

I spent day soldering and mounting the board instead of retired KK board and couple hours for test flights. What can I say (as a newbie pilot): it is a very nice replacement. It works perfectly almost on stock, out of the box settings, it produces absolutely stabilized and responsive flight at the same time. I'll add here more details as soon as I get them. Remember those words I promised? :-)

#### LEDs Story
One of tricky parts in first (I believe in following also) flights is to keep in mind constantly changing orientation of quad. When it heads front, pitch means "going forward and back", roll means "going left and right". When it yaws 90 degrees, pitch starts meaning "going left and right", roll equals to "going forward and backward". You can expand that as it basically can turn at any angle in 360 degrees at any moment!

There are several possible mitigations for that to make your life easier. You can mount props of different colors: say forward are orange, while back are green. You can use different colors of beams: mine forward are red, while that ones the denote back are black. Also there is an option for LEDs. I mounted simple 12V [SMD LED Strip](http://www.ebay.com/itm/5M-5050-RGB-SMD-LED-Waterproof-Flexible-Strip-300-LEDs-44-Key-IR-Remote-/180992529478), of two colors. Needless to say, the mounting procedure is quite easy.

![](/content/images/2014/Sep/2014-09-20-17-57-22.jpg)

The result in dark (not so impressive, as in wild):

![](/content/images/2014/Sep/2014-09-29-22-46-00.jpg)

Next in queue is camera mount and its stabilization servo.