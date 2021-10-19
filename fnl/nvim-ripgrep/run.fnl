(module nvim-ripgrep.run
  {autoload {nvim aniseed.nvim
             core aniseed.core
             config nvim-ripgrep.config}})

(defn- ->quickfix [data]
  (vim.fn.setqflist [] :r {:title "Grep results"
                           :lines data}))

(defn run-async [cmd opts]
  (let [stdout (vim.loop.new_pipe false)
        stderr (vim.loop.new_pipe false)
        results []
        onread (fn [err data]
                 (when err
                   (print err))
                 (when data
                   (let [vals (vim.split data "\n")]
                     (each [_ d (pairs vals)]
                       (table.insert results d)))))
        handle (vim.loop.spawn
                 cmd
                 {:args (core.get opts :args)
                  :stdio [nil stdout stderr]}
                 (vim.schedule_wrap
                   (fn []
                     (stdout:read_stop)
                     (stderr:read_stop)
                     (stdout:close)
                     (stderr:close)
                     (handle:close)
                     (->quickfix results)
                     (when (> (length results) 0)
                       (when (core.get opts :open-qf-fn)
                         (let [f (core.get opts :open-qf-fn)]
                           (f)))))))]
    (vim.loop.read_start stdout onread)
    (vim.loop.read_start stderr onread)))

(defn run [cmd opts]
  (run-async cmd (core.merge opts config.config.run-opts)))

(defn ripgrep [term]
  (run :rg {:args [term :--vimgrep :--smart-case]}))

(defn pt [term]
  (run :pt {:args [term :--nogroup :--nocolor :--smart-case]}))

(comment
  (run-async
    :rg
    {:args [:test
            :--vimgrep
            :--smart-case]})

  (ripgrep :Hello)
  (pt :Hello))
