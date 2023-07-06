return {
  "AstroNvim/astrotheme",
  config = function()
    require("astrotheme").setup({
      highlights = {
        global = {
          -- Add or modify hl groups globaly, theme specific hl groups take priority.
          modify_hl_groups = function(hl, c)
            hl.Normal = { bg = c.none, ctermbg = c.none }
          end,
          -- ["@String"] = { fg = "#ff00ff", bg = "NONE" },
        },
        astrodark = {
          -- first parameter is the highlight table and the second parameter is the color palette table
          modify_hl_groups = function(hl, c) -- modify_hl_groups function allows you to modify hl groups,
            hl.Normal = { bg = c.none, ctermbg = c.none }
            --     hl.Comment.fg = c.my_color
            --     hl.Comment.italic = true
          end,
          --   ["@String"] = { fg = "#ff00ff", bg = "NONE" },
        },
      },
    })
  end
}
