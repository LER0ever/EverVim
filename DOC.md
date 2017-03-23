# EverVim Documentation
## Customization

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
5. `.vimrc` - spf13-vim vim configuration
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