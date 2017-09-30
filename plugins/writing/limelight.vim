if isdirectory(expand(EverVimBundleDir('limelight.vim')))
    let g:limelight_default_coefficient = 0.7
    let g:limelight_paragraph_span = 0
    let g:limelight_priority = -1

    " Color defs, for default dracula
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'

    " Keymap
    nmap <Leader>wl <Plug>(Limelight)

    " Goyo Integration
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
endif
