if isdirectory(expand("~/.vim/bundle/vim-startify"))
    function! PLATFORM_ICON_STRING()
        let platform_icon = ""
        let platform_string = ""
        if WINDOWS()
            let platform_icon = ""
            let platform_string = WINVERSION() . " (" . NTVERSION() . ")"
        elseif OSX()
            let platform_icon = ""
            let platform_string = "macOS " . OSXVERSION() . " (Darwin " . KERNELVERSION() . ")"
        elseif BSD()
            let platform_icon = ""
            let platform_string = "BSD"
        elseif LINUX()
            let distro = DISTRO()
            let platform_icon = distro =~ "Arch" ? "" :
                        \ distro =~ "CentOS" ? "" :
                        \ distro =~ "Debian" ? "" :
                        \ distro =~ "Fedora" ? "" :
                        \ distro =~ "Mint" ? "" :
                        \ distro =~ "SUSE" ? "" :
                        \ distro =~ "Ubuntu" ? "" :
                        \ distro =~ "Gentoo" ? "" :
                        \ distro =~ "Elementary" ? "" :
                        \ ""
            let platform_string = "Linux " . KERNELVERSION() . " [" . DISTROVERSION() . "]"
            if WSL()
                let platform_icon = ""
                let platform_string = "WSL [" . DISTROVERSION() . " on Windows 10]"
            elseif CROS()
                let platform_icon = ""
                let platform_string = "Chrome OS [" . DISTROVERSION() . " with Chronos]"
            elseif ANDROID()
                let platform_icon = ""
                let platform_string = "Android"
            endif
        else
            let platform_icon = ""
            let platform_string = "UNIX"
        endif
        return platform_icon . " " . platform_string
    endfunction

    function! s:boxed_header(line)
        let boxed_header = ""
        if (strwidth(a:line) <= 70)
            let boxed_header = a:line . repeat(' ', 70 - strwidth(a:line))
        else
            let boxed_header = strpart(a:line, 0, 70)
        endif
        let boxed_header = "|| " . boxed_header . "||"
        return boxed_header
    endfunction

    let startify_vim_version = ""
    let startify_platform_string = PLATFORM_ICON_STRING()
    let startify_vim_components = "{" .
                \ (has('python3') == 1 ? "+Python3" : "-Python3") . "|" .
                \ (has('python') == 1 ? "+Python" : "-Python") . "|" .
                \ (has('lua') == 1 ? "+Lua" : "-Lua") .
                \ "}"
    let startify_evervim_lastupdated = " EverVim Updated " . (WINDOWS()?substitute(system('git -C %HOMEPATH%\.EverVim show --format="%ar" --quiet'), '[\n]\+', '', 'g'):substitute(system('git -C ~/.EverVim show --format="%ar" --quiet'), '[\n]\+', '', 'g'))
    if NVIM()
        if ONI()
            let startify_vim_version = " Oni (NeoVim " . matchstr(execute('version'), 'NVIM \zs[^\n]*') . ")"
        elseif VIMR()
            let startify_vim_version = " VimR (NeoVim " . matchstr(execute('version'), 'NVIM \zs[^\n]*') . ")"
        else
            let startify_vim_version = " NeoVim " . matchstr(execute('version'), 'NVIM \zs[^\n]*')
        endif
    else
        let startify_vim_version = " Vim " . substitute(v:version, '[\0]', '.', '')
    endif

    highlight StartifyHeader ctermfg=120 guifg=#87ff87
    let g:startify_custom_header = [
                \' _______   ___      ___ _______   ________  ___      ___ ___  _____ ______      ',
                \'|\  ___ \ |\  \    /  /|\  ___ \ |\   __  \|\  \    /  /|\  \|\   _ \  _   \    ',
                \'\ \   __/|\ \  \  /  / | \   __/|\ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \   ',
                \' \ \  \_|/_\ \  \/  / / \ \  \_|/_\ \   _  _\ \  \/  / / \ \  \ \  \\|__| \  \  ',
                \'  \ \  \_|\ \ \    / /   \ \  \_|\ \ \  \\  \\ \    / /   \ \  \ \  \    \ \  \ ',
                \'   \ \_______\ \__/ /     \ \_______\ \__\\ _\\ \__/ /     \ \__\ \__\    \ \__\',
                \'    \|_______|\|__|/       \|_______|\|__|\|__|\|__|/       \|__|\|__|     \|__|',
                \'     ||=======================================================================||',
                \'     ' . s:boxed_header(' Welcome to EverVim. The Ultimate Vim Distribution for everyone.'),
                \'     ' . s:boxed_header(' Made with <3 by LER0ever |  https://i.yirong.ml'),
                \'     ' . s:boxed_header(' Github Repository: https://github.com/LER0ever/EverVim'),
                \'     ||-----------------------------------------------------------------------||',
                \'     ' . s:boxed_header(startify_vim_version . " " . startify_vim_components),
                \'     ' . s:boxed_header(startify_platform_string),
                \'     ' . s:boxed_header(startify_evervim_lastupdated . " |  ". strftime("%y/%m/%d %H:%M", localtime())),
                \'     ||=======================================================================||']
    let g:startify_files_number = 5
    autocmd FileType startify normal zR
endif
