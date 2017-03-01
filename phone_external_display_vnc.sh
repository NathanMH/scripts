#!/bin/bash

cvt 2560 1440
xrandr --newmode "2560x1440_60.00" 83.50 2560 1352 1480 1680 1440 803 809 831 -hsync +vsync
xrandr --addmode VIRTUAL1 2560x1440_60.00
xrandr --output VIRTUAL1 --mode 2560x1440_60.00 --left-of eDP1
x11vnc -clip 2560x1440+0+0


# Clean
xrandr --output VIRTUAL1 --off
xrandr --delmode VIRTUAL1 "2560x1440_60.00"
xrandr --rmmode "2560x1440_60.00"
