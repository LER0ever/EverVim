if isdirectory(expand('~/.vim/bundle/fzf.vim'))

    " fzf drop down
    let g:fzf_layout = { 'down': '~40%' }

    " fzf mappings
    nnoremap <Leader><Space>f :Files<CR>
    nnoremap <Leader><Space>l :Lines<CR>
    nnoremap <Leader><Space>t :Tags<CR>
    nnoremap <Leader><Space>b :Buffers<CR>
    nnoremap <Leader><Space>c :Commands<CR>
    nnoremap <Leader><Space>w :Windows<CR>
    nnoremap <Leader><Space>o :Locate<Space>
    nnoremap <Leader><Space>m :Maps<CR>
    nnoremap <Leader><Space>h :History<CR>
    nnoremap <Leader><Space>s :Snippets<CR>
    nnoremap <Leader><Space>i :Commits<CR>
    nnoremap <Leader><Space>r :Colors<CR>
    nnoremap <Leader><Space>e :HelpTags<CR>

    " CtrlP compatibility
    nnoremap <C-P> :Files<CR>

    nmap <Leader>z <Leader><Space>

endif
