if isdirectory(expand(EverVimBundleDir('vim-fsharp')))
    let g:fsharp_completion_helptext = 1
    let g:fsharp_map_prefix = '<Leader>l' " for language-specific keybinding prefix
endif
