local _2afile_2a = "fnl/nvim-ripgrep/popup.fnl"
local _2amodule_name_2a = "nvim-ripgrep.popup"
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
local config, core, nvim, _ = autoload("nvim-ripgrep.config"), autoload("nvim-ripgrep.aniseed.core"), autoload("nvim-ripgrep.aniseed.nvim"), nil
_2amodule_locals_2a["config"] = config
_2amodule_locals_2a["core"] = core
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["_"] = _
local function editor_width()
  return nvim.o.columns
end
_2amodule_locals_2a["editor-width"] = editor_width
local function editor_height()
  return nvim.o.lines
end
_2amodule_locals_2a["editor-height"] = editor_height
local function delete(bufnr, winnr)
  if (vim.fn.mode() == "i") then
    nvim.command("stopinsert")
  else
  end
  if nvim.win_is_valid(winnr) then
    nvim.win_close(winnr, true)
  else
  end
  if nvim.buf_is_valid(bufnr) then
    return nvim.buf_delete(bufnr, {force = true})
  else
    return nil
  end
end
_2amodule_2a["delete"] = delete
local function do_grep(bufnr, winnr)
  local prompt_len = #config.config.prompt
  local line = vim.fn.getline(".")
  local term = vim.trim(line:sub(prompt_len, -1))
  delete(bufnr, winnr)
  return config.config.runner(term)
end
_2amodule_2a["do-grep"] = do_grep
local function create()
  local bufnr = nvim.create_buf(false, true)
  local winnr = nvim.open_win(bufnr, 0, {width = math.floor((editor_width() * config.config.window.width)), height = 1, row = core.dec(math.floor((editor_height() / 3))), col = math.floor(((editor_width() * (1 - config.config.window.width)) / 2)), focusable = true, noautocmd = true, relative = "editor", anchor = "NW", style = "minimal", border = config.config.window.border})
  nvim.buf_set_option(bufnr, "buftype", "prompt")
  vim.fn.prompt_setprompt(bufnr, config.config.prompt)
  nvim.command("startinsert")
  nvim.win_set_option(winnr, "winhl", "Normal:RgNormal,FloatBorder:RgBorder")
  nvim.buf_set_keymap(bufnr, "n", "<Esc>", ("<Cmd>lua require('" .. _2amodule_name_2a .. "')['delete'](" .. bufnr .. "," .. winnr .. ")<CR>"), {})
  nvim.buf_set_keymap(bufnr, "i", "<C-c>", ("<Cmd>lua require('" .. _2amodule_name_2a .. "')['delete'](" .. bufnr .. "," .. winnr .. ")<CR>"), {})
  nvim.buf_set_keymap(bufnr, "n", "<CR>", ("<Cmd>lua require('" .. _2amodule_name_2a .. "')['do-grep'](" .. bufnr .. "," .. winnr .. ")<CR>"), {})
  return nvim.buf_set_keymap(bufnr, "i", "<CR>", ("<Cmd>lua require('" .. _2amodule_name_2a .. "')['do-grep'](" .. bufnr .. "," .. winnr .. ")<CR>"), {})
end
_2amodule_2a["create"] = create
--[[ (create) ]]--
return nil