if !has('python') && !has('python3')
    let g:pymode = 0
endif

if isdirectory(expand(EverVimBundleDir("python-mode")))
    let g:pymode_python = 'python3'
    let g:pymode_trim_whitespaces = 0
    let g:pymode_options = 0
    let g:pymode_rope = 0
    let g:pymode_breakpoint_bind = '<leader>lb'
    let g:pymode_run_bind = '<leader>lr'
endif
