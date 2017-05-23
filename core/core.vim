" EverVim Core Config

" Identify platform {
    source $evervim_root/core/platform.vim
" }

" Basics {
    source $evervim_root/core/basics.vim
" }

" Windows Compatible {
    source $evervim_root/core/windows.vim
" }

" Arrow Key Fix {
    source $evervim_root/core/arrowkey-fix.vim
" }

" Functions {
    source $evervim_root/core/functions.vim
" }

" Use config if available {
    if filereadable(expand("~/.EverVim.vimrc"))
        source ~/.EverVim.vimrc
    endif
" }

" Use bundles config {
    if filereadable(expand($evervim_root . "/plugins/plugins.vim"))
        source $evervim_root/plugins/plugins.vim
    endif
" }

" General {
    source $evervim_root/core/general.vim
" }

" Vim UI {
    source $evervim_root/core/vimui.vim
" }

" Formatting {
    source $evervim_root/core/formatting.vim
" }

" Session {
    source $evervim_root/core/session.vim
" }

" Key (re)Mappings {
    source $evervim_root/core/keymap.vim
" }
"
" Plugin Configuration {
    source $evervim_root/plugins/plugin-config.vim
" }
"
" GUI Config {
    source $evervim_root/core/gui.vim
" }
