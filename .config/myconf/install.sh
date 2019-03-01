#!/bin/zsh

brew update
brew upgrade

install_emacs() {
  brew install emacs --with-cocoa --with-gnutls --with-librsvg --with-imagemagick@6
}

install_misc_packages() {
  brew install tree
  brew install ledger
  brew install pandoc
}

install_python() {
  brew install pyenv
  pyenv install 2.7.14
  pyenv install 3.7.1
  pyenv global 2.7.14 3.7.1
  pyenv rehash
}

case "$1" in
    emacs)
	install_emacs
	;;
    misc)
	install_misc_packages
	;;
    python)
	install_python
	;;
    *)
	echo "Invalid argument."
	exit 1
	;;
esac
