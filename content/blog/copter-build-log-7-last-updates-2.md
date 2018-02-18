+++
author = "Alexander Shchapov"
date = 2014-08-31T19:40:17Z
description = ""
draft = false
slug = "copter-build-log-7-last-updates-2"
tags = ["quadcopter"]
title = "Copter Build Log 7: Last Updates"
+++

I've spent last two days in [Verkhovyna](http://goo.gl/bhGISJ) tuning PI parameters, learning how to flight (well, to perform controlled flight).

Since I'm completely new flyer it is a bit difficult for me to judge flying characteristics of newly build quad. According to readings I did it performs pretty good even at default PI values. I observe no oscillations, however it is difficult to land and hold altitude, which could mean that PI gains and limits still require adjustments. I think, I'll post whole investigation results as soon as I got some meaningful result out of tuning. For now I'm posting here a little test flights captured on video. In video I'm testing stick responsiveness, that is why copter trembles, decends and ascends randomly :-) after series of flights I got more or less stable result, however Julia was tired of filming at that point, so here couple of videos we've recorded:

<iframe width="960" height="720" src="//www.youtube.com/embed/b0MvE52WOBE?rel=0&amp;vq=hd720" frameborder="0" allowfullscreen></iframe>

<iframe width="960" height="720" src="//www.youtube.com/embed/bP0GgxhhCZM?rel=0&amp;vq=hd720" frameborder="0" allowfullscreen></iframe>

Also, I've made several upgrades to copter itself. I got power distribution board, which replaced [hand-made one](http://darednaxella.name/img/2014/Aug/2014-08-19-20-12-58.jpg): ![](/img/2014/Aug/2014-08-31-22-13-05.jpg) This also made possible to shorten ESC power plugs which resulted whole setup to become neat.

Also IMAX charger 4 mm tulips to XT-connector baked while connected to battery (made a lot of smoke and scared Julia! :-) ![](/img/2014/Aug/2014-08-29-18-32-43.jpg)

Last, I marked batteries with numbers, as it is easy to miss one which is already used. By the way, it seems that batteries were factory charged at 60%, so that after first full cycle I got ~10 minutes of flight time per battery.

_Marked batteries and new direct tuplips to XT60 connector._ ![](/img/2014/Aug/2014-08-31-22-22-58.jpg)
