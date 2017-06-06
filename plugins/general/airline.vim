" Set configuration options for the statusline plugin vim-airline.
" Use the powerline theme and optionally enable powerline symbols.
" If the symbols do not render for you then install a
" powerline enabled font.

" See `:echo g:airline_theme_map` for some more choices
" Default in terminal vim is 'dark'
if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
    set laststatus=2
    if !exists('g:evervim_airline_theme')
        let g:airline_theme = 'dracula' " 'molokai' 'solarized'
    else 
        let g:airline_theme = g:evervim_airline_theme
    endif
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline#extensions#bufferline#enabled = 1
    if !exists('g:airline_no_powerline')
        " Use the default set of separators with a few customizations
        let g:airline_left_sep=''  " Slightly fancier than '>'
        let g:airline_right_sep='' " Slightly fancier than '<'
    endif
endif
