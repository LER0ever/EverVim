if isdirectory(expand(EverVimBundleDir("vim-markdown")))
    let g:vim_markdown_frontmatter = 1
    let g:vim_markdown_toml_frontmatter = 1
    let g:vim_markdown_math = 1
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_fenced_languages = ['csharp=cs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'toml=toml']
    let g:vim_markdown_autowrite = 1
    let g:vim_markdown_no_extensions_in_markdown = 1
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_folding_style_pythonic = 1

    nnoremap <Leader>to :Tocv<CR>
endif
