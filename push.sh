#!/bin/bash
cp ~/.vimrc .
cp ~/.bash_profile .
cp ~/.gitignore_global
git add .
git commit -m "Updated Dotfiles"
git push
