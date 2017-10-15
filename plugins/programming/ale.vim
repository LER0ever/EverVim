if isdirectory(expand(EverVimBundleDir("ale")))
    " Disable realtime linting due to performance issue
    let g:ale_lint_on_text_changed = 'normal'
    " Ensure ale use loclist
    let g:ale_set_loclist = 1
    " Check on bufenter
    let g:ale_lint_on_enter = 1
endif
