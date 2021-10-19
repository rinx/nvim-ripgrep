local _2afile_2a = "fnl/nvim-ripgrep/config.fnl"
local _2amodule_name_2a = "nvim-ripgrep.config"
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
local config
local function _1_()
  return nvim.command("copen")
end
config = (config or {prompt = "\226\157\175 ", window = {width = 0.8, border = "rounded"}, ["run-opts"] = {["open-qf-fn"] = _1_}})
do end (_2amodule_2a)["config"] = config