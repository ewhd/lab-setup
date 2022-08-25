#!/bin/bash

# clone down my .dotfiles repo and run stow to set up symlinks

cd ~
git clone -recurse-submodules git@github.com:ewhd/.dotfiles.git
bash ./dotfiles/stow-script

chsh -s /bin/zsh

