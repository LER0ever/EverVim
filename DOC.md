# EverVim Documentation
* * *
# Customization
Create `~/.vimrc.local` and `~/.gvimrc.local` for any local
customizations.

For example, to override the default color schemes:

```bash
    echo colorscheme ir_black  >> ~/.vimrc.local
```

### Before File

Create a `~/.vimrc.before.local` file to define any customizations
that get loaded *before* the EverVim `.vimrc`.

For example, to prevent autocd into a file directory:
```bash
    echo let g:evervim_no_autochdir = 1 >> ~/.vimrc.before.local
```
For a list of available EverVim specific customization options, look at the `~/.vimrc.before` file.

The load order for the configuration is:

1. `.vimrc.before` - EverVim before configuration
2. `.vimrc.before.local` - before user configuration
3. `.vimrc.bundles` - EverVim bundle configuration
4. `.vimrc.bundles.local` - local user bundle configuration
5. `.vimrc` - EverVim vim configuration
6. `.vimrc.local` - local user configuration

See `.vimrc.bundles` for specifics on what options can be set to override bundle configuration. See `.vimrc.before` for specifics on what options can be overridden. 

### Easily Editing Your Configuration

`<Leader>ev` opens a new tab containing the .vimrc configuration files listed above. This makes it easier to get an overview of your configuration and make customizations.

`<Leader>sv` sources the .vimrc file, instantly applying your customizations to the currently running vim instance.

These two mappings can themselves be customized by setting the following in .vimrc.before.local:
```bash
    let g:evervim_edit_config_mapping='<Leader>ev'
    let g:evervim_apply_config_mapping='<Leader>sv'
```

# Plugins

EverVim contains a curated set of popular vim plugins, colors, snippets and syntaxes. Great care has been made to ensure that these plugins play well together and have optimal configuration.

## Adding new plugins

Create `~/.vimrc.bundles.local` for any additional bundles.

To add a new plugin, just add one line for each bundle you want to install. The line should start with the word "Plug" followed by a string of either the vim.org project name or the githubusername/githubprojectname. For example, the github project [FredKSchott/CoVim](https://github.com/FredKSchott/CoVim) can be added with the following command

```bash
    echo Plug \'FredKSchott/CoVim\' >> ~/.vimrc.bundles.local
```

Once new plugins are added, they have to be installed.

```bash
    vim +PlugInstall
    # or open vim and type :PlugInstall
```

**Remember to run ':PlugClean!' after this to remove the existing directories**


Here are a few of the plugins:

## [Undotree]

If you undo changes and then make a new change, in most editors the changes you undid are gone forever, as their undo-history is a simple list.
Since version 7.0 vim uses an undo-tree instead. If you make a new change after undoing changes, a new branch is created in that tree.
Combined with persistent undo, this is nearly as flexible and safe as git ;-)

Undotree makes that feature more accessible by creating a visual representation of said undo-tree.

**QuickStart** Launch using `<Leader>u`.

## [NERDTree]

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim editing.  You can learn more about it with
`:help NERDTree`.

**QuickStart** Launch using `<F3>`.

**Customizations**:

* Use `<F3>` to toggle NERDTree
* Use `<leader>e` or `<leader>nt` to load NERDTreeFind which opens NERDTree where the current file is located.
* Hide clutter ('\.pyc', '\.git', '\.hg', '\.svn', '\.bzr')
* Treat NERDTree more like a panel than a split.

## [ctrlp]
Ctrlp replaces the Command-T plugin with a 100% viml plugin. It provides an intuitive and fast mechanism to load files from the file system (with regex and fuzzy find), from open buffers, and from recently used files.

**QuickStart** Launch using `<c-p>`.

## [Surround]

This plugin is a tool for dealing with pairs of "surroundings."  Examples
of surroundings include parentheses, quotes, and HTML tags.  They are
closely related to what Vim refers to as text-objects.  Provided
are mappings to allow for removing, changing, and adding surroundings.

