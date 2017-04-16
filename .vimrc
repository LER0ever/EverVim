" Modeline and Notes {
" EverVim is a vim distribution based on spf13-vim(Apache License)
" EverVim is Licensed under
" * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
" }

" EverVim Configuration Root Directory
let $evervim_root = "~/.EverVim"

" Core Config
source $evervim_root/core/core.vim

" Plugins {
" }

" GUI Settings {

    if filereadable(expand('~/.gvimrc'))
        source ~/.gvimrc
    else
        if filereadable(expand('~/.vimrc.gui'))
            source ~/.vimrc.gui
        endif
    endif
" }

" Functions {
    source $evervim_root/core/functions.vim
" }

" Use fork vimrc if available {
    if filereadable(expand("~/.vimrc.fork"))
        source ~/.vimrc.fork
    endif
" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

