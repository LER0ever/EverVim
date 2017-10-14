if isdirectory(expand(EverVimBundleDir('vim-javacomplete2')))
    autocmd FileType java setlocal omnifunc=javacomplete#Complete

    augroup javacomplete-key
        " Keymaps for java complete
        autocmd FileType java nmap <leader>lI <Plug>(JavaComplete-Imports-AddMissing)
        autocmd FileType java nmap <leader>lR <Plug>(JavaComplete-Imports-RemoveUnused)
        autocmd FileType java nmap <leader>li <Plug>(JavaComplete-Imports-AddSmart)
        autocmd FileType java nmap <leader>lii <Plug>(JavaComplete-Imports-Add)

        autocmd FileType java imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
        autocmd FileType java imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
        autocmd FileType java imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
        autocmd FileType java imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

        autocmd FileType java nmap <leader>lM <Plug>(JavaComplete-Generate-AbstractMethods)

        autocmd FileType java imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

        autocmd FileType java nmap <leader>lA <Plug>(JavaComplete-Generate-Accessors)
        autocmd FileType java nmap <leader>ls <Plug>(JavaComplete-Generate-AccessorSetter)
        autocmd FileType java nmap <leader>lg <Plug>(JavaComplete-Generate-AccessorGetter)
        autocmd FileType java nmap <leader>la <Plug>(JavaComplete-Generate-AccessorSetterGetter)
        autocmd FileType java nmap <leader>lts <Plug>(JavaComplete-Generate-ToString)
        autocmd FileType java nmap <leader>leq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
        autocmd FileType java nmap <leader>lc <Plug>(JavaComplete-Generate-Constructor)
        autocmd FileType java nmap <leader>lcc <Plug>(JavaComplete-Generate-DefaultConstructor)

        autocmd FileType java imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
        autocmd FileType java imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
        autocmd FileType java imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

        autocmd FileType java vmap <leader>ls <Plug>(JavaComplete-Generate-AccessorSetter)
        autocmd FileType java vmap <leader>lg <Plug>(JavaComplete-Generate-AccessorGetter)
        autocmd FileType java vmap <leader>la <Plug>(JavaComplete-Generate-AccessorSetterGetter)

        autocmd FileType java nmap <silent> <buffer> <leader>ln <Plug>(JavaComplete-Generate-NewClass)
        autocmd FileType java nmap <silent> <buffer> <leader>lN <Plug>(JavaComplete-Generate-ClassInFile)
    augroup END
endif
