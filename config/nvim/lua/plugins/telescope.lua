local config = function ()
  require("telescope").load_extension("flutter")
end

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = config,
}
