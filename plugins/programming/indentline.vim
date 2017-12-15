if isdirectory(expand(EverVimBundleDir("indentLine")))
    " Vim
    let g:indentLine_color_term = 156

    "GVim
    let g:indentLine_color_gui = '#A4E57E'

    " none X terminal
    let g:indentLine_color_tty_light = 7 " (default: 4)
    let g:indentLine_color_dark = 1 " (default: 2)
    let g:indentLine_enabled = 1
    let g:indentLine_char = '│' " 
    let g:indentLine_fileTypeExclude = ['startify', '' , 'help', 'nerdtree', 'tutor', 'calendar']
endif
