" Formatting
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>            "  Match, to be used with %
set pastetoggle=<F12>           "  pastetoggle (sane indentation on pastes)
set autoread                    " Automatically reload if file is changed externally
if OSX()
    set nofsync                 " Disable fsync under macOS, for it wont work on NTFS
endif
"set comments=sl:/*,mb:*,elx:*/ "  auto format comment blocks
" Remove trailing whitespaces and ^M chars
" To disable the stripping of whitespace, add the following to your
" .vimrc.before.local file:
"   let g:evervim_keep_trailing_whitespace = 1
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:evervim_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd BufNewFile,BufRead *.nox,*.pts set filetype=gohtmltmpl
autocmd BufNewFile,BufRead *.amber set filetype=pug
autocmd BufNewFile,BufRead *.csv,*.dat set filetype=csv
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html,xml,gohtmltmpl setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType typescript setlocal expandtab shiftwidth=4 softtabstop=4
" preceding line best in a plugin but here for now.

autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.bundles,*.EverVim.local,*.EverVim.project,*.EverVim.Project set filetype=vim
autocmd BufNewFile *.EverVim.project,*.EverVim.Project,*.EverVim.local 0r $evervim_root/.EverVim.project.sample
autocmd BufNewFile,BufRead wscript set filetype=python

" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell


