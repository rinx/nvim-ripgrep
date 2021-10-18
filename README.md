# nvim-ripgrep

A Neovim plugin that runs ripgrep `rg` (`ag`, `pt`) asynchronously and send results into quickfix list.

## Installation

Using packer.nvim,

```lua
use {
  "rinx/nvim-ripgrep",
  config = function()
    require("nvim-ripgrep").setup {
        -- configurations
    }
  end
  }
```

## Usage

This plugin does not create a binding to Vim commands.
Please write a command to call `grep()` function like the following.

```vim
command! Rg lua require'nvim-ripgrep'.grep()
```

`grep()` will show a floating window that accepts grep query.
After search, quickfix window will be shown.

## Configurations

```lua
{
    prompt = "❯ ", -- prompt
    window = {
        width = 0.8,
        border = "rounded",
    }
    open_qf_fn = nil, -- by default, `:copen` will be called
}
```

If you use [trouble.nvim](https://github.com/folke/trouble.nvim), it is recommended to set `Trouble quickfix` as `open_qf_fn`.

```lua
    open_qf_fn = require('nvim-ripgrep.extensions').trouble_open_qf,
```

## License

Unlicense
