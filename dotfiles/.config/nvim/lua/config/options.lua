-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

venv_root = os.getenv("PYENV_ROOT")
venv_name = "py3nvim"
if venv_root ~= nil then
  vim.g.python3_host_prog = venv_root .. "/versions/" .. venv_name .. "/bin/python"
end

local opt = vim.opt

-- opt.mouse = ""
opt.relativenumber = false -- Relative line number
