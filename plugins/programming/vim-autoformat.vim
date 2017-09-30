if isdirectory(expand(EverVimBundleDir("vim-autoformat")))
    noremap <Leader>fm :Autoformat<CR>
    if !exists('g:evervim_no_autoformat')
        au BufWrite *.c,*.cpp,*.h,*.hpp,*.cxx :Autoformat
        au BufWrite *.rust,*.rs :Autoformat
        au BufWrite *.cs :Autoformat
        au BufWrite *.java :Autoformat
        au BufWrite *.py :Autoformat
        au BufWrite *.css :Autoformat
        au BufWrite *.ts :Autoformat
    endif
endif
