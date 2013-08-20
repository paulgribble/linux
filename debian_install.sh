# emacs
echo ""
echo "installing emacs"
apt-get -qq install emacs emacs-goodies-el

# firefox
echo ""
echo "installing firefox"
apt-get -qq remove iceweasel
echo "deb http://packages.linuxmint.com debian import" >> /etc/apt/sources.list
gpg --keyserver pgp.mit.edu --recv-keys 3EE67F3D0FF405B2
gpg --export 3EE67F3D0FF405B2 > 3EE67F3D0FF405B2.gpg
apt-key add ./3EE67F3D0FF405B2.gpg
rm ./3EE67F3D0FF405B2.gpg
apt-get -qq update
apt-get -qq install firefox

# developer tools
echo ""
echo "installing developer tools"
apt-get -qq install build-essential

# linux kernel headers
apt-get -qq install linux-headers-$(uname -r)

# git source control
echo ""
echo "installing git"
apt-get -qq install git

# R statistical package
echo ""
echo "installing R"
apt-get -qq install r-base ess

# octave
echo ""
echo "installing octave"
apt-get -qq install octave

# gsl, plotutils, gnuplot
echo ""
echo "installing gnu scientific library, plotutils, gnuplot"
apt-get -qq install libgsl0-dev plotutils gnuplot

# pandoc document conversion
echo ""
echo "installing pandoc"
apt-get -qq install pandoc

# LaTeX document typesetting system
echo ""
echo "installing LaTeX"
apt-get -qq install texlive-full texlive-fonts-extra cm-super texlive-latex-extra auctex texinfo
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
apt-get -qq install ttf-mscorefonts-installer
apt-get -qq install xfonts-100dpi xfonts-75dpi

# python scientific stack
echo ""
echo "installing python scientific stack"
sudo apt-get -qq install python-sip pyqt4-dev-tools
sudo apt-get -qq install python-numpy python-scipy python-matplotlib ipython ipython-doc ipython-notebook ipython-qtconsole python-sympy python-virtualenv python-dev python-pip
sudo apt-get -qq install python-pygame

# generate ssh key
echo ""
echo "generating ssh key"
echo "just hit <ENTER> when asked questions, until the procedure stops"
/bin/su - scicomp -c "ssh-keygen -t rsa"

# done
echo ""
echo "DONE!"

