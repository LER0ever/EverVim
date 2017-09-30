if isdirectory(expand(EverVimBundleDir("undotree")))
    nnoremap <Leader>ut :UndotreeToggle<CR>
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1
    let g:undotree_WindowLayout=3
endif
