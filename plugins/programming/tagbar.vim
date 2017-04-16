if isdirectory(expand("~/.vim/bundle/tagbar/"))
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
    let g:tagbar_width = 30
    " Add support for markdown files in tagbar.
    let g:tagbar_type_markdown = {
                \ 'ctagstype': 'markdown',
                \ 'ctagsbin' : '~/.vim/tools/markdown2ctags/markdown2ctags.py',
                \ 'ctagsargs' : '-f - --sort=yes',
                \ 'kinds' : [
                \ 's:sections',
                \ 'i:images'
                \ ],
                \ 'sro' : '|',
                \ 'kind2scope' : {
                \ 's' : 'section',
                \ },
                \ 'sort': 0,
                \ }
endif

