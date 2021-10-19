local _2afile_2a = "fnl/nvim-ripgrep/run.fnl"
local _2amodule_name_2a = "nvim-ripgrep.run"
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
local config, core, nvim = autoload("nvim-ripgrep.config"), autoload("nvim-ripgrep.aniseed.core"), autoload("nvim-ripgrep.aniseed.nvim")
do end (_2amodule_locals_2a)["config"] = config
_2amodule_locals_2a["core"] = core
_2amodule_locals_2a["nvim"] = nvim
local function __3equickfix(data)
  return vim.fn.setqflist({}, "r", {title = "Grep results", lines = data})
end
_2amodule_locals_2a["->quickfix"] = __3equickfix
local function run_async(cmd, opts)
  local stdout = vim.loop.new_pipe(false)
  local stderr = vim.loop.new_pipe(false)
  local results = {}
  local onread
  local function _1_(err, data)
    if err then
      print(err)
    else
    end
    if data then
      local vals = vim.split(data, "\n")
      for _, d in pairs(vals) do
        table.insert(results, d)
      end
      return nil
    else
      return nil
    end
  end
  onread = _1_
  local handle
  local function _4_()
    stdout:read_stop()
    stderr:read_stop()
    stdout:close()
    stderr:close()
    handle:close()
    __3equickfix(results)
    if (#results > 0) then
      if core.get(opts, "open-qf-fn") then
        local f = core.get(opts, "open-qf-fn")
        return f()
      else
        return nil
      end
    else
      return nil
    end
  end
  handle = vim.loop.spawn(cmd, {args = core.get(opts, "args"), stdio = {nil, stdout, stderr}}, vim.schedule_wrap(_4_))
  vim.loop.read_start(stdout, onread)
  return vim.loop.read_start(stderr, onread)
end
_2amodule_2a["run-async"] = run_async
local function run(cmd, opts)
  return run_async(cmd, core.merge(opts, config.config["run-opts"]))
end
_2amodule_2a["run"] = run
local function ripgrep(term)
  return run("rg", {args = {term, "--vimgrep", "--smart-case"}})
end
_2amodule_2a["ripgrep"] = ripgrep
local function pt(term)
  return run("pt", {args = {term, "--nogroup", "--nocolor", "--smart-case"}})
end
_2amodule_2a["pt"] = pt
--[[ (run-async "rg" {:args ["test" "--vimgrep" "--smart-case"]}) (ripgrep "Hello") (pt "Hello") ]]--
return nil