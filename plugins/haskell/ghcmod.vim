if isdirectory(expand(EverVimBundleDir('ghcmod-vim')))
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
endif
