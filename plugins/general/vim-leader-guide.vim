if isdirectory(expand('~/.vim/bundle/vim-leader-guide'))
    let g:vim_leader_guide_map = {
                \   mapleader: {
                \       'name': '<leader>',
                \       '.': { 'name' : 'FZF!',
                \           '.': { 'name': 'Current Buffer' }
                \       },
                \       ',': ['call feedkeys("\<Plug>(easymotion-prefix)")', 'EasyMotion Prefix'],
                \       'a': { 'name' : 'Tabularize' },
                \       'b': { 'name' : 'Buffer/Bookmark' },
                \       'c': { 'name' : 'Comments' },
                \       'd': { 'name' : 'Dispatch' },
                \       'e': { 'name' : 'Edit' },
                \       'f': { 'name' : 'Find/Format' },
                \       'g': { 'name' : 'Git' },
                \       'i': { 'name' : 'Alternate File Switch' },
                \       'j': { 'name' : 'Jump' },
                \       'n': { 'name' : 'NerdTree' },
                \       'o': { 'name' : 'Fold' },
                \       'r': { 'name' : 'Resize/Rainbow' },
                \       's': { 'name' : 'Search/Session' },
                \       't': { 'name' : 'Tab/Terminal/Tagbar' },
                \       'u': { 'name' : 'UndoTree' },
                \       'v': { 'name' : 'VimWiki' },
                \       'w': { 'name' : 'Writing' },
                \       'y': { 'name' : 'YouCompleteMe' },
                \   },
                \   maplocalleader: {
                \       'name': '<localleader>',
                \   },
                \ }
    call leaderGuide#register_prefix_descriptions('', 'g:vim_leader_guide_map')

    function! s:evervim_leaderguide_displayfunc()
        let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '#', '', '')
        let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
        let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<SID>', '', '')
        let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
        let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, ':call ', '', '')
    endfunction
    if exists('g:leaderGuide_displayfunc')
        call add(g:leaderGuide_displayfunc, function('s:evervim_leaderguide_displayfunc'))
    else
        let g:leaderGuide_displayfunc = [function('s:evervim_leaderguide_displayfunc')]
    endif

    nnoremap <silent> <space> :<C-u>LeaderGuide mapleader<CR>
    vnoremap <silent> <space> :<C-u>LeaderGuideVisual mapleader<CR>
    map <space>. <Plug>leaderguide-global
    nnoremap <localleader> :<C-u>LeaderGuide maplocalleader<CR>
    vnoremap <localleader> :<C-u>LeaderGuideVisual maplocalleader<CR>
    map <localleader>. <Plug>leaderguide-buffer
endif
