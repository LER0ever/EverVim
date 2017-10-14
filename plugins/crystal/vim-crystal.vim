if isdirectory(expand(EverVimBundleDir("vim-crystal")))
    let g:crystal_define_mappings=0
    augroup crystal-keybindings
        autocmd!
        autocmd FileType crystal nmap <Leader>ld <Plug>(crystal-jump-to-definition)
        autocmd FileType crystal nmap <Leader>lc <Plug>(crystal-show-context)
        autocmd FileType crystal nmap <Leader>lss <Plug>(crystal-spec-switch)
        autocmd FileType crystal nmap <Leader>lsa <Plug>(crystal-spec-run-all)
        autocmd FileType crystal nmap <Leader>lsc <Plug>(crystal-spec-run-current)
    augroup END
endif
