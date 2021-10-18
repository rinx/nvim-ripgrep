(module nvim-ripgrep.popup
  {autoload {nvim aniseed.nvim
             core aniseed.core
             config nvim-ripgrep.config}
   require-macros [nvim-ripgrep.macros]})

(defn- editor-width []
  nvim.o.columns)

(defn- editor-height []
  nvim.o.lines)

(defn delete [bufnr winnr]
  (when (= (vim.fn.mode) :i)
    (nvim.command :stopinsert))
  (when (nvim.win_is_valid winnr)
    (nvim.win_close winnr true))
  (when (nvim.buf_is_valid bufnr)
    (nvim.buf_delete bufnr {:force true})))

(defn do-grep [bufnr winnr]
  (let [prompt-len (length config.config.prompt)
        line (vim.fn.getline ".")
        term (vim.trim (line:sub prompt-len -1))]
    (delete bufnr winnr)
    (config.config.runner term)))

(defn create []
  (let [bufnr (nvim.create_buf false true)
        winnr (nvim.open_win
                bufnr
                0
                {:width (math.floor
                          (* (editor-width)
                             config.config.window.width))
                 :height 1
                 :row (core.dec
                        (math.floor (/ (editor-height) 3)))
                 :col (math.floor
                        (/ (* (editor-width)
                              (- 1 config.config.window.width))
                           2))
                 :focusable true
                 :noautocmd true
                 :relative :editor
                 :anchor :NW
                 :style :minimal
                 :border config.config.window.border})]
    (nvim.buf_set_option bufnr :buftype :prompt)
    (vim.fn.prompt_setprompt bufnr config.config.prompt)
    (nvim.command :startinsert)
    (nvim.win_set_option
      winnr
      :winhl
      "Normal:RgNormal,FloatBorder:RgBorder")
    (bufmap! bufnr [:n]
             :<Esc> (.. "<Cmd>lua require('" *module-name* "')['delete']("
                        bufnr "," winnr ")<CR>"))
    (bufmap! bufnr [:i]
             :<C-c> (.. "<Cmd>lua require('" *module-name* "')['delete']("
                        bufnr "," winnr ")<CR>"))
    (bufmap! bufnr [:n :i]
             :<CR> (.. "<Cmd>lua require('" *module-name* "')['do-grep']("
                       bufnr "," winnr ")<CR>"))))

(comment
  (create))
