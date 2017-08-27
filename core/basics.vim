" Basics
set nocompatible        " Must be first line
if !WINDOWS()
    set shell=/bin/sh
    if ANDROID()
        set shell=/system/bin/sh
    endif
endif
