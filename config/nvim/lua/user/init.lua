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
  options = function(local_vim)
    local_vim.opt.tabstop = 4
    local_vim.g.tabstop = 4
    -- local_vim.opt.relativenumber = true
    -- local_vim.g.mapleader = " "
    -- local_vim.cmd = [[hi Normal ctermbg=none guibg=none]]
    -- local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
    -- local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list

    return local_vim
  end,

  otions = {
    opt = {
      relativenumber = true,
      noexpandtab = true,
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
      ["<C-s>"] = { "<cmd>lua vim.lsp.buf.formatting_sync()<CR> :w!<CR>", desc = "Format and Save File" },
      ["<leader>nh"] = { ":nohlsearch<CR>" },

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

      -- ["thecodinglab/nvim-vlang"] = {},

      -- ["kkharji/vlang.nvim"] = {},

      -- ["smithbm2316/centerpad.nvim"] = {},

      -- ["junegunn/goyo.vim"] = {},
      --
      -- ["mfussenegger/nvim-dap"] = {
      --   config = function()
      --     local present, dap = pcall(require, "dap")
      --
      --     if not present then
      --       return
      --     end
      --
      --     dap.adapters.dart = {
      --       type = "executable",
      --       command = "node",
      --       args = { os.getenv('HOME') .. ".local/share/dart-debugger/debug.js", "flutter test" }
      --     }
      --     dap.configurations.dart = {
      --       {
      --         type = "dart",
      --         request = "launch",
      --         name = "Launch flutter",
      --         dartSdkPath = os.getenv('HOME') .. ".local/share/flutter/bin/cache/dart-sdk/",
      --         flutterSdkPath = os.getenv('HOME') .. ".local/share/flutter",
      --         program = "${file}",
      --         cwd = "${workspaceFolder}",
      --       }
      --     }
      --   end
      -- },
      -- ["jay-babu/mason-nvim-dap.nvim"] = {
      --   config = function()
      --     local present, dap = pcall(require, "dap")
      --
      --     if not present then
      --       return
      --     end
      --
      --     local mason_dap_present, mason_dap = pcall(require, "mason-nvim-dap")
      --
      --     if not mason_dap_present then
      --       return
      --     end
      --
      --     mason_dap.setup_handlers {
      --       function(source_name)
      --         -- all sources with no handler get passed here
      --         -- Keep original functionality of `automatic_setup = true`
      --         require('mason-nvim-dap.automatic_setup')(source_name)
      --       end,
      --       dart = function(source_name)
      --         dap.configurations.dart.dartSdkPath = os.getenv('HOME') .. "/.local/share/flutter/bin/cache/dart-sdk/"
      --         dap.configurations.dart.flutterSdkPath = os.getenv('HOME') .. "/.local/share/flutter"
      --       end,
      --     }
      --   end
      -- },

      -- ["folke/zen-mode.nvim"] = {
      --   config = function()
      --     local present, zenmode = pcall(require, "zen-mode")
      --
      --     if not present then
      --       return
      --     end
      --     zenmode {
      --       window = {
      --         backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      --         -- height and width can be:
      --         -- * an absolute number of cells when > 1
      --         -- * a percentage of the width / height of the editor when <= 1
      --         -- * a function that returns the width or the height
      --         width = 120, -- width of the Zen window
      --         -- height = 1, -- height of the Zen window
      --         -- by default, no options are changed for the Zen window
      --         -- uncomment any of the options below, or add other vim.wo options you want to apply
      --         options = {
      --           -- signcolumn = "no", -- disable signcolumn
      --           number = true, -- disable number column
      --           relativenumber = true, -- disable relative numbers
      --           -- cursorline = false, -- disable cursorline
      --           -- cursorcolumn = false, -- disable cursor column
      --           -- foldcolumn = "0", -- disable fold column
      --           -- list = false, -- disable whitespace characters
      --         },
      --       },
      --       plugins = {
      --         -- disable some global vim options (vim.o...)
      --         -- comment the lines to not apply the options
      --         options = {
      --           enabled = true,
      --           ruler = false, -- disables the ruler text in the cmd line area
      --           showcmd = false, -- disables the command in the last line of the screen
      --         },
      --         twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
      --         gitsigns = { enabled = false }, -- disables git signs
      --         tmux = { enabled = false }, -- disables the tmux statusline
      --         -- this will change the font size on kitty when in zen mode
      --         -- to make this work, you need to set the following kitty options:
      --         -- - allow_remote_control socket-only
      --         -- - listen_on unix:/tmp/kitty
      --         kitty = {
      --           enabled = false,
      --           -- font = "+4", -- font size increment
      --         },
      --       },
      --       -- callback where you can add custom code when the Zen window opens
      --       on_open = function(win)
      --       end,
      --       -- callback where you can add custom code when the Zen window closes
      --       on_close = function()
      --       end,
      --     }
      --   end
      -- },

      --   ["jose-elias-alvarez/null-ls.nvim"] = {
      --     config = function()
      --       local present, null = pcall(require, "null-ls")
      --
      --       if not present then
      --         return
      --       end
      --
      --       local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      --
      --       null.setup{
      -- --       sources = {
      -- --     null.builtins.formatting.stylua,
      -- --     null.builtins.code_actions.gitsigns,
      -- --     null.builtins.completion.spell,
      -- --     null.builtins.code_actions.shellcheck,
      -- --     null.builtins.formatting.dart_format
      -- -- },
      -- on_attach = function(client, bufnr)
      --     if client.supports_method("textDocument/formatting") then
      --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      --         vim.api.nvim_create_autocmd("BufWritePre", {
      --             group = augroup,
      --             buffer = bufnr,
      --             callback = function()
      --                 vim.lsp.buf.formatting_sync()
      --             end,
      --         })
      --     end
      -- end,
      --       }
      --     end,
      --   },

      ["glepnir/lspsaga.nvim"] = {
        branch = "main",
        config = function() require('lspsaga').setup({}) end,
      },

      ["akinsho/flutter-tools.nvim"] = {
        requires = "nvim-lua/plenary.nvim",
        config = function() require("flutter-tools").setup {
            debugger = { -- integrate with nvim dap + install dart code debugger
              enabled = true,
              run_via_dap = true,
              -- exception_breakpoints = { "default" },
              -- register_configurations = function(_)
              --   require('dap').set_log_level('TRACE')
              --   require("telescope").load_extensions("flutter")
              --   require("dap").adapters.dart = {
              --     type = "executable",
              --     command = "node",
              --     args = { os.getenv('HOME') .. ".local/share/dart-debugger/debug.js", "flutter test" }
              --   }
              --   require("dap").configurations.dart = {
              --     {
              --       type = "dart",
              --       request = "launch",
              --       name = "Launch flutter",
              --       dartSdkPath = os.getenv('HOME') .. ".local/share/flutter/bin/cache/dart-sdk/",
              --       flutterSdkPath = os.getenv('HOME') .. ".local/share/flutter",
              --       program = "${file}",
              --       cwd = "${workspaceFolder}",
              --     }
              --   }
              --   require("dap.ext.vscode").load_launchjs()
              -- end,
            },
            dev_log = { enabled = false, open_cmd = "tabedit" },
            lsp = {
              color = {
                enabled = true,
                background = true,
                virtual_text = true,
                virtual_text_str = "■",
              },
              settings = {
                showTodos = true,
                renameFilesWithClasses = "prompt",
              },
              -- on_attach = require("ryewell.lsp.handlers").on_attach,
              -- capabilities = require("ryewell.lsp.handlers").capabilities,
            },
          }
        end,
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
