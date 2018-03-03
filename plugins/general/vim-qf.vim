if isdirectory(expand(EverVimBundleDir('vim-qf')))
    let g:qf_auto_resize = 1
    let g:qf_max_height = 8
    let g:qf_loclist_window_bottom = 0
    nmap <Leader>we <Plug>qf_loc_toggle
    nmap <leader>wf <Plug>qf_qf_toggle
    nmap <C-Home> <Plug>qf_loc_previous
    nmap <C-End>  <Plug>qf_loc_next
endif
