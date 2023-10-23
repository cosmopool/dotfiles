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

local plugins = {
  -- NOTE: This import will automatically add all plugins from `lua/custom/plugins/*.lua`
  { import = 'plugins' },
}

require("lazy").setup(plugins)

--print(vim.inspect(require("lazy.core.config").plugins))
