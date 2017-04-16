if isdirectory(expand("~/.vim/bundle/vim-autoformat"))
    noremap <Leader>fm :Autoformat<CR>
    au BufWrite *.c,*.cpp,*.h,*.hpp,*.cxx :Autoformat
    au BufWrite *.go :Autoformat
    au BufWrite *.rust,*.rs :Autoformat
    au BufWrite *.cs :Autoformat
    au BufWrite *.java :Autoformat
    au BufWrite *.py :Autoformat
    au BufWrite *.css :Autoformat
    au BufWrite *.ts :Autoformat
endif
