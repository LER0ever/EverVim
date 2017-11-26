if isdirectory(expand(EverVimBundleDir('vim-choosewin')))
    nmap - <Plug>(choosewin)
    let g:choosewin_overlay_enable = 1
endif
