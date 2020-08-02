#!/bin/sh

apt-get update
apt-get install git -y # Git
apt-get install i3wm -y # Does it come with i3status/lock?
apt-get install i3status -y # Status bar+
apt-get install i3blocks -y
apt-get install i3 -y # Extras?
apt-get install default-jre -y # Java runtime environment
apt-get install cmake -y
apt-get install xbacklight -y


# Other Applications
apt-get install cmus -y # Music Player
apt-get install emacs -y # The other vim
apt-get install firefox -y # Better browsing
apt-get install mpv -y # Video player
apt-get install vim -y # One true Editor
apt-get install weechat -y # IRC/Slack chat
apt-get install zeal -y # Offline programming documentatio

# Other
apt-get install feh -y # Background image manager
apt-get install powertop -y # Power stats
apt-get install tlp -y # Power management
apt-get install usbmount -y # For auto usb mounting
apt-get install youtube-dl -y # Youtube downloader
apt-get install xboxdrv -y # Controller support

# Programming Languages
apt-get install lua5.2 -y # Get 5.3 if available
apt-get install python3.5 -y
apt-get install python-pip -y
apt-get install ruby2.3 -y # Get 2.3 if available
