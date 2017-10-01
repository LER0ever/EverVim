if isdirectory(expand(EverVimBundleDir('vim-javacomplete2')))
    autocmd FileType java setlocal omnifunc=javacomplete#Complete

    " Keymaps for java complete
    nmap <leader>lI <Plug>(JavaComplete-Imports-AddMissing)
    nmap <leader>lR <Plug>(JavaComplete-Imports-RemoveUnused)
    nmap <leader>li <Plug>(JavaComplete-Imports-AddSmart)
    nmap <leader>lii <Plug>(JavaComplete-Imports-Add)

    imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
    imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
    imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
    imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

    nmap <leader>lM <Plug>(JavaComplete-Generate-AbstractMethods)

    imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

    nmap <leader>lA <Plug>(JavaComplete-Generate-Accessors)
    nmap <leader>ls <Plug>(JavaComplete-Generate-AccessorSetter)
    nmap <leader>lg <Plug>(JavaComplete-Generate-AccessorGetter)
    nmap <leader>la <Plug>(JavaComplete-Generate-AccessorSetterGetter)
    nmap <leader>lts <Plug>(JavaComplete-Generate-ToString)
    nmap <leader>leq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
    nmap <leader>lc <Plug>(JavaComplete-Generate-Constructor)
    nmap <leader>lcc <Plug>(JavaComplete-Generate-DefaultConstructor)

    imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
    imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
    imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

    vmap <leader>ls <Plug>(JavaComplete-Generate-AccessorSetter)
    vmap <leader>lg <Plug>(JavaComplete-Generate-AccessorGetter)
    vmap <leader>la <Plug>(JavaComplete-Generate-AccessorSetterGetter)

    nmap <silent> <buffer> <leader>ln <Plug>(JavaComplete-Generate-NewClass)
    nmap <silent> <buffer> <leader>lN <Plug>(JavaComplete-Generate-ClassInFile)
endif
