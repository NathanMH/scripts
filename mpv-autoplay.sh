#!/bin/bash

CLIP="$(xsel --clipboard)"
echo $CLIP
mpv $CLIP
