#!/usr/bin/env bash

echo 'Welcome to EverVim, a powerful & modern vim distribution'
echo 'Booting EverVim ...'

if [ -d "~/.EverVim" ]; then
	echo "Cloning into ~/.EverVim ..."
	git clone https://github.com/LER0ever/EverVim ~/.EverVim
	cd ~/.EverVim
fi

# Ensure we have .config
mkdir -p ~/.config/

echo 'Soft-Linking Vim/NeoVim Config ...'
ln -s ~/.EverVim ~/.vim
ln -s ~/.EverVim/vimrc ~/.EverVim/init.vim
ln -s ~/.EverVim/core/gui.vim ~/.EverVim/ginit.vim

echo 'Downloading Vim-Plug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'Downloading Markdown2Ctags ...'
curl -fLo ~/.vim/tools/markdown2ctags/markdown2ctags.py --create-dirs \
    https://raw.githubusercontent.com/jszakmeister/markdown2ctags/master/markdown2ctags.py
sed -i '1 s/python/python2/' ~/.vim/tools/markdown2ctags/markdown2ctags.py
chmod +x ~/.vim/tools/markdown2ctags/markdown2ctags.py

echo 'All done with this script, now run vim/neovim and execute ":PlugInstall"'
