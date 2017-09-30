if isdirectory(expand(EverVimBundleDir('tsuquyomi')))
    let g:tsuquyomi_disable_quickfix = 1
    let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
    let g:tsuquyomi_javascript_support = 1
endif
