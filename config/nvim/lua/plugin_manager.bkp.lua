local plugin_list = {
{
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    tag = "v1.6.0",
    config = function()
      require("mason").setup()
    end,
},
{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
{"williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers {
        function (server_name)
            require("lspconfig")[server_name].setup {}
        end,
    }
  end
},
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    {"rcarriga/nvim-dap-ui", version = "^3", optional = true },
    {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = { java = false },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
    config = function(_, opts)
  local npairs = require "nvim-autopairs"
  npairs.setup(opts)

  if not vim.g.autopairs_enabled then npairs.disable() end
  local cmp_status_ok, cmp = pcall(require, "cmp")
  if cmp_status_ok then
    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done { tex = false })
  end
end,
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    opts = function()
      --local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      --return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      size = 10,
      on_create = function()
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = { border = "Normal", background = "Normal" },
      },
    },
  },
  {
  "mfussenegger/nvim-dap",
  enabled = vim.fn.has "win32" == 0,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = { handlers = {} },
    },
    {
      "rcarriga/cmp-dap",
      dependencies = { "nvim-cmp" },
      config = function()
  require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" },
    },
  })
end,
    },
  },
  event = "User AstroFile",
},
{
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NullLsInstall", "NullLsUninstall" },
        opts = { handlers = {} },
      },
    },
    --event = "User AstroFile",
    --opts = function() return { on_attach = require("astronvim.utils.lsp").on_attach } end,
  },
}

-- local function generate_plugin_list()
--   return 
-- end

--local files = fs.list(".")
local files = {}
local table = {}

for _, file in ipairs(files) do
  if file:match("%.lua$") then
    local file_content = require(file)
    table[#table + 1] = file_content
  end
end

print(table)

require("lazy").setup(plugin_list)
