if isdirectory(expand(EverVimBundleDir('vim-windowswap')))
    let g:windowswap_map_keys = 0
    nnoremap <silent> <leader>wsm :call WindowSwap#MarkWindowSwap()<CR>
    nnoremap <silent> <leader>wsd :call WindowSwap#DoWindowSwap()<CR>
    nnoremap <silent> <leader>wss :call WindowSwap#EasyWindowSwap()<CR>
endif
