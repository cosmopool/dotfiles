vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- PLUGINS ----------------------------
require("core.lazy")
-- SETTINGS ---------------------------
if vim.loader then vim.loader.enable() end
require("core.options")
require("core.keymaps")
-- THEME ------------------------------
vim.cmd.colorscheme("onedark")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
