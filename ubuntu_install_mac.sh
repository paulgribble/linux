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

# for mac: http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el.cgi

sudo apt-get install indicator-cpufreq

# nvidia drivers?
sudo apt-add-repository ppa:ubuntu-x-swat/x-updates
sudo apt-get update
sudo apt-get install nvidia-current nvidia-settings
