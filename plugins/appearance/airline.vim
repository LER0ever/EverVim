if isdirectory(expand(EverVimBundleDir("vim-airline")))
    set laststatus=2
    if !exists('g:evervim_airline_theme')
        let g:airline_theme = 'dracula' " 'molokai' 'solarized'
    else
        let g:airline_theme = g:evervim_airline_theme
    endif
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s:'
    if !exists('g:evervim_no_patched_fonts')
        " Use the default set of separators with a few customizations
        let g:airline_powerline_fonts = 1
        let g:airline_left_sep=''
        let g:airline_left_alt_sep=''
        let g:airline_right_sep=''
        let g:airline_right_alt_sep=''
        let g:airline#extensions#tabline#left_sep = ""
        let g:airline#extensions#tabline#left_alt_sep = ''
        let g:airline#extensions#tabline#right_sep = ""
        let g:airline#extensions#tabline#right_alt_sep = ''
        let g:airline#extensions#tabline#buffers_label = ''
        let g:airline#extensions#tabline#tabs_label = ''
    endif
endif
