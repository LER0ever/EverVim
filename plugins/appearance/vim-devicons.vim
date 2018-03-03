if isdirectory(expand(EverVimBundleDir('vim-devicons')))
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    " let g:DevIconsEnableFoldersOpenClose = 1
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\.EverVim\.*'] = '⋞'
    " Refresh devicons on resourcing vimrc, i.e. <Leader>ac
    if exists("g:loaded_webdevicons")
        call webdevicons#refresh()
    endif
endif
