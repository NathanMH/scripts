#!/bin/bash

xrandr --output VIRTUAL1 --off
xrandr --delmode VIRTUAL1 "2560x1440_60.00"
xrandr --rmmode VIRTUAL1 "2560x1440_60.00"

