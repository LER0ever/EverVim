if isdirectory(expand(EverVimBundleDir('vim-orgmode')))
    let g:org_todo_keywords = [['TODO(t)', 'DOING(i)', 'CHECK(k)', 'STALLED(s)', '|', 'DONE(d)', 'CANCELED(c)'],
      \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
      \ ['CANCELED(c)']]
    let g:org_agenda_files = ['~/.org/*.org']
endif
