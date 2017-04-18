#!/bin/bash

# Create a file to hold machine-specific zshell config
touch ~/zshrc-local.zsh.inc

#The directory where our dot files live
dir=~/Developer/vim-settings
#The directory where we are linking our dot files too
targetDir=~/
#List of dot files to move
files="vimrc zshrc tmux.conf tmuxline.conf"

for file in $files; do
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file $targetDir/.$file
done
