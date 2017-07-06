if isdirectory(expand("~/.vim/bundle/vimwiki"))
    let g:vimwiki_folding = 'syntax'
    nmap <Leader>vww <Plug>VimwikiIndex
    nmap <Leader>vwti <Plug>VimwikiTabIndex
    nmap <Leader>vws <Plug>VimwikiUISelect
    nmap <Leader>vwi <Plug>VimwikiDiaryIndex
    nmap <Leader>vwd <Plug>VimwikiMakeDiaryNote
    nmap <Leader>vwtd <Plug>VimwikiTabMakeDiaryNote
    nmap <Leader>vwyd <Plug>VimwikiMakeYesterdayDiaryNote
    nmap <Leader>vwg <Plug>VimwikiDiaryGenerateLinks
    map <Leader>vwe :Vimwiki2HTML<CR>
    map <Leader>vwb :Vimwiki2HTMLBrowse<CR>
endif
