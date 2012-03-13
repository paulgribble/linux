sudo apt-get install emacs texlive-full texlive-fonts-extra cm-super texlive-latex-extra auctex r-base ess python-scipy python-numpy python-matplotlib ipython git ntp build-essential libgsl0-dev plotutils gnuplot ssh gtk2-engines-pixbuf python-gpgme selinux octave

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

echo "done"

