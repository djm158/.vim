#!/usr/bin/env bash

ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.tmux.conf ~/.tmux.conf
ln -s ~/.vim/.ctags ~/.ctags
ln -s ~/.vim/.gitignore_global ~/.gitignore_global

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

