# EverVim: The Ultimate Vim Distribution
![EverVim](https://img.shields.io/badge/Coded%20with-EverVim-bd93f9.svg?style=flat-square)
[![Build status](https://ci.appveyor.com/api/projects/status/v06dkj0d3irjxntr?svg=true)](https://ci.appveyor.com/project/LER0ever/evervim)

![evervim-header-1](https://i.imgur.com/T0CBBbk.png "EverVim with VimR on macOS")
![evervim-header-2](https://i.imgur.com/BK4vSuP.png "EverVim with GVIM on Windows")

* * *

## | [About](https://github.com/LER0ever/EverVim/blob/master/README.md#about) | [Installation](https://github.com/LER0ever/EverVim/blob/master/README.md#installation) | [Features](https://github.com/LER0ever/EverVim/blob/master/README.md#features) | [ScreenShots](https://github.com/LER0ever/EverVim/blob/master/README.md#screenshots) | [Documentation!](https://github.com/LER0ever/EverVim/wiki) | [License](https://github.com/LER0ever/EverVim/blob/master/README.md#license) |

## About
EverVim is the ultimate vim distribution that supports **NeoVim**, Vim, GVim and MacVim. It ships with tons of powerful features through vim plugins, which makes it easy to get started for both newcomers and experienced users.

The distribution is completely customizable using a ~/.EverVim.vimrc Vim config files.

Unlike other vim configuration such as spf13-vim, EverVim always keeps its modern features up-to-date. It uses [Vim-Plug](https://github.com/junegunn/vim-plug) as a plugin manager, which is async and is about 10x faster than Vundle. Keeping your plugins always up to date is just a command away. Vim-Plug uses a plugin bundle so that having lots of them won't mess up the folder structure.

The default config of EverVim is powerful and easy to use just out of the box, and is suitable for most vim users. Customization is easy as well. With `.EverVim.vimrc` file, you can customize the whole collection without modify the original files. That means you're still able to update the EverVim config using `git pull` without compromizing your own modification.

## Installation
### Detailed installation instruction
### | [Linux](https://github.com/LER0ever/EverVim/wiki/Installation-on-Linux) | [macOS](https://github.com/LER0ever/EverVim/wiki/Installation-on-macOS) | [Windows](https://github.com/LER0ever/EverVim/wiki/Installation-on-Windows) |
Finished the installation above?  
Before you started, please read the [Wiki](https://github.com/LER0ever/EverVim/wiki) to have an overview about some of EverVim's essential keybindings and plugins.

* * *

##### tl;dr. A brief how-to-install
<details>
<summary>0. Still</summary>
<b>You are strongly encouraged to use the full instruction on your first installation of EverVim.</b>
</details>
<details>
<summary>1. Install prerequisites and patched font</summary>
<li>Download and install the [Knack Nerd Font](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf)</li>
<li>Make **git, curl** is on your system. Python is also needed for Linux. Ctags is optional but highly recommended.</li>
</details>

<details>
<summary>2. Clone and Boot</summary>  
<li>git clone https://github.com/LER0ever/EverVim ~/.EverVim</li>
<li>cd .EverVim</li>
<li>sh Boot-EverVim.sh or .\Boot-EverVim.ps1</li>
</details>
<details>
<summary>3. Install the plugins</summary>
<li>Fire up your vim</li>
<li>Wait for Plugin Initiation to finish</li>
<li>Restart Vim.</li>
</details>

### Keep EverVim up-to-date
Press **`u`** at EverVim start screen. Configuration and plugins will be automatically updated.

# Features
### Cross Platform
- Support Vim 7.4.x, Vim 8, MacVim and of course Neovim
- Tested under all platforms
	- Windows (gvim, vim, neovim-qt, Oni)
	- Linux (neovim, neovim-qt, vim, gvim, neovim-gtk, Oni)
	- macOS (MacVim, VimR, Oni)
	- FreeBSD (GVim, NeoVim)
	- Android (neovim, vim under Termux)

### Powerful & Easy to use
- Easy to setup, just one bash away.
- All the wonderful features are enabled out of the box
- Full IDE-like support for C/C++, Go, Rust, javascript, etc.
- Use YouCompleteMe by default, neocomplete as a windows fallback
- NERDTree as file explorer
- Git operation right inside vim with fugitive
- Syntastic provides syntax check on every save
- Jump to anywhere in 2 key with EasyMotion
- Markdown CTags support via markdown2ctags

### Pleasant to code
- Fancy Dracula Theme
- Lightline for statusline and tabline
- TagBar for code navigation
- Startup screen to pick up recent files (using Startify)

### Asynchronous
- Use Vim-Plug as vim plugin manager
	- Parallel installation
	- 10x faster initial PlugInstall
- FZF as Fuzzy Finder
    - Support fuzzy search for Files, Code, Git history, Help tags and much more.

### Other Awesomeness
- Collaboration using CoVim
- AGit for detailed git log

## ScreenShots
#### Updated screenshots at [Wiki/Gallery](https://github.com/LER0ever/EverVim/wiki/Gallery)

## [Documentation](https://github.com/LER0ever/EverVim/wiki)

## License
EverVim is licensed under **Apache 2.0**. See [LICENSE.md](https://github.com/LER0ever/EverVim/blob/master/LICENSE.md) for details.

This repo contains part of code from [spf13-vim](https://github.com/spf13/spf13-vim), 
which is also licensed under [Apache 2.0](https://github.com/spf13/spf13-vim/blob/3.0/LICENSE.txt)
