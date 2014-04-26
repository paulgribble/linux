#!/bin/sh

# FIRST you will need to do the following:
# 1. open a ROOT terminal
# type adduser <yourusername> sudo
#   (where <yourusername> is your short username)
#   (if you don't know it, open a regular terminal and
#    type whoami)
# 2. logout
# 3. log back in
# 4. open a regular terminal and start this script by typing
#    /bin/sh ubuntu_install.sh
# if you already have sudo priviledges on your username you
# can skip steps 1, 2, 3

echo ""
echo "updating"
sudo apt-get -qq update
sudo apt-get -qq upgrade

# git
echo ""
echo "installing git"
sudo apt-get -qq install git
git config --global user.name "YOUR_NAME_GOES_HERE"
git config --global user.email YOUR_EMAIL_ADDRESS_GOES_HERE

# gnome fallback
echo ""
echo "installing gnome-session-fallback"
sudo apt-get -qq install gnome-session-fallback

# development
echo ""
echo "installing development tools"
sudo apt-get -qq install build-essential

# kernel source
echo ""
echo "installing linux kernel headers"
sudo apt-get -qq install linux-headers-$(uname -r)

# emacs
echo "installing emacs"
sudo apt-get -qq install emacs emacs-goodies-el
# more emacs stuff
sudo cp org-exp-bibtex.el /usr/share/emacs/site-lisp/
sudo apt-get install -qq bibtex2html
cp dotemacs ~/.emacs

# org-mode
echo ""
echo "installing orgmode"
sudo apt-get -qq install org-mode

# R
echo ""
echo "installing R"
sudo apt-get -qq install r-base ess

# octave
echo ""
echo "installing octave"
sudo apt-get -qq install octave

# gsl, plotting stuff
echo ""
echo "installing gsl and plotting stuff"
sudo apt-get -qq install libgsl0-dev plotutils gnuplot

# pandoc document conversion
echo ""
echo "installing pandoc"
sudo apt-get -qq install pandoc

# LaTeX
echo ""
echo "installing LaTeX"
sudo apt-get -qq install texlive-full texlive-fonts-extra cm-super texlive-latex-extra auctex texinfo
sudo texconfig paper letter
echo "mktexlsr"
sudo mktexlsr

# fonts
echo ""
echo "installing a bunch of fonts"
wget http://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts
chmod +x install-getnonfreefonts
sudo ./install-getnonfreefonts
sudo getnonfreefonts garamond
sudo mktexlsr
sudo apt-get -qq install ttf-mscorefonts-installer
sudo apt-get -qq install xfonts-100dpi xfonts-75dpi

# install anaconda python stack
echo ""
echo "installing anaconda"
wget http://repo.continuum.io/archive/Anaconda-1.9.2-Linux-x86_64.sh
bash Anaconda-1.9.2-Linux-x86_64.sh
conda update conda
conda update anaconda
conda update ipython

# tor
echo ""
echo "installing tor"
sudo apt-get -qq install tor

# libjpeg62
echo ""
echo "libjpeg62"
sudo apt-get -qq install libjpeg62

# update reps and upgrade any leftovers
echo ""
echo "update & upgrade"
sudo apt-get -qq update
sudo apt-get -qq upgrade

# install google-chrome
echo ""
echo "installing google-chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable

# add some aliases to .bashrc
echo ""
echo "adding aliases to .bashrc"
echo $'\n# alias\nalias ll="/bin/ls -rtFlG"' >> ~/.bashrc

# laptop?
while true; do
    read -p "install laptop-mode-tools? (y/n) " yn
    case $yn in
        [Yy]* ) echo ""; echo "installing laptop-mode-tools"; sudo apt-get -qq install laptop-mode-tools; break;;
        [Nn]* ) exit;;
        * ) echo "please answer y or n.";;
    esac
done

# done
echo ""
echo "DONE!"

