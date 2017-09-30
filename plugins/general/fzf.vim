if isdirectory(expand(EverVimBundleDir('fzf.vim')))

    " fzf drop down
    let g:fzf_layout = { 'down': '~40%' }

    " fzf mappings
    nnoremap <Leader>.f :Files<CR>
    nnoremap <Leader>.l :Lines<CR>
    nnoremap <Leader>.t :Tags<CR>
    nnoremap <Leader>.b :Buffers<CR>
    nnoremap <Leader>.c :Commands<CR>
    nnoremap <Leader>.w :Windows<CR>
    nnoremap <Leader>.a :Ag<CR>
    nnoremap <Leader>.g :GitFiles<CR>
    nnoremap <Leader>.o :Locate<Space>
    nnoremap <Leader>.m :Maps<CR>
    nnoremap <Leader>.h :History<CR>
    nnoremap <Leader>.s :Snippets<CR>
    nnoremap <Leader>.i :Commits<CR>
    nnoremap <Leader>.r :Colors<CR>
    nnoremap <Leader>.e :Helptags<CR>
    nnoremap <Leader>..c :BCommits<CR>
    nnoremap <Leader>..t :BTags<CR>
    nnoremap <Leader>..l :BLines<CR>

    " CtrlP compatibility
    nnoremap <C-P> :Files<CR>

    nmap <Leader>z <Leader>.

    if isdirectory(expand(EverVimBundleDir('lightline.vim')))
        autocmd! User FzfStatusLine call lightline#update_once()
    endif

    " Command override (with preview)
    command! -bang -nargs=? -complete=dir Files
                \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
    command! -bang -nargs=* Ag
                \ call fzf#vim#ag(<q-args>,
                \                 <bang>0 ? fzf#vim#with_preview('up:60%')
                \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
                \                 <bang>0)
endif
