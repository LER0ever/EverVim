if isdirectory(expand("~/.vim/bundle/vim-startify"))
    let startify_version_string = ""
    let startify_platform_string = WINDOWS() ? "Windows" :
                \ WSL() ? "WSL" . " [" . DISTROVERSION() . " on Windows 10]" :
                \ CROS() ? "Chrome OS" . " [" . DISTROVERSION() . " with Chronos]" :
                \ LINUX() ? "Linux" . " [" . DISTROVERSION() . "]" :
                \ OSX() ? " macOS " . OSXVERSION() :
                \ TERMUX() ? "Android":
                \ "Unix"
    if NVIM()
        let startify_version_string = "NeoVim"
    else
        let startify_version_string = "Vim " . v:version
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
