local get_icon = require("core.utils").get_icon

local global_commands = {
  system_open = function(state) require("astronvim.utils").system_open(state.tree:get_node():get_id()) end,
  parent_or_close = function(state)
    local node = state.tree:get_node()
    if (node.type == "directory" or node:has_children()) and node:is_expanded() then
      state.commands.toggle_node(state)
    else
      require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
    end
  end,
  child_or_open = function(state)
    local node = state.tree:get_node()
    if node.type == "directory" or node:has_children() then
      if not node:is_expanded() then -- if unexpanded, expand
        state.commands.toggle_node(state)
      else                           -- if expanded and has children, seleect the next child
        require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
      end
    else -- if not a directory just open it
      state.commands.open(state)
    end
  end,
}

local setup = {
  enable_diagnostics = true,
  close_if_last_window = true,
  source_selector = {
    winbar = true,
    content_layout = "center",
    tab_labels = {
      filesystem = get_icon "FolderClosed" .. " File",
      buffers = get_icon "DefaultFile" .. " Bufs",
      git_status = get_icon "Git" .. " Git",
      diagnostics = get_icon "Diagnostic" .. " Diagnostic",
    },
  },
  default_component_configs = {
    indent = {
      padding = 0,
      indent_size = 2,
      expander_collapsed = "",
      expander_expanded = "",
    },
    icon = {
      folder_closed = get_icon "FolderClosed",
      folder_open = get_icon "FolderOpen",
      folder_empty = get_icon "FolderEmpty",
      default = get_icon "DefaultFile",
    },
    modified = { symbol = get_icon "FileModified" },
    git_status = {
      symbols = {
        added = get_icon "GitAdd",
        deleted = get_icon "GitDelete",
        modified = get_icon "GitChange",
        renamed = get_icon "GitRenamed",
        untracked = get_icon "GitUntracked",
        ignored = get_icon "GitIgnored",
        unstaged = get_icon "GitUnstaged",
        staged = get_icon "GitStaged",
        conflict = get_icon "GitConflict",
      },
    },
  },
  window = {
    position = "right",
    width = 35,
    mappings = {
      ["<space>"] = false, -- disable space until we figure out which-key disabling
      ["l"] = false,
      ["zj"] = "prev_source",
      ["z;"] = "next_source",
      o = "open",
      O = "system_open",
      h = "parent_or_close",
      [";"] = "child_or_open",
    },
  },
  commands = global_commands,
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
  -- buffers = { commands = global_commands },
  -- git_status = { commands = global_commands },
  event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
    {
      event = "file_opened",
      handler = function(_)
        require("neo-tree.command").execute({ action = "close" })
      end
    },
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  tag = "2.70",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" }, -- not strictly required, but recommended
    { "MunifTanjim/nui.nvim" },
  },
  config = function()
    require("neo-tree").setup(setup)
  end,
  -- opts = setup,
}
