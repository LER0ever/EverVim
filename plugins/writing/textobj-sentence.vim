if count(g:evervim_bundle_groups, 'writing')
    augroup textobj_sentence
      autocmd!
      autocmd FileType markdown call textobj#sentence#init()
      autocmd FileType textile call textobj#sentence#init()
      autocmd FileType text call textobj#sentence#init()
    augroup END
endif
