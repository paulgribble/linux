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
#sudo apt-get install python-scipy python-numpy python-matplotlib python-setuptools ipython
#git clone git://gist.github.com/3433915.git
git clone git://gist.github.com/3688478.git
cd 3688478
chmod +x install.sh
./install.sh
echo "export PATH=\$HOME/local/python/bin:\$PATH" >> ~/.bashrc

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

