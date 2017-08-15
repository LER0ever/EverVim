if isdirectory(expand('~/.vim/bundle/swift.vim'))
    " Enable both swiftpm and swiftlint checker
    let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
endif
