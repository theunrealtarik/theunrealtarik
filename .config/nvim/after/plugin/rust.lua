local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set('n', '<leader>ca', function()
  vim.cmd.RustLsp 'codeAction'
end, { silent = true, buffer = bufnr })

vim.keymap.set('n', '<leader>ot', function()
  vim.cmd.RustLsp 'openCargo'
end, { desc = "Open project' Cargo.toml file" })

vim.keymap.set('n', '<leader>od', function()
  vim.cmd.RustLsp 'openDocs'
end, { desc = 'Open docs.rs' })
