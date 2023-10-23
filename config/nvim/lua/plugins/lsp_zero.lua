local setup_func = function()
  local lsp = require("lsp-zero").preset({})

  lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
  end)

  require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

  lsp.ensure_installed({
    --"sumneko_lua",
    "lua_ls",
    "zk",
    "vls",
    "zls",
    "lemminx",
    "sqlls",
    "jsonls",
    "clangd",
    "cmake",
    "yamlls",
    --"omnisharp-mono",
    "pyright",
    "gopls",
    "bashls",
    "rust_analyzer",
  })


  local dart_lsp = lsp.build_options("dartls", {})
     require("flutter-tools").setup({
       lsp = {
         capabilities = dart_lsp.capabilities
       }
     })

  local cmp = require("cmp")
  local cmp_select = {behavior = cmp.SelectBehavior.Insert}
  local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  })

  lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
  })

  lsp.setup()
end

return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    name = "lsp-zero",
    lazy = false,
    priority = 1000,
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig", commit = "ba74226cac83eacb435827e028f810212147937b" },
      {
        "williamboman/mason.nvim",
        tag = "v1.6.0",
        opts = { PATH = "append" },
        build = function() pcall(vim.cmd, "MasonUpdate") end,
      },
      { "williamboman/mason-lspconfig.nvim", tag = "v1.11.0" },

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"L3MON4D3/LuaSnip"},
    },
    config = setup_func
  }
