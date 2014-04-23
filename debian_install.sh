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
#    /bin/sh debian_install.sh
# if you already have sudo priviledges on your username you
# can skip steps 1, 2, 3

echo "setting /etc/apt/sources.list"
sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
sudo cp debian.sources.list /etc/apt/sources.list

echo "updating"
sudo apt-get -qq update
sudo apt-get -qq upgrade

# git source control
echo ""
echo "installing git"
sudo apt-get -qq install git
git config --global user.name "Paul Gribble"
git config --global user.email paul@gribblelab.org

# developer tools
echo ""
echo "installing developer tools"
sudo apt-get -qq install build-essential

# linux kernel headers
echo ""
echo "installing linux kernel headers"
sudo apt-get -qq install linux-headers-$(uname -r)

# emacs
echo ""
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

# R statistical package
echo ""
echo "installing R"
sudo apt-get -qq install r-base ess

# octave
echo ""
echo "installing octave"
sudo apt-get -qq install octave

# gsl, plotutils, gnuplot
echo ""
echo "installing gnu scientific library, plotutils, gnuplot"
sudo apt-get -qq install libgsl0-dev plotutils gnuplot

# pandoc document conversion
echo ""
echo "installing pandoc"
sudo apt-get -qq install pandoc

# LaTeX document typesetting system
echo ""
echo "installing LaTeX"
sudo apt-get -qq install texlive-full texlive-fonts-extra cm-super texlive-latex-extra auctex texinfo
texconfig paper letter
mktexlsr

# fonts
echo ""
echo "installing a bunch of fonts"
wget http://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts
chmod +x install-getnonfreefonts
./install-getnonfreefonts
getnonfreefonts garamond
mktexlsr
sudo apt-get -qq install ttf-mscorefonts-installer
sudo apt-get -qq install xfonts-100dpi xfonts-75dpi
echo "enabling autohinting and sub-pixel smoothing"
sudo ln -s /etc/fonts/conf.avail/10-autohint.conf /etc/fonts/conf.d/
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/

# python scientific stack
#echo ""
#echo "installing python scientific stack"
#sudo apt-get -qq install python-sip pyqt4-dev-tools
#sudo apt-get -qq install python-numpy python-scipy python-matplotlib ipython ipython-doc ipython-notebook ipython-qtconsole python-sympy python-virtualenv python-dev python-pip
#sudo apt-get -qq install python-pygame

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

# generate ssh key
echo ""
echo "generating ssh key"
echo "just hit <ENTER> when asked questions, until the procedure stops"
ssh-keygen -t rsa

# laptop?
while true; do
    read -p "install laptop-mode-tools? (y/n) " yn
    case $yn in
        [Yy]* ) echo ""; echo "installing laptop-mode-tools"; sudo apt-get -qq install laptop-mode-tools; break;;
        [Nn]* ) exit;;
        * ) echo "please answer y or n.";;
    esac
done

# update reps and upgrade any leftovers
echo ""
echo "update & upgrade"
sudo apt-get -qq update
sudo apt-get -qq upgrade

# remove rpcbind and sshd, we don't need them
echo ""
echo "removing rpcbind and openssh-server"
sudo apt-get -qq remove rpcbind
sudo apt-get -qq remove openssh-server

# managed network
echo ""
echo "configuring network interface to be managed"
sudo echo -e "[main]\nplugins=ifupdown,keyfile\n\n[ifupdown]\nmanaged=true" > /etc/NetworkManager/NetworkManager.conf

# install google-chrome
echo ""
echo "installing google-chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable

# add a nice alias to .bashrc
echo ""
echo "adding aliases to .bashrc"
echo $'\n# alias\nalias ll="/bin/ls -rtFlG"' >> ~/.bashrc

# done
echo ""
echo "DONE!"

