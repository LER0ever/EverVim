if isdirectory(expand('~/.vim/bundle/pdv'))
    let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
    nnoremap <buffer> <Leader>lp :call pdv#DocumentWithSnip()<CR>
endif
