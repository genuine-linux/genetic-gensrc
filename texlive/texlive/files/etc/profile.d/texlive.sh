# Begin /etc/profile.d/texlive.sh

TEXARCH=$(uname -m | sed -e 's/i.86/i386/' -e 's/$/-linux/') &&

pathappend /opt/texlive/2019/texmf-dist/doc/man  MANPATH
pathappend /opt/texlive/2019/texmf-dist/doc/info INFOPATH
pathappend /opt/texlive/2019/bin/$TEXARCH

# End /etc/profile.d/texlive.sh
