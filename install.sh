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

# Claude Code settings
echo "Setting up Claude Code symlinks..."
mkdir -p ~/.claude
ln -sf $dir/claude/skills ~/.claude/skills
ln -sf $dir/claude/settings.json ~/.claude/settings.json
ln -sf $dir/claude/keybindings.json ~/.claude/keybindings.json
