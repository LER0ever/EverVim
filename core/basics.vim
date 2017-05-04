" Basics
set nocompatible        " Must be first line
set background=dark     " Assume a dark background
if !WINDOWS()
    set shell=/bin/sh
    if ANDROID()
        set shell=/system/bin/sh
    endif
endif
