if isdirectory(expand("~/.vim/bundle/lightline.vim/"))
    let g:lightline = {
                \ 'colorscheme': 'Dracula',
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
                \ },
                \ 'component_function': {
                \   'filetype': 'DeviconsFileType',
                \   'fileformat': 'DeviconsFileFormat',
                \   'fugitive': 'LightlineFugitive',
                \   'mode': 'LightlineMode',
                \   'fileencoding': 'LightlineFileencoding',
                \   'filename': 'LightlineFilename',
                \ },
                \ 'tabline': {
                \   'left': [ ['tabs'] ],
                \   'right': [ ['bufferline'] ]
                \ },
                \ 'component_expand': {
                \   'bufferline': 'LightlineBufferline',
                \ },
                \ 'component_type': {
                \   'bufferline': 'tabsel',
                \ },
                \ 'separator': { 'left': '', 'right': '' },
                \ 'subseparator': { 'left': '', 'right': '' }
                \}

    " show tabline by default
    set showtabline=2
    function! DeviconsFileType()
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
    endfunction

    function! DeviconsFileFormat()
        return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
    endfunction

    " Functions from lightline author
    function! LightlineFugitive()
        if winwidth(0) < 70
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
                    \ fname == '__Tagbar__' ? g:lightline.fname :
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
        return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
    endfunction
endif
