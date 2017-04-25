" Set configuration options for the statusline plugin vim-airline.
" Use the powerline theme and optionally enable powerline symbols.
" To use the symbols , , , , , , and .in the statusline
" segments add the following to your .vimrc.before.local file:
let g:airline_powerline_fonts=1
" If the previous symbols do not render for you then install a
" powerline enabled font.

" See `:echo g:airline_theme_map` for some more choices
" Default in terminal vim is 'dark'
if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
    set laststatus=2
    if !exists('g:airline_theme')
        let g:airline_theme = 'dracula' " 'molokai' 'solarized'
    endif
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline#extensions#bufferline#enabled = 1
    if !exists('g:airline_powerline_fonts')
        " Use the default set of separators with a few customizations
        let g:airline_left_sep=''  " Slightly fancier than '>'
        let g:airline_right_sep='' " Slightly fancier than '<'
    endif
endif
