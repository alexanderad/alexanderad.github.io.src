+++
author = "Alexander Shchapov"
categories = ["copter build log"]
date = 2014-08-18T20:36:42Z
description = ""
draft = false
slug = "copter-build-log-3-the-firmware"
tags = ["copter build log"]
title = "Copter Build Log 3: The Firmware"

+++

#### The Firmware
In fact sophisticated software that stands behind all the hardware which multi-rotor is build on is far more important that mentioned above hardware. I would say that without software the copter is just four motors with controllers tight to frame. I'm not sure now if I'm going to dive deeply into software part in future, but for now I stick to flash one of offered by enthusiasts.

The flight controller board in subject is [KK 2.1.5](http://www.hobbyking.com/hobbyking/store/__54299__hobbyking_kk2_1_5_multi_rotor_lcd_flight_control_board_with_6050mpu_and_atmel_644pa.html). Is is believed to be simple flight controller for newbies (like me) based on Atmega644 chip.

![KK 2.1.5](/content/images/2014/Aug/kk_board-1.jpg)

KK is designed to be flashed through ISP interface using [USBasp](http://www.fischl.de/usbasp/) programmer. 

> USBasp is a USB in-circuit programmer for Atmel AVR controllers. It simply consists of an ATMega88 or an ATMega8 and a couple of passive components. The programmer uses a firmware-only USB driver, no special USB controller is needed.

The [one I ordered](http://www.dx.com/p/51-avr-programmer-isp-download-usb-asp-downloader-148855#.U_JhibySwng) from DealExtreme costed me $5 and has 10 pin header, while KK board requires 6 pin header.

![6 and 10 pin headers](/content/images/2014/Aug/00_sch.png)

I don't know what is the reason behind the fact there are two different headers but that made me to reinvent 10-to-6 adapter, which looks ugly, but works as expected.

![Flashing setup](/content/images/2014/Aug/2014-08-18-21-24-21.jpg)

For flashing latest KK2.1 V1.18S1 firmware by [Steveis](http://www.rcgroups.com/forums/member.php?u=367321) I used [KKMulticopter Flashtool](http://lazyzero.de/en/modellbau/kkmulticopterflashtool) which looks like typical flash tool should look like and works perfectly.

![KKMulticopter Flashtool](/content/images/2014/Aug/Screen-Shot-2014-08-18-at-9-30-51-PM.png)

#### Next Steps
While I'm (still) waiting for more bullet connectors to arrive, I'm going to balance propellers in next log series. Prop balancing is done just before the first fligh but I have no choice and forced to change that order.