" Identify platform 
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction
silent function! TERMUX()
    return isdirectory(expand('/data/data/com.termux')) " #FIXME: Dirty judge
endfunction
silent function! NVIM()
    return has('nvim')
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
