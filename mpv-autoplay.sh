#!/bin/bash

CLIP="$(xsel --clipboard)"
echo $CLIP
mpv --cache=1280 $CLIP
