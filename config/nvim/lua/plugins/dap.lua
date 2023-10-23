local dap_ui_config = function()
  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
  dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
  dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
  dapui.setup()
end

local cmp_dap_config = function()
  require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" },
    },
  })
end

local mason_dap_config = function()
  local mason_nvim_dap = require("mason-nvim-dap")
  mason_nvim_dap.setup()
end

return  {
  "mfussenegger/nvim-dap",
  tag = "0.6.0",
  enabled = vim.fn.has("win32") == 0,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    opts = { floating = { border = "rounded" } },
    config = dap_ui_config,
  },
  {
    "rcarriga/cmp-dap",
    commit = "d16f14a210cd28988b97ca8339d504533b7e09a4",
    dependencies = { "nvim-cmp" },
    config = cmp_dap_config,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "nvim-dap" },
    tag = "v3.8.3",
    cmd = { "DapInstall", "DapUninstall" },
    --opts = { handlers = {} },
    config = mason_dap_config,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-dap", "folke/neodev.nvim" },
    tag = "v3.8.3",
    config = function() require("dapui").setup() end,
  },
}
