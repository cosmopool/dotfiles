local config = {

  -- colorscheme = "moonfly",
  default_theme = {
    highlights = function(hi)
      local C = require "default_theme.colors"
      hi.Normal = { bg = C.none, ctermbg = C.none }
      return hi
    end,
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   -- local_vim.cmd = [[hi Normal ctermbg=none guibg=none]]
  --   -- local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   -- local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  otions = {
    opt = {
      relativenumber = true,
    },
    g = {
      mapleader = " ",
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      "pyright",
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
      -- Example disabling formatting for a specific language server
      -- gopls = { -- override table for require("lspconfig").gopls.setup({...})
      --   on_attach = function(client, bufnr)
      --     client.resolved_capabilities.document_formatting = false
      --   end
      -- }
    },
  },

  mappings = {
    n = {
      -- Movement
      ["j"] = { "h" },
      ["k"] = { "j" },
      ["l"] = { "k" },
      [";"] = { "l" },

      -- General
      ["<C-s>"] = { "<cmd>lua vim.lsp.buf.format()<CR> :w!<CR>", desc = "Format and Save File" },
      ["<leader>nh"] = { ":nohlsearch<CR>" },
      ["<F10>"] = { "<cmd>ToggleTerm<CR>", desc = "Toggle terminal on/off" },

      -- Buffer
      ["<leader>bn"] = { "<cmd>tabnew<CR>", desc = "New tab" },
      ["<leader>bd"] = { ":bd<CR>", desc = "Pick to close" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<CR>", desc = "Sort by tabs" },
      ["zj"] = { "<cmd>BufferLineCyclePrev<CR>", desc = "Open next buffer" },
      ["z;"] = { "<cmd>BufferLineCycleNext<CR>", desc = "Open prev buffer" },
      ["zzj"] = { "<cmd>BufferLineMovePrev<CR>", desc = "Move buffer to right" },
      ["zz;"] = { "<cmd>BufferLineMoveNext<CR>", desc = "Move buffer to left" },

      -- Tabs
      ["<leader>zj"] = { ":tabn<CR>", desc = "Open next tab" },
      ["<leader>z;"] = { ":tabp<CR>", desc = "Open prev tab" },

      -- LSP
      ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
      ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
      ["ga"] = { "<cmd>Lspsaga code_action<CR>", desc = "Code actions" },
      ["gh"] = { "<cmd>Lspsaga hover_doc<CR>", desc = "Code documentation" },
      ["grr"] = { "<cmd>Lspsaga rename<cr>", desc = "Code rename current" },
      ["gx"] = { ":<c-u>Lspsaga range_code_action<cr>", desc = "Range code actions" },
      ["go"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Code line diagnostics" },
      ["gj"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Code next diagnostics" },
      ["gk"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Code prev diagnostics" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
      ["ga"] = false,
      ["gh"] = false,
      ["<leader>e"] = false,
      ["<leader>t"] = false,
    },
    v = {
      ["j"] = { "h" },
      ["k"] = { "j" },
      ["l"] = { "k" },
      [";"] = { "l" },
    },
  },

  -- Configure plugins
  plugins = {
    init = {
      -- You can disable default plugins as follows:
      ["goolord/alpha-nvim"] = { disable = true },

      ["rcarriga/nvim-notify"] = { disable = true },

      ["lokesh-krishna/moonfly.nvim"] = {},

      ["neovim/nvim-lspconfig"] = {},

      ["fedepujol/move.nvim"] = {},

      ["tpope/vim-fugitive"] = {},

      ["ollykel/v-vim"] = {},

      ["mfussenegger/nvim-dap"] = {
        config = function()
          local present, dap = pcall(require, "dap")

          if not present then
            return
          end

          dap.adapters.dart = {
            type = "executable",
            command = "node",
            args = { os.getenv('HOME') .. ".local/share/dart-debugger/debug.js", "flutter test" }
          }
          dap.configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Launch flutter",
              dartSdkPath = os.getenv('HOME') .. ".local/share/flutter/bin/cache/dart-sdk/",
              flutterSdkPath = os.getenv('HOME') .. ".local/share/flutter",
              program = "${file}",
              cwd = "${workspaceFolder}",
            }
          }
        end
      },

      ["akinsho/toggleterm.nvim"] = {
        open_mapping = [[<F10>]],
        close_on_exit = false,
        terminal_mappings = true,
      },

      ["glepnir/lspsaga.nvim"] = {
        branch = "main",
        config = function() require("lspsaga").init_lsp_saga {} end,
      },

      ["akinsho/flutter-tools.nvim"] = {
        requires = "nvim-lua/plenary.nvim",
        config = function() require("flutter-tools").setup {} end,
      },
    },

    treesitter = {
      ensure_installed = { "lua", "dart", "go", "json", "yaml", "v" },
    },

    colorizer = {
      { "*" },
      {
        RRGGBBAA = true,
      },
    },

    ["neo-tree"] = {
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          indent_size = 2,
          expander_collapsed = "",
          expander_expanded = "",
        },
      },
      window = {
        position = "right",
        width = 35,
      },
      event_handlers = {

        {
          event = "file_opened",
          handler = function(file_path)
            --auto close
            require("neo-tree").close_all()
          end
        },

      },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },


  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set key binding
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    vim.filetype.add {
      -- extension = {
      --   foo = "fooscript",
      -- },
      -- filename = {
      --   ["Foofile"] = "fooscript",
      -- },
      pattern = {
        -- ["~/Development/pixlog_app/.*"] = "Pixlog App",
        -- ["~/Development/.*"] = "Development",
        -- ["~/%.config/.*"] = "Config [User]",
      },
    }
  end,
}

return config
