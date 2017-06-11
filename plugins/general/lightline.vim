if isdirectory(expand("~/.vim/bundle/lightline.vim/"))
    if !exists('g:evervim_airline_theme')
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
    let g:lightline_buffer_git_icon = ' '
    let g:lightline_buffer_ellipsis_icon = '..'
    let g:lightline_buffer_expand_left_icon = ''
    let g:lightline_buffer_expand_right_icon = ''
    let g:lightline_buffer_active_buffer_left_icon = ''
    let g:lightline_buffer_active_buffer_right_icon = ''
    let g:lightline_buffer_separator_icon = ''

    " show tabline by default
    set showtabline=2
    " show tabline even in GVIM
    if has('gui_running')
        set guioptions-=e
    endif

    function! DeviconsFileType()
        return winwidth(0) > 75 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
    endfunction

    function! DeviconsFileFormat()
        return winwidth(0) > 75 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
    endfunction

    " Functions from lightline author
    function! LightlineFugitive()
        if winwidth(0) < 75
            return ''
        endif
        if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
            let branch = fugitive#head()
            return branch !=# '' ? ''.branch : ''
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
        return &ft !~? 'help' && &readonly ? '' : ''
    endfunction

    function! LightlineFilename()
        let fname = expand('%:t')
        return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                    \ fname =~ '__Tagbar__' ? "" :
                    \ fname =~ '__Gundo\|NERD_tree' ? '' :
                    \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                    \ &ft == 'unite' ? unite#get_status_string() :
                    \ &ft == 'vimshell' ? vimshell#get_status_string() :
                    \ ('' != LightlineReadonly() ? LightlineReadonly() . '  ' : '') .
                    \ ('' != fname ? fname . '  ' : '[No Name] ' ) .
                    \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
    endfunction

    function! LightlineMode()
        let fname = expand('%:t')
        return fname =~ '__Tagbar__' ? 'Tagbar' :
                    \ fname == 'ControlP' ? 'CtrlP' :
                    \ fname == '__Gundo__' ? 'Gundo' :
                    \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                    \ fname =~ 'NERD_tree' ? 'NERDTree' :
                    \ &ft == 'unite' ? 'Unite' :
                    \ &ft == 'vimfiler' ? 'VimFiler' :
                    \ &ft == 'vimshell' ? 'VimShell' :
                    \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! LightlineFileencoding()
        return winwidth(0) > 75 ? (&fenc !=# '' ? &fenc : &enc) : ''
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
