if isdirectory(expand(EverVimBundleDir('vim-eighties')))
    let g:eighties_enabled = 1
    let g:eighties_minimum_width = 80
    let g:eighties_extra_width = 0 " Increase this if you want some extra room
    let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
    let g:eighties_bufname_additional_patterns = ['fugitiveblame', 'NERD_tree_1', 'nerdtree', 'Tagbar'] " Defaults to [], 'fugitiveblame' is only an example. Takes a comma delimited list of bufnames as strings.
endif
if isdirectory(expand(EverVimBundleDir('GoldenView.Vim')))
    let g:goldenview__enable_default_mapping = 0
    let g:goldenview__enable_at_startup = 0
    " 1. split to tiled windows
    nmap <silent> <C-g>  <Plug>GoldenViewSplit

    " 2. quickly switch current window with the main pane
    " and toggle back
    nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
    nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

    " 3. jump to next and previous window
    nmap <silent> <Leader>gn  <Plug>GoldenViewNext
    nmap <silent> <Leader>gp  <Plug>GoldenViewPrevious

    nmap <silent> <Leader>gre <Plug>GoldenViewResize
endif
