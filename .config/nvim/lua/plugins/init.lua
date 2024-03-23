return {
  {
    'Mofiqul/vscode.nvim',
    config = function()
      local c = require('vscode.colors').get_colors()
      local vscode = require 'vscode'
      vscode.setup {
        transparent = true,
        italic_comments = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        color_overrides = {
          vscLineNumber = '#FFFFFF',
        },

        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      }
      vscode.load()
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
}
