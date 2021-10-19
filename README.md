# nvim-ripgrep

A Neovim plugin that runs ripgrep `rg` (`ag`, `pt`) asynchronously and send results into quickfix list.

![demo](https://user-images.githubusercontent.com/1588935/137737370-e140e271-139a-491b-9719-9c25f8ee0880.gif)

## Installation

Using packer.nvim,

```lua
use {
  "rinx/nvim-ripgrep",
  config = function()
    require("nvim-ripgrep").setup {
        -- your configurations here
    }
  end
  }
```

This plugin requires [ripgrep](https://github.com/BurntSushi/ripgrep).

## Usage

This plugin does not create a binding to Vim commands.
Please write a command to call `grep()` function like the following.

```vim
command! Rg lua require'nvim-ripgrep'.grep()
```

`grep()` will show a floating window that accepts grep query.
After search, quickfix window will be shown.

## Configurations

Default:

```lua
{
    runner = require('nvim-ripgrep.run').ripgrep, -- grep command
    prompt = "❯ ", -- prompt
    window = {
        width = 0.8,
        border = "rounded",
    }
    open_qf_fn = function()
        return vim.api.nvim_command('copen')
    end,
}
```

By default, the search command is fixed as `rg {query} --vimgrep --smart-case`.
If you want to change it, please modify the `runner` field.

```lua
    -- Predefined `pt` search command.
    -- `pt {query} --nogroup --nocolor --smart-case`
    runner = require('nvim-ripgrep.run').pt,

    -- Or you can define your own search command.
    runner = function(query)
        return require('nvim-ripgrep.run').run(
            'rg',
            {
                args = {
                    '--vimgrep',
                    '--smart-case',
                    '--regexp',
                    query
                },
            },
        )
    end,
```

If you use [trouble.nvim](https://github.com/folke/trouble.nvim), it is recommended to set `Trouble quickfix` as `open_qf_fn`.

```lua
    open_qf_fn = require('nvim-ripgrep.extensions').trouble_open_qf,
```

## License

Unlicense
