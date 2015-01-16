#!/bin/bash
cp ~/.vimrc .
cp ~/.bash_profile .
git add .
git commit -m "Updated Dotfiles"
git push
