#!/bin/sh

sudo apt-get update

sudo apt-get upgrade

sudo apt-get install emacs emacs-goodies-el texlive-full texlive-fonts-extra cm-super texlive-latex-extra auctex r-base ess python-scipy python-numpy python-matplotlib python-setuptools ipython git ntp build-essential libgsl0-dev plotutils gnuplot ssh gtk2-engines-pixbuf python-gpgme selinux octave gnome-session ruby rubygems xmonad dmenu xmobar xscreensaver sane

sudo texconfig paper letter

git config --global user.name "Paul Gribble"
git config --global user.email paul@gribblelab.org

cp dotemacs ~/.emacs

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

sudo apt-get install ttf-mscorefonts-installer

cp xmobarrc ~/.xmobarrc
mkdir ~/.xmonad
cp xmonad.hs ~/.xmonad/xmonad.hs

sudo gem install mime
sudo gem install ruby-gmail

echo "done"

