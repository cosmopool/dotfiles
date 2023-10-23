local plugins = {
  -- NOTE: This import will automatically add all plugins from `lua/custom/plugins/*.lua`
  { import = 'plugins' },
}

require("lazy").setup(plugins)
