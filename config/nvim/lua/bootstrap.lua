_G.settings = {}
settings.plugins_config = { "plugins" }

local function load_module_file(module)
  local module_path = module:gsub("%.", "/") .. ".lua"
  local file_exists = vim.fn.filereadable(module_path)
  if not file_exists(module_path) then return nil end

  local successful_loaded, loaded_module = pcall(require, module)
  if successful_loaded then return loaded_module
  else
    vim.api.nvim_err_writeln("Error loading file: " .. module_path .. "\n\n" .. loaded_module)
  end
end
