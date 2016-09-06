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

# R
echo ""
echo "installing R"
sudo apt-get -qq install r-base ess

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
echo "texconfig paper letter"
sudo texconfig paper letter
echo "mktexlsr"
sudo mktexlsr

# fonts
echo ""
echo "installing some fonts"
wget http://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts
chmod +x install-getnonfreefonts
sudo ./install-getnonfreefonts
sudo getnonfreefonts garamond
sudo mktexlsr
sudo apt-get -qq install ttf-mscorefonts-installer
sudo apt-get -qq install xfonts-100dpi xfonts-75dpi

# libjpeg62
echo ""
echo "libjpeg62"
sudo apt-get -qq install libjpeg62

# update reps and upgrade any leftovers
echo ""
echo "update & upgrade"
sudo apt-get -qq update
sudo apt-get -qq upgrade

# add some aliases to .bashrc
echo ""
echo "adding aliases to .bashrc"
echo '\n# alias\nalias ll="/bin/ls -rtFlG"' >> ~/.bashrc

# done
echo ""
echo "DONE!"

