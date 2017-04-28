if isdirectory(expand("~/.vim/bundle/rainbow/"))
    let g:rainbow_active = 0 "1 if you want to enable it on vim start
    nnoremap <Leader>rb :RainbowToggle<CR>
endif
