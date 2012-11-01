#!/bin/sh

# MAC SECTION
# could be needed for wireless
sudo apt-get install linux-firmware-nonfree
sudo apt-get install broadcom-sta-common b43-fwcutter
# fan control
sudo apt-get install macfanctld
# nvidia graphics driver
sudo apt-get install nvidia-current
sudo dpkg-reconfigure nvidia-current

