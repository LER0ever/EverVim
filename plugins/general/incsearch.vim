if isdirectory(expand('~/.vim/bundle/incsearch.vim'))
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
endif
