" Modeline and Notes {
"   EverVim is a modern & powerful vim distribution
"   Repo URL: https://github.com/LER0ever/EverVim
"   Made by [LER0ever](https://github.com/LER0ever)
"   Licensed under
"       * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE.md) or http://www.apache.org/licenses/LICENSE-2.0)
" }

" Setup Vim-Plug Support {
    call plug#begin(EverVimBundleDir(''))
" }

" Bundles {

    " In your .vimrc.before.local file
    " list only the plugin groups you will use
    if !exists('g:evervim_bundle_groups')
        if WINDOWS()
            let g:evervim_bundle_groups=['general', 'appearance', 'writing', 'neocomplete', 'programming', 'python', 'javascript', 'typescript', 'html', 'css', 'misc', 'go', 'rust', 'cpp', 'lua']
        else
            let g:evervim_bundle_groups=['general', 'appearance', 'writing', 'youcompleteme', 'programming', 'python', 'javascript', 'typescript', 'html', 'css', 'misc', 'go', 'rust', 'cpp', 'lua']
        endif
    endif

    if !exists('g:override_evervim_bundles')
        for $bundle_group in g:evervim_bundle_groups
            source $evervim_root/plugins/$bundle_group/$bundle_group.bundles
        endfor
    endif

    " Run PlugInstall if bundle does not exists
    autocmd VimEnter * call EverVimInitPlugins()
" }

" Use local bundles config if available {
    if filereadable(expand("~/.EverVim.bundles"))
        source ~/.EverVim.bundles
    endif
" }

" Vim-Plug Teardown {
    call plug#end()
" }
