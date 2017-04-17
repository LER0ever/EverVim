if !executable("ghcmod")
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
endif
