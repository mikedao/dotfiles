#!/bin/bash
cp ~/.vimrc .
cp ~/.bash_profile .
cp ~/.gitignore_global .
cp ~/.tmux.conf .
git add .
git commit -m "Updated Dotfiles $(date)"
git push
