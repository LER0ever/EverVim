#!/usr/bin/env bash

echo 'Welcome to EverVim, a powerful & modern vim distribution'
echo 'Booting EverVim ...'

echo 'Soft-Linking Vim Config'
ln -s "$(pwd)"/.vimrc ~/.vimrc
ln -s "$(pwd)"/.vimrc.local ~/.vimrc.local
ln -s "$(pwd)"/.vimrc.bundles ~/.vimrc.bundles
ln -s "$(pwd)"/.vimrc.bundles.local ~/.vimrc.bundles.local
ln -s "$(pwd)"/.vimrc.gui ~/.gvimrc
ln -s "$(pwd)"/.vimrc.before ~/.vimrc.before
ln -s "$(pwd)"/.vimrc.before.local ~/.vimrc.before.local

echo 'Creating Directories ...'
mkdir -p ~/.vim/bundle/
mkdir -p ~/.config/

echo 'Downloading Vim-Plug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'Downloading Markdown2Ctags ...'
curl -fLo ~/.vim/tools/markdown2ctags/markdown2ctags.py --create-dirs \
    https://raw.githubusercontent.com/jszakmeister/markdown2ctags/master/markdown2ctags.py
sed -i '1 s/python/python2/' ~/.vim/tools/markdown2ctags/markdown2ctags.py
chmod +x ~/.vim/tools/markdown2ctags/markdown2ctags.py

echo 'Linking Neovim Config'
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
ln -s ~/.gvimrc ~/.config/nvim/ginit.vim

echo 'All done with this script, now run vim/neovim and execute ":PlugInstall"'
