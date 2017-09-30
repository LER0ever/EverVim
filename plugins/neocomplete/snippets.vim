if count(g:evervim_bundle_groups, 'neocomplcache') ||
            \ count(g:evervim_bundle_groups, 'neocomplete')

    " Use honza's snippets.
    let g:neosnippet#snippets_directory=EverVimBundleDir('vim-snippets/snippets')

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1

    " For snippet_complete marker.
    if !exists("g:evervim_no_conceal")
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
    endif

    " Enable neosnippets when using go
    let g:go_snippet_engine = "neosnippet"

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview
endif
