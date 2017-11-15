if count(g:evervim_bundle_groups, 'youcompleteme')
    let g:acp_enableAtStartup = 0

    " enable completion from tags
    let g:ycm_collect_identifiers_from_tags_files = 1

    " load ycm global config
    let g:ycm_global_ycm_extra_conf = $evervim_root . "/plugins/youcompleteme/ycm_global_conf.py"

    " YouCompleteMe keymap
    let g:ycm_key_detailed_diagnostics = '<leader>yd'

    " YcmCompleter GoTo keymap
    nnoremap <leader>ygd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>ydc :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>ygt :YcmCompleter GoTo<CR>

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    " Haskell post write lint and check with ghcmod
    " $ `cabal install ghcmod` if missing and ensure
    " ~/.cabal/bin is in your $PATH.
    if !executable("ghcmod")
        autocmd BufWritePost *.hs GhcModCheckAndLintAsync
    endif

    " For snippet_complete marker.
    if !exists("g:evervim_no_conceal")
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
    endif

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview

    " Enable markdown autocomplete and snippet
    " by removing it from default blacklist
    let g:ycm_filetype_blacklist = {
                \ 'tagbar' : 1,
                \ 'qf' : 1,
                \ 'notes' : 1,
                \ 'unite' : 1,
                \ 'text' : 1,
                \ 'vimwiki' : 1,
                \ 'pandoc' : 1,
                \ 'infolog' : 1,
                \ 'mail' : 1
                \}
endif
