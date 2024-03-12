---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  transparency = true,
  tabufline = {
    show_numbers = false,
    enabled = false,
    lazyload = true,
    overriden_modules = nil,
  },
  nvdash = {
    load_on_startup = true,
  },
}

M.plugins = "custom.plugins"

return M
