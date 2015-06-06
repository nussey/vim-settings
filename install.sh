#!/bin/bash

#The directory where our dot files live
dir=~/vim-settings
#The directory where we are linking our dot files too
targetDir=~/
#List of dot files to move
files="vimrc zshrc"

for file in $files; do
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file $targetDir/.$file
done
