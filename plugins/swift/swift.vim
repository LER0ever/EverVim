if isdirectory(expand(EverVimBundleDir('swift.vim')))
    " Enable both swiftpm and swiftlint checker
    let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
endif
