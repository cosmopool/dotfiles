return {
  "thecodinglab/nvim-vlang",
  event = "BufRead *.v",
  lazy = true,
  config = function()
    require('lspconfig').vlang.setup {}
  end
}
