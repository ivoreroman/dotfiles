#!/bin/zsh

brew update
brew upgrade

# Emacs
brew install emacs --with-cocoa --with-gnutls --with-librsvg --with-imagemagick@6

# Misc Packages
brew install tree
