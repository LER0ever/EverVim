if isdirectory(expand(EverVimBundleDir('vim-localvimrc')))
    let g:localvimrc_name = [
                \".EverVim.project",
                \".EverVim.Project",
                \".EverVim.local"
                \]
    let g:localvimrc_persistent = 1
    let g:localvimrc_sandbox = 0
endif
