+++
author = "Alexander Shchapov"
date = 2014-07-26T09:00:00Z
description = ""
draft = false
slug = "copter-build-log-intro"
tags = ["quadcopter"]
title = "Copter Build Log 0: Intro"
+++

#### What it is all About

So here I'm going to post the log of Awesome Quadro-copter build. I can't promise you anything, like, keeping it up to date. Anyway, I'll try to do that.

#### The Idea

Right now, I'm trying to recover in my mind what made me thinking about building a quadro. At some point I found nice inspirational video. That reminds me of my institute, which I, say, hated at moment of my studying in there. Things changed since that and if I were able to time machine back I would have changed my attitude slightly... Heh, that does not matter much anymore.
Beside that now I understand that building a quadro and posting a build log for that is perfect topic for Bachelor's Degree diploma in my KPI's Computer Science faculty.

It has all the required sections covered:

* programmable micro-controller, which serves as a flight controller for copter
* control theory heavily applied in order to achieve stable flight and reacting on accelerometer and gyro data
* selection and comparison of components, here we have a wide choice, since we need motors, ESCs or electronic speed controllers, batteries and flight controller itself; frame and all other stuff required for mounting; components in this list have a set of certain parameters, which are dependent on each other
* despite fact most flight controllers come pre-flashed with firmware they are still programmable through standard interfaces and there is a lot of space for creativity
  Building the software is probably a topic for Master's if you want to dive more into scientific part rather than engineering.

Anyway, this video was kinda decisive argument in this idea of building own quadro. I can't say for sure now what is more important, the process of building a quadro or the result itself.

<iframe width="853" height="480" src="//www.youtube.com/embed/w2itwFJCgFQ?rel=0" frameborder="0" allowfullscreen></iframe>

#### Quick Start

I started the research on that and after two weeks of reading forums, watching dozens of videos, playing with copters calculators I made an order with first, initial list of components. That was not an easy part, believe me. At some point trying to conform components in a perfect way I understood that I can fail to make and order at all.

#### Requirements

I need copter to thrust at least 500 grams of payload, it is FPV camera. Total weight of copter without any payload is 1.2 kg. I'm also expecting flight duration up to 10 minutes.

#### Buy List

I'm skipping transmitter/receiver and battery charger since one friend of mine has all that and can borrow me for a while.

* Frame: X550 Glass Fiber Frame
* Motors: 4 x NTM Prop Drive Series 28-30S 900 kv / 270W
* ESCs: 4 x TURNIGY Plush 25A
* Flight Controller: KK 2.1.5 with 6050MPU gyro/acc and ATMega 664
* Batteries: ZIPPY Compact 2200mAh 3S 25C Lipo Pack

I've made in total three separate orders from different sources one of them has already arrived on Friday and two are on their way to Ukraine. I'm going to make an overview of frame assembly in next post.
