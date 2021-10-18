local _2afile_2a = "fnl/nvim-ripgrep/init.fnl"
local _2amodule_name_2a = "nvim-ripgrep"
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
local config, core, nvim, popup, run = autoload("nvim-ripgrep.config"), autoload("nvim-ripgrep.aniseed.core"), autoload("nvim-ripgrep.aniseed.nvim"), autoload("nvim-ripgrep.popup"), autoload("nvim-ripgrep.run")
do end (_2amodule_locals_2a)["config"] = config
_2amodule_locals_2a["core"] = core
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["popup"] = popup
_2amodule_locals_2a["run"] = run
local function set_defaults()
  config.config.runner = run.ripgrep
  return nil
end
_2amodule_locals_2a["set-defaults"] = set_defaults
local function setup(opts)
  if core.get(opts, "runner") then
    config.config.runner = core.get(opts, "runner")
  else
  end
  if core.get(opts, "prompt") then
    config.config.prompt = core.get(opts, "prompt")
  else
  end
  if core.get(opts, "window") then
    if core["get-in"](opts, {"window", "width"}) then
      config.config.window.width = core["get-in"](opts, {"window", "width"})
    else
    end
    if core["get-in"](opts, {"window", "border"}) then
      config.config.window.border = core["get-in"](opts, {"window", "border"})
    else
    end
  else
  end
  if core.get(opts, "open_qf_fn") then
    config.config["run-opts"]["open-qf-fn"] = core.get(opts, "open_qf_fn")
    return nil
  else
    return nil
  end
end
_2amodule_2a["setup"] = setup
local function grep()
  return popup.create()
end
_2amodule_2a["grep"] = grep
set_defaults()
--[[ (setup) (setup {:open_qf_fn (let [e (require "nvim-ripgrep.extensions")] e.trouble_open_qf)
 :prompt " "
 :window {:border "double" :width 0.5}}) (grep) ]]--
return nil