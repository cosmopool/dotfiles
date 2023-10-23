local config = function()
  require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  --theme = "wave",              -- Load "wave" theme when 'background' option is not set
  background = {               -- map the value of 'background' option to a theme
  dark = "dragon",           -- try "dragon" !
  light = "lotus"
},
})
end

local conf = function()
  require('onedark').setup  {
    style = 'darker',
    transparent = true,
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,
    -- toggle theme style ---
    toggle_style_key = "<leader>ts",
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
    -- Change code style ---
    -- Options are italic, bold, underline, none
    code_style = {
        comments = 'italic',
        keywords = 'italic,bold',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
    -- Lualine options --
    lualine = {
        transparent = true, -- lualine center bar transparency
    },
    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups
    -- Plugins Config --
    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },
}
end

return {
-- {
--   "rebelot/kanagawa.nvim",
--   config = config,
-- },
-- {
--   'ribru17/bamboo.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('bamboo').setup ({
--       style = 'vulgaris',
--       transparent = true,
--       lualine = {
--         transparent = false, -- lualine center bar transparency
--       },
--     })      --require('bamboo').load()
--   end,
-- },
 { 
   "bluz71/vim-moonfly-colors",
   commit = "7b0040a86b200cc20f9a12300e3871ddab703e29",
   name = "moonfly",
   lazy = false,
   priority = 1000,
 },
-- { 'rose-pine/neovim',
--   lazy = false,
--   priority = 1000,
--   name = 'rose-pine',
--   config = function()
--     require('rose-pine').setup({
--       variant = "moon",
--       dark_variant = 'moon',
--     })
-- end,
-- },
-- {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
-- },
-- {
--   'JoosepAlviste/palenightfall.nvim',
--   config = function()
--     require('palenightfall').setup()
--   end
-- },
-- { 'dasupradyumna/midnight.nvim', lazy = false, priority = 1000 },
-- { 
--   "oxfist/night-owl.nvim",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
-- },
 {
   "navarasu/onedark.nvim",
   lazy = false,
   priority = 1000,
   config = conf,
 },
-- {
--    "NephIapalucci/onedarker-pro.nvim",
--    lazy = false,
--    priority = 1000,
--    --config = function()
--    --end,
-- },
}
