#!/bin/sh

sudo apt-get update

sudo apt-get upgrade

sudo apt-get install emacs emacs-goodies-el texlive-full texlive-fonts-extra cm-super texlive-latex-extra
sudo apt-get install auctex r-base ess
sudo apt-get install python-scipy python-numpy python-matplotlib python-setuptools ipython
sudo apt-get install git ntp build-essential libgsl0-dev plotutils gnuplot ssh gtk2-engines-pixbuf
sudo apt-get install octave gnome-session ruby rubygems sane python-gpgme

sudo apt-get install xmonad dmenu xmobar xscreensaver

sudo texconfig paper letter

git config --global user.name "Paul Gribble"
git config --global user.email paul@gribblelab.org

cd ..
git clone git://orgmode.org/org-mode.git
cd org-mode
make
make doc
sudo make install
cd ..
cd ubuntu

sudo add-apt-repository ppa:zedtux/naturalscrolling
sudo apt-get update
sudo apt-get install naturalscrolling

cp dotemacs ~/.emacs

sudo apt-get install ttf-mscorefonts-installer

cp xmobarrc ~/.xmobarrc
mkdir ~/.xmonad
cp xmonad.hs ~/.xmonad/xmonad.hs

sudo gem install mime
sudo gem install ruby-gmail

echo "done"

