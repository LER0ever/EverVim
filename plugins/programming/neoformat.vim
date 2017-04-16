if isdirectory(expand("~/.vim/bundle/neoformat"))
    augroup neofmt
        autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.cxx Neoformat
        autocmd BufWritePre *.go Neoformat
        autocmd BufWritePre *.rust,*.rs Neoformat
        autocmd BufWritePre *.cs Neoformat
        autocmd BufWritePre *.java Neoformat
        autocmd BufWritePre *.py Neoformat
        autocmd BufWritePre *.css Neoformat
        autocmd BufWritePre *.ts Neoformat
    augroup END
end
