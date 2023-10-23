return {
  "glepnir/lspsaga.nvim",
  commit = "bed04d06547910b288f25c153b9bb181fecf52fa",
  event = "BufRead",
  lazy = true,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" }
  },
  config = function()
    require("lspsaga").setup({})
  end,
}
