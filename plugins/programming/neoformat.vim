if isdirectory(expand(EverVimBundleDir("neoformat")))
    noremap <Leader>fm :Neoformat<CR>
    if !exists('g:evervim_no_autoformat')
        augroup neofmt
            autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.cxx Neoformat
            autocmd BufWritePre *.rust,*.rs Neoformat
            autocmd BufWritePre *.cs Neoformat
            autocmd BufWritePre *.java Neoformat
            autocmd BufWritePre *.py Neoformat
            autocmd BufWritePre *.css Neoformat
            autocmd BufWritePre *.ts Neoformat
        augroup END
    endif
end
