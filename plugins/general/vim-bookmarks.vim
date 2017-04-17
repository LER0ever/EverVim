if isdirectory(expand("~/.vim/bundle/vim-bookmarks"))
    let g:bookmark_no_default_key_mappings = 1
    nmap <Leader>bb <Plug>BookmarkToggle
    nmap <Leader>bi <Plug>BookmarkAnnotate
    nmap <Leader>ba <Plug>BookmarkShowAll
    nmap <Leader>bj <Plug>BookmarkNext
    nmap <Leader>bk <Plug>BookmarkPrev
    nmap <Leader>bc <Plug>BookmarkClear
    nmap <Leader>bx <Plug>BookmarkClearAll
    nmap <Leader>bkk <Plug>BookmarkMoveUp
    nmap <Leader>bjj <Plug>BookmarkMoveDown
endif
