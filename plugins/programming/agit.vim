if isdirectory(expand('~/.vim/bundle/agit.vim'))
    nnoremap <Leader>ga :Agit<CR>

    autocmd filetype agit_diff setlocal nofoldenable
endif
