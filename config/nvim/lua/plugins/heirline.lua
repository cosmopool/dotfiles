local setup = {}

return {
    "rebelot/heirline.nvim",
    tag = "v1.0.0",
    lazy = "UiEnter",
    config = function()
        require("heirline").setup(setup)
    end
}
