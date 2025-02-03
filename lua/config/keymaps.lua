-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- For conciseness
local opts = { noremap = true, silent = true }
-- Press jk or ол fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "ол", "<ESC>", opts)

vim.keymap.set("n", "<leader>tw", function()
  line_wrapping_flag = not line_wrapping_flag

  if line_wrapping_flag then
    vim.o.wrap = true
  else
    vim.o.wrap = false
  end
end, { desc = "Soft line wrapping" })

-- Toggle conceal level
local conceal_level_flag = true

vim.keymap.set("n", "<leader>tc", function()
  conceal_level_flag = not conceal_level_flag

  if conceal_level_flag then
    vim.o.conceallevel = 2
  else
    vim.o.conceallevel = 0
  end
end, { desc = "Toggle conceal level" })

-- Toggle spell checking
vim.keymap.set("n", "<leader>ts", function()
  vim.opt.spell = not vim.opt.spell:get()
  if vim.opt.spell:get() then
    print("Spell checking: on")
  else
    print("Spell checking: off")
  end
end, { desc = "Toggle spell checking" })

-- Reopen file with given encoding
vim.keymap.set("n", "<leader>fr", function()
  local encodings_choice = { "1. utf-8", "2. cp1251", "3. koi8-r", "4. cp866" }
  local encodings = { "utf-8", "cp1251", "koi8-r", "cp866" }
  local choice = vim.fn.inputlist(encodings_choice)

  if choice > 0 and choice <= #encodings then
    local selected_encoding = encodings[choice]
    vim.cmd("e ++enc=" .. selected_encoding)
    print("\nFile reopened with encoding: " .. selected_encoding)
  else
    print("\nInvalid choice or canceled")
  end
end, { desc = "Reopen file with selected encoding" })
