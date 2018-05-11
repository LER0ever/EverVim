if isdirectory(expand(EverVimBundleDir('vim-javascript')))
    if exists('g:evervim_js_ligatures')
        let g:javascript_conceal_function             = "ƒ"
        let g:javascript_conceal_null                 = "ø"
        let g:javascript_conceal_this                 = "@"
        let g:javascript_conceal_return               = "⇚"
        let g:javascript_conceal_undefined            = "¿"
        let g:javascript_conceal_NaN                  = "ℕ"
        let g:javascript_conceal_prototype            = "¶"
        let g:javascript_conceal_super                = "Ω"
        let g:javascript_conceal_arrow_function       = "⇒"
        let g:javascript_conceal_noarg_arrow_function = "🞅"
        let g:javascript_conceal_underscore_arrow_function = "🞅"
    endif
    if executable('flow')
        let g:javascript_plugin_flow = 1
    endif
endif
