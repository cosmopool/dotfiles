return {
  {
    "tpope/vim-fugitive",
    event = "BufRead",
    lazy = true,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    lazy = true,
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  {
    "thecodinglab/nvim-vlang",
    event = "BufRead *.v",
    lazy = true,
    config = function()
      require('lspconfig').vlang.setup {}
    end
  },
}
