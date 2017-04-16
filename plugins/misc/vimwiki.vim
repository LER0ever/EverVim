if isdirectory(expand("~/.vim/bundle/vimwiki"))
    let g:vimwiki_folding = 'syntax'
    map <Leader>vwe :Vimwiki2HTML<CR>
    map <Leader>vwb :Vimwiki2HTMLBrowse<CR>
endif
