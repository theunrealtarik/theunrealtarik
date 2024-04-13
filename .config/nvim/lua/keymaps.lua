-- general i guess
vim.keymap.set('n', '<C-s>', '<cmd>write!<CR>')
vim.keymap.set('n', '<C-z>', '<cmd>:u<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

vim.keymap.set('n', '<leader>ft', '<cmd>NvimTreeFocus<CR>', { desc = '[F]ocus On [T]ree' })
vim.keymap.set('n', '<leader>qd', '<cmd>TroubleToggle document_diagnostics<CR>', { desc = 'Open diagnostic [D]ocument [Q]uickfix list' })
vim.keymap.set('n', '<leader>qw', '<cmd>TroubleToggle workspace_diagnostics<CR>', { desc = 'Open diagnostic [W]workspace [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- lsp
vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover()
end, { desc = 'LSP Hover' })

-- diagnostic
local function toggle_diagnostics(vt)
  local diagnostic = vim.diagnostic

  if vt then
    local v = diagnostic.config().virtual_text
    if v then
      vim.diagnostic.config { virtual_text = false }
    else
      vim.diagnostic.config { virtual_text = true }
    end
  else
    local v = diagnostic.is_disabled()
    if v then
      vim.diagnostic.enable()
    else
      vim.diagnostic.disable()
    end
  end
end

vim.keymap.set('n', '<leader>lV', function()
  toggle_diagnostics(true)
end, { desc = '[D]iagnostics Toggle [V]irtual [T]ext' })

vim.keymap.set('n', '<leader>lT', function()
  toggle_diagnostics(false)
end, { desc = '[D]iagnostics [T]oggle' })

vim.keymap.set('n', '<leader>lfm', function()
  vim.lsp.buf.format { async = false }
end, { desc = '[L]sp [F]or[m]atting' })

-- end beginning
vim.keymap.set('n', '<C-b>', '<ESC>^i', { desc = 'End of line' })
vim.keymap.set('n', '<C-e>', '<End>', { desc = 'Move focus to the upper window' })

vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'End of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'Move focus to the upper window' })

vim.keymap.set('v', '<C-b>', '<ESC>^i', { desc = 'End of line' })
vim.keymap.set('v', '<C-e>', '<End>', { desc = 'Move focus to the upper window' })

-- comments
vim.keymap.set('n', '<leader>/', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle Comment' })

-- telescope
local builtin = require 'telescope.builtin'

if builtin ~= nil then
  vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Search Files' })
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
end

vim.keymap.set('n', '<C-q>', '<cmd>q!<CR>', { desc = '[Q]uit' })

-- tree
vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', { desc = '[T]ree [T]oggle' })

-- harpoon
local harpoon = require 'harpoon'

if harpoon ~= nil then
  vim.keymap.set('n', '<leader>a', function()
    harpoon:list():add()
  end)
  vim.keymap.set('n', '<C-l>', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  vim.keymap.set('n', '<C-h>', function()
    harpoon:list():select(1)
  end, { desc = 'Select item 1' })

  vim.keymap.set('n', '<C-t>', function()
    harpoon:list():select(2)
  end, { desc = 'Select item 2' })
  vim.keymap.set('n', '<C-n>', function()
    harpoon:list():select(3)
  end, { desc = 'Select item 3' })

  vim.keymap.set('n', '<leader>hp', function()
    harpoon:list():prev()
  end, { desc = '[H]arpoon [P]revious' })
  vim.keymap.set('n', '<leader>hn', function()
    harpoon:list():next()
  end, { desc = '[H]arpoon [N]next' })
end
