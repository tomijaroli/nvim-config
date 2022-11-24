# Neovim config I use

## Installation

First install neovim using **homebrew**

```
brew install neovim
```

You will also need `ripgrip` for the `telescope` plugin to work.

```
brew install ripgrip
```

Once you have neovim installed, clone this repository into your `~/.config/` folder

```
git clone git@github.com:tomijaroli/nvim-config.git ~/.config/nvim
```

Launch neovim, on the first start it will install all the plugins. Once the plugins are installed, quit the plugin manager by pressing 'q', then exit neovim by pressing 'q' again.
Restart neovim, now `mason` is installing all the extensions needed for the `lsp`.

And it's done! Happy editing!
