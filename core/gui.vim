" GUI Settings {

    " GVIM (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if !exists("g:evervim_no_big_font")
            if LINUX() && has("gui_running")
                set guifont=Knack\ Nerd\ Font\ Regular\ 11,Noto\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
            elseif OSX() && has("gui_running")
                set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
            elseif WINDOWS() && has("gui_running")
                set guifont=Knack_NF:h10,Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
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
            Guifont Knack Nerd Font:h12
            "call rpcnotify(1, 'Gui', 'Font', 'Knack Nerd Font 20')
        else
            Guifont Knack NF:h10
        endif
    endif

" }
