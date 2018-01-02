" GUI Settings {

    " GVIM (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if !exists("g:evervim_no_big_font")
            if LINUX() && has("gui_running")
                execute 'set guifont=' . fnameescape(g:evervim_font . ' ') . g:evervim_font_size . ',Noto\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14'
            elseif OSX() && has("gui_running")
                execute 'set guifont=' . fnameescape(g:evervim_font) . ':h' . g:evervim_font_size . ',Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14'
            elseif WINDOWS() && has("gui_running")
                execute 'set guifont=' . substitute(g:evervim_font, ' ', '_', 'g') . ':h' . g:evervim_font_size . ',Consolas:h10,Courier_New:h10'
            endif
        endif
    else
        if &term == 'xterm' || &term == 'screen' || &term == 'fbterm'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

    " NeoVim-Qt (here instead of ginit.vim)
    if exists('g:GuiLoaded')
        if !WINDOWS()
            execute 'Guifont ' . g:evervim_font . ':h' . g:evervim_font_size
        else
            execute 'Guifont ' . g:evervim_font . ':h' . g:evervim_font_size
        endif
    endif

    if REMOTE()
        set termguicolors " Useful when using Neovim Remote and nvim-qt remote mode
    endif

    if NVIMGTK()
        call rpcnotify(1, 'Gui', 'Font', g:evervim_font . ' ' . g:evervim_font_size)
        call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
    endif

    if VIMR()
        set termguicolors
    endif

    if NVIM()
        let g:terminal_color_0 =  "#282a36"
        let g:terminal_color_1 =  "#ff5555"
        let g:terminal_color_2 =  "#50fa7b"
        let g:terminal_color_3 =  "#f1fa8c"
        let g:terminal_color_4 =  "#bd93f9"
        let g:terminal_color_5 =  "#ff79c6"
        let g:terminal_color_6 =  "#8be9fd"
        let g:terminal_color_7 =  "#e9e9f4"
        let g:terminal_color_8 =  "#282a36"
        let g:terminal_color_9 =  "#ff5555"
        let g:terminal_color_10 = "#50fa7b"
        let g:terminal_color_11 = "#f1fa8c"
        let g:terminal_color_12 = "#bd93f9"
        let g:terminal_color_13 = "#ff79c6"
        let g:terminal_color_14 = "#8be9fd"
        let g:terminal_color_15 = "#e9e9f4"
        let g:terminal_color_background = g:terminal_color_0
        let g:terminal_color_foreground = g:terminal_color_7
        if &background == "light"
            let g:terminal_color_background = g:terminal_color_7
            let g:terminal_color_foreground = g:terminal_color_2
        endif
    endif

" }
