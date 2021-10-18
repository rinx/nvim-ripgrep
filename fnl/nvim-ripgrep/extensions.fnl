(module nvim-ripgrep.extensions
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(defn trouble_open_qf []
  (let [trouble (require :trouble)]
    (trouble.open :quickfix)))
