#!/bin/sh

echo "updating ubuntu"
sudo apt-get -qq update
sudo apt-get -qq upgrade

# could be needed for wireless esp on macs
sudo apt-get install linux-firmware-nonfree

# for macs fan control
sudo apt-get install macfanctld

# git
echo "installing git"
sudo apt-get -qq install git
git config --global user.name "Paul Gribble"
git config --global user.email paul@gribblelab.org

# emacs
echo "installing emacs"
sudo apt-get -qq install emacs emacs-goodies-el texinfo

# org-mode
echo "installing emacs org-mode"
cd ..
git clone git://orgmode.org/org-mode.git
cd org-mode
make
make doc
sudo make install
cd ..
cd ubuntu
sudo cp org-exp-bibtex.el /usr/share/emacs/site-lisp/
sudo apt-get install bibtex2html
cp dotemacs ~/.emacs

# for mac: http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el.cgi

# R
echo "installing R"
sudo apt-get -qq install r-base ess

# development
echo "installing development tools"
sudo apt-get -qq install ntp build-essential gtk2-engines-pixbuf

# octave
echo "installing octave"
sudo apt-get -qq install octave

# gsl, plotting stuff
echo "installing gsl and plotting stuff"
sudo apt-get -qq install libgsl0-dev plotutils gnuplot

# misc system utils
echo "installing system utils"
sudo apt-get -qq install gnome-session sane ssh

# LaTeX
echo "installing LaTeX"
sudo apt-get -qq install texlive-full texlive-fonts-extra cm-super texlive-latex-extra auctex
sudo texconfig paper letter
wget http://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts
chmod +x install-getnonfreefonts
sudo ./install-getnonfreefonts
sudo getnonfreefonts garamond
sudo apt-get -qq install ttf-mscorefonts-installer

# Pandoc
sudo apt-get install pandoc

# python scientific stack
echo "installing python scientific stack"
sudo apt-get -qq install python-sip pyqt4-dev-tools
sudo apt-get -qq install python-numpy python-scipy python-matplotlib ipython ipython-doc ipython-notebook ipython-qtconsole python-sympy python-virtualenv python-dev python-pip
sudo apt-get -qq install python-pygame

# OTHER

#sudo add-apt-repository ppa:zedtux/naturalscrolling
#sudo apt-get update
#sudo apt-get install naturalscrolling

#sudo apt-get install xmonad dmenu xmobar xscreensaver
#cp xmobarrc ~/.xmobarrc
#mkdir ~/.xmonad
#cp xmonad.hs ~/.xmonad/xmonad.hs

#sudo gem install mime
#sudo gem install ruby-gmail

echo "done"

