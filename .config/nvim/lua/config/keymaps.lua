local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-q>", ":q!<CR>", opts)
