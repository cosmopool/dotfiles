local config = function()
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")

  vim.keymap.set("n", "<leader>ha", mark.add_file)
  vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)

  -- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
  vim.keymap.set("n", "<C-'>", function() ui.nav_file(1) end)
  vim.keymap.set("n", "<C-m>", function() ui.nav_file(2) end)
  vim.keymap.set("n", "<C-,>", function() ui.nav_file(3) end)
  vim.keymap.set("n", "<C-.>", function() ui.nav_file(4) end)
  vim.keymap.set("n", "<C-/>", function() ui.nav_file(5) end)
end

return {
  "ThePrimeagen/harpoon",
  config = config
}
