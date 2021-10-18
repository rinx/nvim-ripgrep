local _2afile_2a = "fnl/nvim-ripgrep/extensions.fnl"
local _2amodule_name_2a = "nvim-ripgrep.extensions"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("nvim-ripgrep.aniseed.autoload")).autoload
local core, nvim = autoload("nvim-ripgrep.aniseed.core"), autoload("nvim-ripgrep.aniseed.nvim")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["nvim"] = nvim
local function trouble_open_qf()
  local trouble = require("trouble")
  return trouble.open("quickfix")
end
_2amodule_2a["trouble_open_qf"] = trouble_open_qf