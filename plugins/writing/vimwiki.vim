if isdirectory(expand(EverVimBundleDir("vimwiki")))
    let g:vimwiki_folding = 'syntax'
    nmap <Leader>vw <Plug>VimwikiIndex
    nmap <Leader>vti <Plug>VimwikiTabIndex
    nmap <Leader>vs <Plug>VimwikiUISelect
    nmap <Leader>vi <Plug>VimwikiDiaryIndex
    nmap <Leader>vd <Plug>VimwikiMakeDiaryNote
    nmap <Leader>vtd <Plug>VimwikiTabMakeDiaryNote
    nmap <Leader>vyd <Plug>VimwikiMakeYesterdayDiaryNote
    nmap <Leader>vg <Plug>VimwikiDiaryGenerateLinks
    map <Leader>ve :Vimwiki2HTML<CR>
    map <Leader>vb :Vimwiki2HTMLBrowse<CR>
endif
