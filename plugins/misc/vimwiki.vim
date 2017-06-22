if isdirectory(expand("~/.vim/bundle/vimwiki"))
    let g:vimwiki_folding = 'syntax'
    nmap <Leader>ww <Plug>VimwikiIndex
    nmap <Leader>wti <Plug>VimwikiTabIndex
    nmap <Leader>ws <Plug>VimwikiUISelect
    nmap <Leader>wi <Plug>VimwikiDiaryIndex
    nmap <Leader>wd <Plug>VimwikiMakeDiaryNote
    nmap <Leader>wtd <Plug>VimwikiTabMakeDiaryNote
    nmap <Leader>wyd <Plug>VimwikiMakeYesterdayDiaryNote
    nmap <Leader>wg <Plug>VimwikiDiaryGenerateLinks
    map <Leader>we :Vimwiki2HTML<CR>
    map <Leader>wb :Vimwiki2HTMLBrowse<CR>
endif
