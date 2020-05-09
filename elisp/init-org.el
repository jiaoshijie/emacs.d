;; 使org文本文件支持语法高亮
(require 'org)
(setq org-src-fontify-natively 1)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Nutstore Files/Nutstore/task.org" "从心出发")
         "* TODO %?\n  %i\n"
         :empty-lines 1)))

;; --------* *------- ;;
(provide 'init-org)
