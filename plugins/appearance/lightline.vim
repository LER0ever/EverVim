if isdirectory(expand(EverVimBundleDir("lightline.vim")))
    if !exists('g:evervim_airline_theme') || g:evervim_airline_theme == "dracula"
        let g:lightline_theme = 'Dracula'
    else
        let g:lightline_theme = g:evervim_airline_theme
    endif
    let g:lightline = {
                \ 'colorscheme': g:lightline_theme,
                \ 'enable': {
                \   'statusline': 1,
                \   'tabline': 1,
                \ },
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'fugitive', 'filename' ]],
                \   'right': [ ['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype'], ['synatastic'] ]
                \ },
                \ 'component': {
                \   'readonly': '%{&readonly?"":""}',
                \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
                \   'buffericon': '',
                \ },
                \ 'component_function': {
                \   'filetype': 'DeviconsFileType',
                \   'fileformat': 'DeviconsFileFormat',
                \   'fugitive': 'LightlineFugitive',
                \   'mode': 'LightlineMode',
                \   'fileencoding': 'LightlineFileencoding',
                \   'filename': 'LightlineFilename',
                \   'bufferbefore': 'lightline#buffer#bufferbefore',
                \   'bufferafter': 'lightline#buffer#bufferafter',
                \   'bufferinfo': 'lightline#buffer#bufferinfo',
                \ },
                \ 'tabline': {
                \   'left': [ ['bufferinfo'], ['tabs'] ],
                \   'right': [ ['buffericon'], ['bufferbefore', 'buffercurrent', 'bufferafter'] ]
                \ },
                \ 'tab': {
                \   'active': ['tabnum', 'filename', 'modified'],
                \   'inactive': ['tabnum', 'modified'],
                \ },
                \ 'component_expand': {
                \   'buffercurrent': 'lightline#buffer#buffercurrent2',
                \ },
                \ 'component_type': {
                \   'buffercurrent': 'tabsel',
                \ },
                \ 'separator': { 'left': '', 'right': '' },
                \ 'subseparator': { 'left': '', 'right': '' },
                \ 'tabline_separator': { 'left': '', 'right': '' },
                \ 'tabline_subseparator': { 'left': '', 'right': '' }
                \}

    let g:lightline_buffer_show_bufnr = 1
    let g:lightline_buffer_rotate = 1

    let g:lightline_buffer_logo = ' '
    let g:lightline_buffer_readonly_icon = ''
    let g:lightline_buffer_modified_icon = '✭'
    let g:lightline_buffer_git_icon = ''
    let g:lightline_buffer_ellipsis_icon = '..'
    let g:lightline_buffer_expand_left_icon = ''
    let g:lightline_buffer_expand_right_icon = ''
    let g:lightline_buffer_active_buffer_left_icon = ''
    let g:lightline_buffer_active_buffer_right_icon = ''
    let g:lightline_buffer_separator_icon = ''
    let g:lightline_buffer_reservelen = 40
    let g:lightline_buffer_maxflen = 20
    let g:lightline_buffer_minflen = 10
    let g:lightline_buffer_excludes = ['vimfiler', 'No Name']
    let g:lightline_right_arrow = '  '

    if exists('g:evervim_no_patched_fonts')
        let g:lightline.separator = {}
        let g:lightline.subseparator = {}
        let g:lightline.tabline_separator = {}
        let g:lightline.tabline_subseparator = {}
        let g:lightline_buffer_logo = ' '
        let g:lightline_buffer_readonly_icon = ''
        let g:lightline_buffer_modified_icon = ''
        let g:lightline_buffer_git_icon = ' '
        let g:lightline_right_arrow = ' | '
    endif

    " show tabline by default
    set showtabline=2
    " show tabline even in GVIM
    if has('gui_running')
        set guioptions-=e
    endif

    function! DeviconsFileType()
        if !exists('g:evervim_no_patched_fonts')
            return winwidth(0) > 65 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
        else
            return winwidth(0) > 65 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
        endif
    endfunction

    function! DeviconsFileFormat()
        if !exists('g:evervim_no_patched_fonts')
            return winwidth(0) > 75 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
        else
            return winwidth(0) > 75 ? &fileformat : ''
        endif
    endfunction

    " Functions from lightline author
    function! LightlineFugitive()
        if winwidth(0) < 65
            return ''
        endif
        if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
            let branch = fugitive#head()
            return branch !=# '' ? g:lightline_buffer_git_icon . branch : ''
        endif
        return ''
    endfunction

    function! LightlineBufferline()
        call bufferline#refresh_status()
        return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after]
    endfunction

    function! LightlineModified()
        return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! LightlineReadonly()
        return &ft !~? 'help' && &readonly ? g:lightline_buffer_readonly_icon : ''
    endfunction

    function! LightlineFilename()
        let fname = expand('%:t')
        return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                    \ fname =~ '__Tagbar__' ? "" :
                    \ fname =~ '__Gundo\|NERD_tree' ? '' :
                    \ fname =~ 'FZF' ? 'Fuzzy Finder' :
                    \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                    \ &ft == 'unite' ? unite#get_status_string() :
                    \ &ft == 'leaderGuide' ? 'Guide' :
                    \ &ft == 'vimshell' ? vimshell#get_status_string() :
                    \ ('' != LightlineReadonly() ? LightlineReadonly() . g:lightline_right_arrow: '') .
                    \ ('' != fname ? fname . g:lightline_right_arrow : '[No Name]' . g:lightline_right_arrow ) .
                    \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
    endfunction

    function! LightlineMode()
        let fname = expand('%:t')
        let longmode = lightline#mode()
        return fname =~ '__Tagbar__' ? 'Tagbar' :
                    \ fname == 'ControlP' ? 'CtrlP' :
                    \ fname == '__Gundo__' ? 'Gundo' :
                    \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                    \ fname =~ 'NERD_tree' ? 'NERDTree' :
                    \ fname =~ 'FZF' ? ' FZF' :
                    \ &ft == 'unite' ? 'Unite' :
                    \ &ft == 'vimfiler' ? 'VimFiler' :
                    \ &ft == 'leaderGuide' ? 'Leader' :
                    \ &ft == 'vimshell' ? 'VimShell' :
                    \ winwidth(0) > 75 ? longmode :
                    \ longmode == 'NORMAL' ? 'N' :
                    \ longmode == 'INSERT' ? 'I' :
                    \ longmode == 'VISUAL' ? 'V' :
                    \ longmode == 'V-BLOCK' ? 'B' :
                    \ longmode
    endfunction

    function! LightlineFileencoding()
        return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'

    function! TagbarStatusFunc(current, sort, fname, ...) abort
        let g:lightline.fname = a:fname
        return lightline#statusline(0)
    endfunction

    function! CtrlPMark()
        if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
            call lightline#link('iR'[g:lightline.ctrlp_regex])
            return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                        \ , g:lightline.ctrlp_next], 0)
        else
            return ''
        endif
    endfunction

    let g:ctrlp_status_func = {
                \ 'main': 'CtrlPStatusFunc_1',
                \ 'prog': 'CtrlPStatusFunc_2',
                \ }

    function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
        let g:lightline.ctrlp_regex = a:regex
        let g:lightline.ctrlp_prev = a:prev
        let g:lightline.ctrlp_item = a:item
        let g:lightline.ctrlp_next = a:next
        return lightline#statusline(0)
    endfunction

    function! CtrlPStatusFunc_2(str)
        return lightline#statusline(0)
    endfunction
endif
