if isdirectory(expand(EverVimBundleDir("ale")))
    " Disable realtime linting due to performance issue
    let g:ale_lint_on_text_changed = 'normal'
    " Ensure ale use location list
    let g:ale_set_loclist = 1
    let g:ale_open_list = 1
    let g:ale_list_window_size = 8
    " Check on bufenter
    let g:ale_lint_on_enter = 1
    let g:ale_set_signs = 1
    let g:ale_sign_column_always = 1
endif
