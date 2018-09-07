;;; lang/lua/config.el -*- lexical-binding: t; -*-

;; sp's default rules are obnoxious, so disable them
(provide 'smartparens-lua)


(after! lua-mode
  (set-lookup-handlers! 'lua-mode :documentation 'lua-search-documentation)
  (set-electric! 'lua-mode :words '("else" "end"))
  (set-repl-handler! 'lua-mode #'+lua/repl)
  (set-company-backend! 'lua-mode '(company-lua company-yasnippet)))


(after! moonscript
  (defvaralias 'moonscript-indent-offset 'tab-width))


;;
;; Frameworks

(def-project-mode! +lua-love-mode
  :modes (lua-mode markdown-mode json-mode)
  :files (and "main.lua" "conf.lua")
  :on-load
  (map! :map +lua-love-mode-map
        :localleader
        :n "b" #'+lua/run-love-game))