Details follow on the exact semantics, but first, consider the following
examples.  An asterisk (*) is used to denote the cursor position.

      Old text                  Command     New text ~
      "Hello *world!"           ds"         Hello world!
      [123+4*56]/2              cs])        (123+456)/2
      "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
      if *x>3 {                 ysW(        if ( x>3 ) {
      my $str = *whee!;         vllllS'     my $str = 'whee!';

For instance, if the cursor was inside `"foo bar"`, you could type
`cs"'` to convert the text to `'foo bar'`.

There's a lot more, check it out at `:help surround`

## [NERDCommenter]

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `help :NERDCommenter` or checkout my post on [NERDCommenter](http://spf13.com/post/vim-plugins-nerd-commenter).

**QuickStart** Toggle comments using `<Leader>c<space>` in Visual or Normal mode.

## [neocomplete]

Neocomplete is an amazing autocomplete plugin with additional support for snippets. It can complete simulatiously from the dictionary, buffer, omnicomplete and snippets. This is the one true plugin that brings Vim autocomplete on par with the best editors.

**QuickStart** Just start typing, it will autocomplete where possible

**Customizations**:

 * Automatically present the autocomplete menu
 * Support tab and enter for autocomplete
 * `<C-k>` for completing snippets using [Neosnippet](https://github.com/Shougo/neosnippet.vim).

![neocomplete image][autocomplete-img]

## [YouCompleteMe]

YouCompleteMe is another amazing completion engine. It is slightly more involved to set up as it contains a binary component that the user needs to compile before it will work. As a result of this however it is very fast.

YouCompleteMe is enabled by default under Linux and other Unix. To enable YouCompleteMe on Windows add `youcompleteme` to your list of groups by overriding it in your `.vimrc.before.local` like so: `let g:evervim_bundle_groups=['general', 'programming', 'misc', 'scala', 'youcompleteme']` This is just an example. Remember to choose the other groups you want here.

Once you have done this you will need to get Vundle to grab the latest code from git. You can do this by calling `:PlugInstall`. You should see YouCompleteMe in the list.

You will now have the code in your bundles directory and can proceed to compile the core. Change to the directory it has been downloaded to. If you have a vanilla install then `cd ~/.vim/bundle/YouCompleteMe/` should do the trick. You should see a file in this directory called install.sh. There are a few options to consider before running the installer:

  * Do you want clang support (if you don't know what this is then you likely don't need it)?
    * Do you want to link against a local libclang or have the installer download the latest for you?
  * Do you want support for c# via the omnisharp server?

The plugin is well documented on the site linked above. Be sure to give that a read and make sure you understand the options you require.

For java users wanting to use eclim be sure to add `let g:EclimCompletionMethod = 'omnifunc'` to your .vimrc.local.

## [Syntastic]

Syntastic is a syntax checking plugin that runs buffers through external syntax
checkers as they are saved and opened. If syntax errors are detected, the user
is notified and is happy because they didn't have to compile their code or
execute their script to find them.

## [AutoClose]

AutoClose does what you expect. It's simple, if you open a bracket, paren, brace, quote,
etc, it automatically closes it. It handles curlys correctly and doesn't get in the
way of double curlies for things like jinja and twig.

## [Fugitive]

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

**QuickStart** `<leader>gs` to bring up git status

**Customizations**:

 * `<leader>gs` :Gstatus<CR>
 * `<leader>gd` :Gdiff<CR>
 * `<leader>gc` :Gcommit<CR>
 * `<leader>gb` :Gblame<CR>
 * `<leader>gl` :Glog<CR>
 * `<leader>gp` :Git push<CR>
 * `<leader>gw` :Gwrite<CR>
 * :Git will pass anything along to git.

![fugitive image][fugitive-img]

## [PIV]

The most feature complete and up to date PHP Integration for Vim with proper support for PHP 5.3+ including latest syntax, functions, better fold support, etc.

PIV provides:

 * PHP 5.3 support
 * Auto generation of PHP Doc (,pd on (function, variable, class) definition line)
 * Autocomplete of classes, functions, variables, constants and language keywords
 * Better indenting
 * Full PHP documentation manual (hit K on any function for full docs)

## [Ack.vim]

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with `:help Ack`

**QuickStart** :Ack

## [Tabularize]

Tabularize lets you align statements on their equal signs and other characters

**Customizations**:

 * `<Leader>a= :Tabularize /=<CR>`
 * `<Leader>a: :Tabularize /:<CR>`
 * `<Leader>a:: :Tabularize /:\zs<CR>`
 * `<Leader>a, :Tabularize /,<CR>`
 * `<Leader>a<Bar> :Tabularize /<Bar><CR>`

## [Tagbar]

EverVim includes the Tagbar plugin. This plugin requires exuberant-ctags and will automatically generate tags for your open files. It also provides a panel to navigate easily via tags

**QuickStart** `CTRL-]` while the cursor is on a keyword (such as a function name) to jump to its definition.

**Customizations**: EverVim binds `<Leader>tt` to toggle the tagbar panel

![tagbar image][tagbar-img]

**Note**: For full language support, run `brew install ctags` to install
exuberant-ctags.

**Tip**: Check out `:help ctags` for information about VIM's built-in
ctag support. Tag navigation creates a stack which can traversed via
`Ctrl-]` (to find the source of a token) and `Ctrl-T` (to jump back up
one level).

## [EasyMotion]

EasyMotion provides an interactive way to use motions in Vim.

It quickly maps each possible jump destination to a key allowing very fast and
straightforward movement.

**QuickStart** EasyMotion is triggered using the normal movements, but prefixing them with `<leader><leader>`

For example this screen shot demonstrates pressing `,,w`

![easymotion image][easymotion-img]

## [Lightline]

Lightline provides a lightweight themable statusline with no external dependencies. By default this configuration uses the symbols `‹` and `›` as separators for different statusline sections but can be configured to use the same symbols as [Powerline]. Examples of tagline and statusline are shown here:

![lightline tab image][lightline-tab-img]
![lightline status image][lightline-status-img]

To use powerline fonts and file icons, you need to install the nerd icons patched font: [Knack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf)

**You don't need to install powerline-patched fonts, Nerd Fonts have got powerline symbols included**

## [Vim-Multi-Cursors]

Vim-Multiple-Cursors provides sublime-text like multi-cursor support. EverVim use the default keybindings

- `<C-n>` for both activating multi-cursors mode and next selection
- `<C-p>` for previous selection
- `<C-x>` for giving up current selection and move to next virtual cursor


## Amazing Colors

EverVim includes [Dracula] and [a lot more colors](https://github.com/flazz/vim-colorschemes).

Use `:color molokai` to switch to a color scheme.

## Snippets

It also contains a very complete set of [snippets](https://github.com/spf13/snipmate-snippets) for use with snipmate or [neocomplete].

[PIV]:https://github.com/spf13/PIV
[NERDCommenter]:https://github.com/scrooloose/nerdcommenter
[Undotree]:https://github.com/mbbill/undotree
[NERDTree]:https://github.com/scrooloose/nerdtree
[ctrlp]:https://github.com/kien/ctrlp.vim
[Dracula]:https://draculatheme.com/
[neocomplete]:https://github.com/shougo/neocomplete
[Fugitive]:https://github.com/tpope/vim-fugitive
[Surround]:https://github.com/tpope/vim-surround
[Vim-Multi-Cursors]:https://github.com/terryma/vim-multiple-cursors
[Tagbar]:https://github.com/majutsushi/tagbar
[Syntastic]:https://github.com/scrooloose/syntastic
[vim-easymotion]:https://github.com/Lokaltog/vim-easymotion
[YouCompleteMe]:https://github.com/Valloric/YouCompleteMe
[Matchit]:http://www.vim.org/scripts/script.php?script_id=39
[Tabularize]:https://github.com/godlygeek/tabular
[EasyMotion]:https://github.com/Lokaltog/vim-easymotion
[Lightline]:https://github.com/itchyny/lightline.vim
[Powerline]:https://github.com/lokaltog/powerline
[Powerline Fonts]:https://github.com/Lokaltog/powerline-fonts
[AutoClose]:https://github.com/spf13/vim-autoclose
[Ack.vim]:https://github.com/mileszs/ack.vim

[autocomplete-img]:http://i.imgur.com/rv1wASZ.png
[tagbar-img]:http://i.imgur.com/GgxdXSI.png
[fugitive-img]:http://i.imgur.com/BgRJojC.png
[easymotion-img]:http://i.imgur.com/rhb3kcP.png
[lightline-status-img]:http://i.imgur.com/x1tby0V.png
[lightline-tab-img]: http://i.imgur.com/8Q09MMu.png
