if isdirectory(expand(EverVimBundleDir('vim-devicons')))
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    " let g:DevIconsEnableFoldersOpenClose = 1
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\.EverVim\.*'] = '⋞'
endif
