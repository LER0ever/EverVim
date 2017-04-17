" General
let g:vimrc_author='LER0ever'
let g:vimrc_email='etasry@gmail.com'
let g:vimrc_homepage='http://yirong.ml'

set background=dark         " Assume a dark background

" Allow to trigger background
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>

" if !has('gui')
    "set term=$TERM          " Make arrow and other keys work
" endif
filetype plugin indent on   " Automatically detect file types.
syntax on
set foldmethod=indent       " Syntax highlighting | using indentation as foldmethod to speed up vim
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 " support for open multi-byte encoded file
set encoding=utf-8

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" Most prefer to automatically switch to the current file directory when
" a new buffer is opened; to prevent this behavior, add the following to
" your .vimrc.before.local file:
"   let g:evervim_no_autochdir = 1
if !exists('g:evervim_no_autochdir')
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " Always switch to the current file directory
endif

"set autowrite                                  "  Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT                      "  Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash "  Better Unix / Windows compatibility
set virtualedit=onemore                         "  Allow for cursor beyond last character
set history=1000                                "  Store a ton of history (default is 20)
set nospell                                     "  Switch off Spell checking by default
set hidden                                      "  Allow buffer switching without saving
set iskeyword-=.                                "  '.' is an end of word designator
set iskeyword-=#                                "  '#' is an end of word designator
set iskeyword-=-                                "  '-' is an end of word designator

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
" This may cause NERDTree and tagbar's abnormal behavior
" To disable this, add the following to your .vimrc.before.local file:
"   let g:evervim_no_restore_cursor = 1
" deprecated, replaced by vim-lastplace

"if !exists('g:evervim_no_restore_cursor')
    "function! ResCur()
        "if line("'\"") <= line("$")
            "silent! normal! g`"
            "return 1
        "endif
    "endfunction

    "augroup resCur
        "autocmd!
        "autocmd BufWinEnter * call ResCur()
    "augroup END
"endif

" Setting up the directories {
    set backup                  " Backups are nice ...
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif

    " To disable views add the following to your .vimrc.before.local file:
    "   let g:evervim_no_views = 1
    if !exists('g:evervim_no_views')
        " Add exclusions to mkview and loadview
        " eg: *.*, svn-commit.tmp
        let g:skipview_files = [
            \ '\[example pattern\]'
            \ ]
    endif
" }
