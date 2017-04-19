#!/usr/bin/env bash

echo 'Welcome to EverVim, a powerful & modern vim distribution'
echo 'Booting EverVim ...'

cd ~

if [ ! -d ".EverVim" ]; then
    echo "Cloning into ~/.EverVim ..."
    git clone https://github.com/LER0ever/EverVim ~/.EverVim
fi

# Ensure we have .config
mkdir -p ~/.config/

echo 'Soft-Linking Vim/NeoVim Config ...'
ln -sfnv ~/.EverVim ~/.vim
ln -sfnv ~/.EverVim ~/.config/nvim
ln -sfnv ~/.EverVim/vimrc ~/.EverVim/init.vim
ln -sfnv ~/.EverVim/core/gui.vim ~/.EverVim/ginit.vim

if [ ! -f ".EverVim.vimrc" ]; then
    echo "Copied EverVim configuration sample to ~/.EverVim.vimrc"
    cp ~/.EverVim/.EverVim.vimrc.sample ~/.EverVim.vimrc
fi

echo 'Downloading Vim-Plug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -f ".ctags" ]; then
    echo 'Configuring CTags ...'
    ln -sfnv ~/.EverVim/tools/ctags/ctags ~/.ctags
fi

echo 'All done with this script, now run vim/neovim and execute ":PlugInstall"'
