#!/bin/bash

# Download copied url with yt-dl
CLIP="$(xsel --clipboard)"
echo "YouTube URL: " $CLIP
youtube-dl -o "~/Downloads/%(id)s" $CLIP

# Get name of new file and play with mpv
CLIPID="$(youtube-dl --get-id $CLIP)"
FILELOC="/home/musicnate/Downloads/${CLIPID}"

echo "File path:" $FILELOC

mpv "$FILELOC"
