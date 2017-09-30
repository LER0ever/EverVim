if isdirectory(expand(EverVimBundleDir("nerdtree")))
    let g:NERDShutUp=1
    " map <C-e> <plug>NERDTreeTabsToggle<CR>
    map <F3> :NERDTreeToggle<CR>
    map <leader>nf :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeToggle<CR>

    let g:NERDTreeWinSize=30
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=0
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    if !exists('g:evervim_nerdtree_tabs_sync')
        let g:nerdtree_tabs_open_on_new_tab=0
        let g:nerdtree_tabs_synchronize_view=0
    endif
    let NERDTreeMapOpenRecursively='<C-O>'

    " NerdTree git integration
    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "±",
                \ "Staged"    : "⊕",
                \ "Untracked" : "⊱",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "⋈",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✓",
                \ 'Ignored'   : '∅',
                \ "Unknown"   : "?"
                \ }
    let g:NERDTreeShowIgnoredStatus = 1
endif
