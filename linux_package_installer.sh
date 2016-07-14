#!/bin/sh

apt-get update
apt-get install cmus -y # Music player
apt-get install emacs -y # Epub reader
apt-get install fbreader -y
apt-get install filezilla -y # Alternative?
apt-get install git -y # Git all the things!
apt-get install i3wm -y # Does it come with i3status/lock?
apt-get install mpv -y # Video player


# Mu4e plus dependencies (including optional pdf and html viewers)
apt-get install mu4e -y
apt-get install libwebkit-dev -y
apt-get install guile-2.0-dev -y
apt-get install libgmime-2.6-dev -y
apt-get install libxapian-dev -y
apt-get install offlineimap -y

apt-get install usbmount -y # For auto usb mounting
apt-get install vim-gnome -y # For copy/paste support
apt-get install xboxdrv -y # Controller support







