#!/bin/zsh

brew update
brew upgrade

install_emacs() {
  brew install emacs --with-cocoa --with-gnutls --with-librsvg --with-imagemagick@6
}

install_misc_packages() {
  brew install tree
}

case "$1" in
    emacs)
	install_emacs
	;;
    misc)
	install_misc_packages
	;;
    *)
	echo "Invalid argument."
	exit 1
	;;
esac
