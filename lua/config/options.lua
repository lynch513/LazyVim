-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- the encoding written to a file
vim.opt.fileencodings = "utf-8,cp1251,koi8-r"

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Creates a swapfile
vim.o.swapfile = false

-- Always show tabs
vim.o.showtabline = 2

-- Wrap long line
vim.o.wrap = false

-- Companion to wrap don't split words
vim.o.linebreak = true

-- Set number column width {default 4}
vim.o.numberwidth = 4

-- The number of spaces inserted for each indentation
vim.o.shiftwidth = 4

-- Insert n spaces for a tab
vim.o.tabstop = 4

-- Number of spaces that a tab counts for while performing editing operations
vim.o.softtabstop = 4

-- Convert tabs to spaces
vim.o.expandtab = true

-- Allow backspace on
vim.o.backspace = "indent,eol,start"

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = { "en", "ru" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "terminal", "help", "nofile", "quickfix", "prompt", "dashboard", "neo-tree" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Cyrillic language map
local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
  -- | `to` should be first     | `from` should be second
  escape(ru_shift)
    .. ";"
    .. escape(en_shift),
  escape(ru) .. ";" .. escape(en),
}, ",")
