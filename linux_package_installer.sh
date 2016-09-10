#!/bin/sh

apt-get update
apt-get install cmus -y # Music player
apt-get install emacs -y # The other vim
apt-get install filezilla -y # Alternative?
apt-get install git-all -y # Git
apt-get install i3wm -y # Does it come with i3status/lock?
apt-get install mpv -y # Video player
apt-get install default-jre # Java runtime environment
apt-get install cmake


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

# Languages
apt-get install lua5.2 -y # Get 5.3 if available
apt-get install python3.5 -y
apt-get install ruby2.1 -y # Get 2.3 if available





