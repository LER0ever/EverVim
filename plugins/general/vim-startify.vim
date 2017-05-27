if isdirectory(expand("~/.vim/bundle/vim-startify"))
    function! PLATFORM_ICON_STRING()
        let platform_icon = ""
        let platform_string = ""
        if WINDOWS()
            let platform_icon = ""
            let platform_string = "Windows"
        elseif OSX()
            let platform_icon = ""
            let platform_string = "macOS " . OSXVERSION()
        elseif BSD()
            let platform_icon = ""
            let platform_string = "BSD"
        elseif LINUX()
            let platform_icon = DISTRO() =~ "Arch" ? "" :
                        \ DISTRO() =~ "CentOS" ? "" :
                        \ DISTRO() =~ "Debian" ? "" :
                        \ DISTRO() =~ "Fedora" ? "" :
                        \ DISTRO() =~ "Mint" ? "" :
                        \ DISTRO() =~ "SUSE" ? "" :
                        \ DISTRO() =~ "Ubuntu" ? "" :
                        \ DISTRO() =~ "Gentoo" ? "" :
                        \ DISTRO() =~ "Elementary" ? "" :
                        \ ""
            let platform_string = "Linux [" . DISTROVERSION() . "]"
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

    let startify_version_string = ""
    let startify_platform_string = PLATFORM_ICON_STRING()
    if ONI()
        let startify_version_string = "Oni"
    elseif NVIM()
        let startify_version_string = "NeoVim " . matchstr(execute('version'), 'NVIM \zs[^\n]*')
    else
        let startify_version_string = " Vim " . substitute(v:version, '[\0]', '.', '')
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
                \'     || Welcome to EverVim. The Ultimate Vim Distribution for everyone.       ||',
                \'     || Made with <3 by LER0ever https://i.yirong.ml                          ||',
                \'     || Github Repository: https://github.com/LER0ever/EverVim                ||',
                \'     ||=======================================================================||',
                \'        ' . startify_version_string . ' on ' . startify_platform_string . ' | ' . strftime("%y/%m/%d %H:%M", localtime())]
    autocmd FileType startify normal zR
endif
