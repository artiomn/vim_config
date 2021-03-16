#!/bin/sh

git submodule init && git submodule update
mkdir -p ~/.vim
cp -a * ~/.vim
mv ~/.vim/vimrc.vim ~/.vimrc
