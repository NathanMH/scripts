#!/bin/bash

EXTERNAL_OUTPUT=HDMI-1
INTERNAL_OUTPUT=eDP-1

# If we don't have a file, start at zero
if [ ! -f "~/tmp/monitor_mode.dat" ] ; then
    monitor_mode="all"

# Otherwise read the value from the file
else
    monitor_mode='cat ~/tmp/monitor_mode.dat'
fi

if [ $monitor_mode = "all" ] ; then
    monitor_mode="EXTERNAL"
    xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
elif [ $monitor_mode = "EXTERNAL" ] ; then
    monitor_mode="INTERNAL"
    xrandr --output $EXTERNAL_OUTPUT --off --output $INTERNAL_OUTPUT --auto
elif [ $monitor_mode = "INTERNAL" ] ; then
    monitor_mode="CLONES"
    xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
else
    monitor_mode="all"
    xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
fi

echo "${monitor_mode}" > ~/tmp/montor_mode.dat
