local harpoon = require 'harpoon'

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<leader>hm', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = '[H]arpoon [M]enu' })

vim.keymap.set('n', '<leader>h1', function()
  harpoon:list():select(1)
end, { desc = 'Select item 1' })

vim.keymap.set('n', '<leader>h2', function()
  harpoon:list():select(1)
end, { desc = 'Select item 1' })

vim.keymap.set('n', '<leader>h3', function()
  harpoon:list():select(1)
end, { desc = 'Select item 1' })

vim.keymap.set('n', '<leader>hp', function()
  harpoon:list():prev()
end, { desc = '[H]arpoon [P]revious' })
vim.keymap.set('n', '<leader>hn', function()
  harpoon:list():next()
end, { desc = '[H]arpoon [N]next' })
