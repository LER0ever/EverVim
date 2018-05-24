if isdirectory(expand(EverVimBundleDir('seiya.vim'))) 
    if exists("g:evervim_transparent_bg")
        let g:seiya_auto_enable = 1
    endif
    " Unfortunately no toggle yet
    nnoremap <leader>wte :SeiyaEnable<CR>
    nnoremap <leader>wtd :SeiyaDisable<CR>
endif
