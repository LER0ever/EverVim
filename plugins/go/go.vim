if count(g:evervim_bundle_groups, 'go')
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
    au FileType go nmap <Leader>ls <Plug>(go-implements)
    au FileType go nmap <Leader>ln <Plug>(go-info)
    au FileType go nmap <Leader>li <Plug>(go-install)
    au FileType go nmap <Leader>le <Plug>(go-rename)
    au FileType go nmap <leader>lr <Plug>(go-run)
    au FileType go nmap <leader>lb <Plug>(go-build)
    au FileType go nmap <leader>lt <Plug>(go-test)
    au FileType go nmap <Leader>ld <Plug>(go-doc)
    au FileType go nmap <leader>lc <Plug>(go-coverage)
endif
