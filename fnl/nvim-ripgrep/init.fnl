(module nvim-ripgrep
  {autoload {nvim aniseed.nvim
             core aniseed.core
             config nvim-ripgrep.config
             run nvim-ripgrep.run
             popup nvim-ripgrep.popup}})

(defn- set-defaults []
  (set config.config.runner run.ripgrep))

(defn setup [opts]
  (when (core.get opts :runner)
    (set config.config.runner
         (core.get opts :runner)))
  (when (core.get opts :prompt)
    (set config.config.prompt
         (core.get opts :prompt)))
  (when (core.get opts :window)
    (when (core.get-in opts [:window :width])
      (set config.config.window.width
           (core.get-in opts [:window :width])))
    (when (core.get-in opts [:window :border])
      (set config.config.window.border
           (core.get-in opts [:window :border]))))
  (when (core.get opts :open_qf_fn)
    (set config.config.run-opts.open-qf-fn
         (core.get opts :open_qf_fn))))

(defn grep []
  (popup.create))

(set-defaults)

(comment
  (setup)

  (setup
    {:prompt " "
     :window {:width 0.5
              :border :double}
     :open_qf_fn (let [e (require :nvim-ripgrep.extensions)]
                   e.trouble_open_qf)})

  (grep))
