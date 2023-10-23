local setup = {
  size = 10,
  on_create = function()
    vim.opt.foldcolumn = "0"
    vim.opt.signcolumn = "no"
  end,
  open_mapping = [[<F7>]],
  shading_factor = 2,
  direction = "float",
  float_opts = {
    -- see :h nvim_open_win for details on borders however
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = "curved",
    highlights = { border = "Normal", background = "Normal" },
    winblend = 3,
  },
}

return {
  "akinsho/toggleterm.nvim",
  tag = "v2.7.0",
  config = true,
}
