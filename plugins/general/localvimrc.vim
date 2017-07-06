if isdirectory(expand('~/.vim/bundle/vim-localvimrc'))
    let g:localvimrc_name = [
                \".EverVim.project",
                \".EverVim.local",
                \".EverVim.exrc"
                \]
    let g:localvimrc_persistent = 1
    let g:localvimrc_sandbox = 0
endif
