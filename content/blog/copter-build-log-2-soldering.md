+++
author = "Alexander Shchapov"
categories = ["copter build log"]
date = 2014-08-12T21:40:39Z
description = ""
draft = false
slug = "copter-build-log-2-soldering"
tags = ["copter build log"]
title = "Copter Build Log 2: Soldering ESCs"

+++

#### Connectors Drama
Today I finished soldering of ESCs to engines connections and ESCs to power connectors. All of those require [Bullet 3.5mm Gold Connectors](http://www.nex-robotics.com/index.php?option=com_virtuemart&page=shop.product_details&flypage=flypage.tpl&product_id=928&Itemid=45) and I failed to calculate proper amount in advance (oh, shi). The thing is that needed amount is _at least_ 3 x 4 female (for ESCs to motors) + 4 x 2 male (ESCs to power) making in total 12 pairs, while I, being naïve, bought 20 pcs (or 10 _pairs_). 

The sad part of story is that in Ukraine a _pair of those_ costs something like $1.3, while from China you can get 10 pairs for $1.8 (paying extra 15 to 40 days for waiting for your order).

Beside that the process itself is not a rocket science, that is why no higher education is needed.

_Nice wiring diagram (from [Collection of Random](http://cfedk.host.cs.st-andrews.ac.uk/site/))_
![](/content/images/2014/Aug/03-wiringdiagram.jpg)

_Given_
![](/content/images/2014/Aug/2014-07-28-21-02-06.jpg)

_Result_
![](/content/images/2014/Aug/2014-08-13-00-23-34.jpg)

#### Next steps
* Wait for more connectors to arrive :-)
* Solder "1 to 4" power "multiplexors"