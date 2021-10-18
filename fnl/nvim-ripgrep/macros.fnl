(fn bufmap! [bufnr modes from to ...]
  (let [opts (collect [_ opt (ipairs [...])]
               (values (tostring opt) true))
        out []]
    (each [_ mode (ipairs modes)]
      (table.insert out `(nvim.buf_set_keymap ,bufnr ,mode ,from ,to ,opts)))
    (if (> (length out) 1)
      `(do ,(unpack out))
      `,(unpack out))))

(fn bufnoremap! [bufnr modes from to ...]
  `(bufmap! ,bufnr ,modes ,from ,to :noremap ,...))

{: bufmap!
 : bufnoremap!}
