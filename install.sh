#!/bin/sh

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install git
git config --global user.name "Paul Gribble"
git config --global user.email paul@gribblelab.org

sudo apt-get install emacs emacs-goodies-el

sudo apt-get install auctex r-base ess
sudo apt-get install ntp build-essential libgsl0-dev plotutils gnuplot ssh gtk2-engines-pixbuf
sudo apt-get install octave gnome-session ruby rubygems sane python-gpgme

sudo apt-get install texlive-full texlive-fonts-extra cm-super texlive-latex-extra
sudo texconfig paper letter
wget http://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts
sudo ./install-getnonfreefonts
sudo getnonfreefonts garamond
sudo apt-get install ttf-mscorefonts-installer

cd ..
git clone git://orgmode.org/org-mode.git
cd org-mode
make
make doc
sudo make install
cd ..
cd ubuntu
cp dotemacs ~/.emacs

# python scientific stack
sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-doc ipython-notebook ipython-qtconsole python-virtualenv python-dev python-pip


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

