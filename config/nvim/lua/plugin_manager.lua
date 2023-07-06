local plugin_list = {
}

-- local function generate_plugin_list()
--   return 
-- end

--local files = fs.list(".")
--local files = {}
--local table = {}

--for _, file in ipairs(files) do
  --if file:match("%.lua$") then
    --local file_content = require(file)
    --table[#table + 1] = file_content
  --end
--end

local function loop_lua_files(directory)
  local plugins_directory = vim.fn.stdpath("config") .. "/lua"
  local files = vim.api.nvim_get_runtime_file(plugins_directory .. "*", false)
  print(vim.inspect(require("plugins.*")))
  --print(vim.inspect(files))
  --print(vim.inspect(vim.fn.stdpath("config") .. "/lua/plugins"))
  --print(vim.inspect(vim.fn.stdpath("config"):gsub("[^/\\]+$", "plugins")))

  for _, file in ipairs(files) do
    --if not file:match("%.lua$") then return end
    --print(require(file))
  end
end

loop_lua_files(".")


require("lazy").setup(plugin_list)
