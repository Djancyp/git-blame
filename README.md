# Git Blame

Yet another git blame plugin for Neovim.

## Installation

### Using a Plugin Manager

If you're using a plugin manager like [Lazy-vim](https://github.com/folke/lazy.nvim), add the following line to your `init.vim` or `init.lua`:

```lua
return {
    event = { "BufReadPre", "BufNewFile" },
    "Djancyp/git-blame"
    name = 'git-blame',
    config = function()
        require("git-blame").setup({
            exclude_filetypes = { "config" }
        })
    end,
    keys = {
        { '<leader>gb', function()
            require("git-blame").blame()
        end }
    }
}

```
