#!/bin/sh

echo "updating ubuntu"
sudo apt-get update
sudo apt-get upgrade

# git
echo "installing git"
sudo apt-get -qq install git
git config --global user.name "Paul Gribble"
git config --global user.email paul@gribblelab.org

# emacs
echo "installing emacs"
sudo apt-get -qq install emacs emacs-goodies-el

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
cp dotemacs ~/.emacs

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
sudo ./install-getnonfreefonts
sudo getnonfreefonts garamond
sudo apt-get -qq install ttf-mscorefonts-installer

# python scientific stack
sudo apt-get -qq install python-numpy python-scipy python-matplotlib ipython ipython-doc ipython-notebook ipython-qtconsole python-virtualenv python-dev python-pip


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

