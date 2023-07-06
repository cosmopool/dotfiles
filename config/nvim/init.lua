-- SETTINGS ---------------------------
require("options")
require("keymaps")
-- PLUGINS ----------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=v9.25.1",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("plugin_manager")
--local plugins = require("plugins")
--print(plugins)
-- LSP --------------------------------
--require("plugins.lsp")
-- THEME ------------------------------
--local theme = require("theme")
-- theme.set("themer", "nord", true)
--theme.set("moonfly")
--vim.cmd [[colorscheme moonfly]]
