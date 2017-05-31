" Identify platform 
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! BSD()
    return system('uname -s') =~ "BSD"
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction
silent function! WSL()
    return LINUX() && system('uname -r') =~ 'Microsoft'
endfunction
silent function! CROS()
    return LINUX() && (system('cat /proc/version') =~ 'cros' || system('ls /dev') =~ 'cros')
endfunction
silent function! ANDROID()
    return isdirectory(expand('/system/priv-app'))
endfunction
silent function! KERNELVERSION()
    return substitute(system('uname -r'), '[\n]\+', '', 'g')
endfunction
silent function! DISTRO()
    return substitute(system('lsb_release -si'), '[\n]\+', '', 'g')
endfunction
silent function! DISTROVERSION()
    return executable('dpkg') ? substitute(system('lsb_release -sd'), '[\n|\"]\+', '', 'g'):
                \ substitute(system('lsb_release -sdr'), '[\n|\"]\+', '', 'g')
endfunction
silent function! OSXVERSION()
    return substitute(system("echo $(sw_vers -productVersion)"), '[\n]\+', '', '')
endfunction
silent function! NVIM()
    return has('nvim')
endfunction
silent function! GVIM()
    return has('gui_running')
endfunction
silent function! NVIMQT()
    return exists('g:GuiLoaded')
endfunction
silent function! ONI()
    return exists('g:gui_oni')
endfunction
silent function! VIMR()
    return has('gui_vimr')
endfunction
silent function! TERMUX()
    return isdirectory(expand('/data/data/com.termux')) " #FIXME: Dirty judge
endfunction
