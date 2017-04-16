if isdirectory(expand('~/.vim/bundle/vim-lastplace'))
    let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
    let g:lastplace_ignore_buftype = "quickfix"
endif
