" Functions

" Initialize directories {
function! InitializeDirectories()
    let parent = $HOME
    let prefix = 'vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    " To specify a different directory in which to place the vimbackup,
    " vimviews, vimundo, and vimswap files/directories, add the following to
    " your .vimrc.before.local file:
    "   let g:evervim_consolidated_directory = <full path to desired directory>
    "   eg: let g:evervim_consolidated_directory = $HOME . '/.vim/'
    if exists('g:evervim_consolidated_directory')
        let common_dir = g:evervim_consolidated_directory . prefix
    else
        let common_dir = parent . '/.' . prefix
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()
" }

" Initialize NERDTree as needed {
function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction
" }

" Strip whitespace {
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }

" Unix Dos Conversion {
function! Dos2Unix()
    execute 'update | e ++ff=dos | setlocal ff=unix'
    silent %s/\r//ge
    execute 'w'
endfunction

function! Unix2Dos()
    execute 'update | e ++ff=dos | w'
endfunction
" }

" Shell command {
function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
endfunction

command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
" }

function! s:ExpandFilenameAndExecute(command, file)
    execute a:command . " " . expand(a:file, ":p")
endfunction

function! EditEverVimConfig()
    call <SID>ExpandFilenameAndExecute("tabedit", "~/.EverVim.vimrc")
endfunction

function! ReplaceInFile(file, regexmatch, replace)
    execute 'args ' . a:file | execute 'argdo %s/' . a:regexmatch . '/' . a:replace . '/gce' | execute 'argdo wq'
endfunction

function! DeleteLinesInFile(file, regexmatch)
    execute 'args ' . a:file . ' | argdo g/' . a:regexmatch . '/d | argdo wq'
endfunction

function! EverVimBundleDir(bundlename)
    return $evervim_root . "/bundle/" . a:bundlename
endfunction

function! EverVimUpdateConfig()
    if WINDOWS()
        execute '!git -C \%USERPROFILE\%/.EverVim pull'
    else
        execute '!git -C ~/.EverVim pull'
    endif
    execute "source ~/.EverVim/vimrc"
endfunction

function! EverVimUpdatePlugins()
    execute 'PlugUpgrade'
    execute 'PlugClean!'
    execute 'PlugUpdate'
    echo 'Update Completed!'
endfunction

function! EverVimShowLog()
    if exists(':Agit')
        echo 'Showing git log for EverVim, press `q` to exit.'
        sleep 500m
        execute 'Agit --dir=~/.EverVim'
    endif
    " TODO: Log without AGit
endfunction

function! EverVimFullUpgrade()
    copen
    cexpr "Running EverVim Full Upgrade ...\n".
                \ "This will take about 2-5 minutes, depending on your network condition.\n" .
                \ "After finish updating, you can try:\n".
                \ "    - press `D` to see the changes for plugins.\n" .
                \ "    - run `:call EverVimShowLog()` to view the git log for EverVim in Agit\n" .
                \ "A restart is **required** after the updating process is finished.\n" . "Enjoy!"
    sleep 1000m
    silent! call EverVimUpdateConfig()
    silent! call EverVimUpdatePlugins()
endfunction

function! EverVimInitPlugins()
    if !isdirectory(expand('~/.EverVim/bundle'))
        execute 'PlugInstall'
    endif
endfunction

function! SourceConfigsIn(dir)
    let filelist = split(globpath(a:dir, '*.vim'), '\n')
    for vimconf in filelist
        execute 'source' vimconf
    endfor
endfunction
