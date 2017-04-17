if isdirectory(expand("~/.vim/bundle/vim-markdown"))
    let g:vim_markdown_toml_frontmatter = 1
    let g:vim_markdown_math = 1
    let g:vim_markdown_fenced_languages = ['csharp=cs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'toml=toml']
endif
