# vimin
Minimal vim configuration meant for servers

## Installation

SSH into the remote server and clone the vimin repository:

```bash
git clone https://github.com/jceb/vimin.git ~/.vim
# or respectively for neovim use
# git clone https://github.com/jceb/vimin.git ~/.config/nvim
```

Initialize all submodules:

```bash
git submodule update --init --recursive
```

Generate helptags:

```bash
vim -c :Helptags
```

Now you're good to go.  Start hacking.

## Update

Update vimin:

```bash
git pull
```

Update submodules:

```bash
git submodule update --init --recursive
```

Update helptags:

```bash
vim -c :Helptags
```

## Customization

Customization shouldn't be necessary and is therefore not supported.  If you
miss important settings or plugins, please create a pull request or an issue.

## Plugins

The following plugins are part of the vimin distribution:

- [commentary](https://github.com/tpope/vim-commentary): handle comments with
  the `gc` mapping
- [dirvish](https://github.com/tpope/vim-unimpaired): file management in vim,
  start by pressing `-`
- [eunuch](https://github.com/tpope/vim-eunuch): Unix commands in vim
- [obsession](https://github.com/tpope/vim-obsession): store the current session
  with `:Obsession` command, load it again with `vim -S Session.vim`
- [pathogen](https://github.com/tpope/vim-pathogen): load all plugins in
  `pack/plugins/start/` directory
- [rsi](https://github.com/tpope/vim-rsi): readline mappings in vim
- [sensible](https://github.com/tpope/vim-sensible): very good default settings
- [unimpaired](https://github.com/tpope/vim-unimpaired): mappings for toggling
  options, moving text, and navigating buffers
