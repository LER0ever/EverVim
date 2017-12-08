if isdirectory(expand(EverVimBundleDir('vim-minimap')))
    let g:minimap_highlight='Visual'
    let g:minimap_show='<nop>'
    let g:minimap_update='<nop>'
    let g:minimap_close='<nop>'
    let g:minimap_toggle='<leader>wm'
endif
