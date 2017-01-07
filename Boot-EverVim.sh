#!/usr/bin/env bash

echo 'Welcome to EverVim, a full featured vim configuration based on spf13-vim'
echo 'Booting EverVim ...'

echo 'Soft-Linking Vim Config'
ln -s "$(pwd)"/.vimrc ~/.vimrc
ln -s "$(pwd)"/.vimrc.local ~/.vimrc.local
ln -s "$(pwd)"/.vimrc.bundles ~/.vimrc.bundles
ln -s "$(pwd)"/.vimrc.before ~/.vimrc.before

echo 'Creating Directories ...'
mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle/
echo 'Cloning Vundle Plugin Manager to bundle ...'
git clone https://github.com/VundleVim/Vundle.vim.git vundle

echo 'Linking Neovim Config'
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

echo 'All done with this script, now run vim and execute ":BundleInstall"'
echo 'You can use RunEverVim.bat to make vim for Windows portable .'
