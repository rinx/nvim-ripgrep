(module nvim-ripgrep.config
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(defonce config {:prompt "❯ "
                 :window {:width 0.8
                          :border :rounded}
                 :run-opts {}})
