# Begin /etc/profile.d/golang.sh

# Set GOROOT directory
GOROOT=/opt/go

# Adjust PATH
pathappend $GOROOT/bin

# Add to MANPATH
pathappend $GOROOT/man MANPATH

export GOROOT

# End /etc/profile.d/golang.sh
