if isdirectory(expand(EverVimBundleDir('calendar.vim')))
    " Alias command clock
    command -nargs=0 Clock :Calendar -view=clock
endif
