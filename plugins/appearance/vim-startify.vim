if isdirectory(expand(EverVimBundleDir("vim-startify")))
    function! PLATFORM_ICON_STRING()
        let platform_icon = ""
        let platform_string = ""
        if WINDOWS()
            let platform_icon = ""
            let platform_string = WINVERSION() . " (NT " . NTVERSION() . ")"
        elseif OSX()
            let platform_icon = ""
            let platform_string = "macOS " . OSXVERSION() . " (Darwin " . KERNELVERSION() . ")"
        elseif BSD()
            let platform_icon = ""
            let platform_string = BSDDistro() . " (" . KERNELVERSION() . ")"
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
            let platform_string = "Linux " . "[" . DISTROVERSION() . "] (" . KERNELVERSION() . ")"
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
        if exists('g:evervim_no_patched_fonts')
            let platform_icon = ''
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

    function! s:tic(icon)
        if !exists('g:evervim_no_patched_fonts')
            return a:icon
        else
            return ''
        endif
    endfunction

    let startify_icon_vim = s:tic('')
    let startify_icon_update = s:tic('')
    let startify_icon_vulkan = s:tic('')
    let startify_icon_love = s:tic('')
    let startify_icon_link = s:tic('')
    let startify_icon_github = s:tic('')
    let startify_icon_key = s:tic('')
    let startify_icon_watch = s:tic('')
    let startify_icon_color = s:tic('')
    let startify_icon_airline = s:tic('')
    let startify_icon_font = s:tic('')
    let startify_icon_fontsize = s:tic('')
    let startify_icon_server = s:tic('')

    let startify_vim_version = ""
    let startify_platform_string = PLATFORM_ICON_STRING()
    let startify_vim_components = "{" .
                \ (has('python3') == 1 ? "+Python3" : "-Python3") . "|" .
                \ (has('python') == 1 ? "+Python" : "-Python") . "|" .
                \ (has('lua') == 1 ? "+Lua" : "-Lua") . "|" .
                \ (has('clipboard') == 1 ? "+Clip" : "-Clip") .
                \ "}"
    let startify_evervim_lastupdated = startify_icon_update . " EverVim Updated " . (WINDOWS()?substitute(system('git -C %USERPROFILE%\.EverVim show --format="%ar" --quiet'), '[\n]\+', '', 'g'):substitute(system('git -C ~/.EverVim show --format="%ar" --quiet'), '[\n]\+', '', 'g'))
    if NVIM()
        if ONI()
            let startify_vim_version = startify_icon_vim . " Oni (NeoVim " . matchstr(execute('version'), 'NVIM \zs[^\n]*') . ")"
        elseif VIMR()
            let startify_vim_version = startify_icon_vim . " VimR (NeoVim " . matchstr(execute('version'), 'NVIM \zs[^\n]*') . ")"
        else
            let startify_vim_version = startify_icon_vim . " NeoVim " . matchstr(execute('version'), 'NVIM \zs[^\n]*')
        endif
    else
        let startify_vim_version = startify_icon_vim . " Vim " . substitute(v:version, '[\0]', '.', '')
    endif

    "highlight StartifyHeader ctermfg=120 guifg=#87ff87
    hi link StartifyHeader Function
    let g:startify_custom_header = [
                \' _______   ___      ___ _______   ________  ___      ___ ___  _____ ______      ',
                \'|\  ___ \ |\  \    /  /|\  ___ \ |\   __  \|\  \    /  /|\  \|\   _ \  _   \    ',
                \'\ \   __/|\ \  \  /  / | \   __/|\ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \   ',
                \' \ \  \_|/_\ \  \/  / / \ \  \_|/_\ \   _  _\ \  \/  / / \ \  \ \  \\|__| \  \  ',
                \'  \ \  \_|\ \ \    / /   \ \  \_|\ \ \  \\  \\ \    / /   \ \  \ \  \    \ \  \ ',
                \'   \ \_______\ \__/ /     \ \_______\ \__\\ _\\ \__/ /     \ \__\ \__\    \ \__\',
                \'    \|_______|\|__|/       \|_______|\|__|\|__|\|__|/       \|__|\|__|     \|__|',
                \'     ||=======================================================================||',
                \'     ' . s:boxed_header(startify_icon_vulkan . ' Welcome to EverVim. The Ultimate Vim Distribution for everyone.'),
                \'     ' . s:boxed_header(startify_icon_love . ' Made with <3 by LER0ever | ' . startify_icon_link . ' Freenode IRC: #EverVim'),
                \'     ' . s:boxed_header(startify_icon_github . ' Github Repository: https://github.com/LER0ever/EverVim'),
                \'     ||-----------------------------------------------------------------------||']

    if exists('g:evervim_welcome_message')
        let g:startify_custom_header = g:startify_custom_header + [
                    \'     ' . s:boxed_header(g:evervim_welcome_message),
                    \'     ||-----------------------------------------------------------------------||']
    endif
    if !exists('g:evervim_no_startify_detail')
        let g:startify_custom_header = g:startify_custom_header + [
                    \'     ' . s:boxed_header(startify_vim_version . " " . startify_vim_components),
                    \'     ' . s:boxed_header(startify_platform_string),
                    \'     ' . s:boxed_header(startify_icon_color . " Color Scheme: " .g:evervim_color_theme . " | " . startify_icon_airline . " Airline Theme: " . g:evervim_airline_theme),
                    \'     ' . s:boxed_header(startify_icon_font . " Gui Font: " . g:evervim_font . " | " . startify_icon_fontsize . " Size: " . g:evervim_font_size),
                    \'     ' . s:boxed_header(startify_icon_key . " Leader Key: `" . mapleader . "` | Leader Guide: <Space>"),
                    \'     ' . s:boxed_header(startify_evervim_lastupdated . ' | ' . startify_icon_watch . ' Now: ' . strftime("%y/%m/%d %H:%M", localtime()))]
        if (REMOTE())
            let g:startify_custom_header = g:startify_custom_header + [
                        \ '     ' . s:boxed_header(startify_icon_server . " NeoVim Remote Mode: " . v:servername)]
        endif

            let g:startify_custom_header = g:startify_custom_header + [
                    \'     ||=======================================================================||']
    endif
    let g:startify_files_number = 5
    let g:startify_list_order = [
                \ ['   [MRU] Most Recently Used files:'],
                \ 'files',
                \ ['   [MRU] in current directory:'],
                \ 'dir',
                \ ['   [CMD] Common Commands:'],
                \ 'commands',
                \ ['   Sessions:'],
                \ 'sessions',
                \ ['   Bookmarks:'],
                \ 'bookmarks',
                \ ]
    let g:startify_commands = [
                \ {'u': ['Update EverVim', 'call EverVimFullUpgrade()']},
                \ {'c': ['Edit EverVim Config', 'call EditEverVimConfig()']},
                \ {'l': ['See EverVim Changelog', 'call EverVimShowLog()']},
                \ ]
    if NVIM()
        let g:startify_commands = g:startify_commands + [{'t': ['Open Terminal', 'edit term://$SHELL | normal! i']}]
    endif
    autocmd Filetype startify setlocal nofoldenable
endif
