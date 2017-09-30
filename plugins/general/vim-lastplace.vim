if isdirectory(expand(EverVimBundleDir('vim-lastplace')))
    let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
    let g:lastplace_ignore_buftype = "quickfix"
endif
