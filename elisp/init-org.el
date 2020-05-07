;; 使org文本文件支持语法高亮
(use-package org
             :defer 2)
(setq org-src-fontify-natively 1)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Nutstore Files/Nutstore/Org/TODO/gtd.org" "工作安排")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)))

;; --------* *------- ;;
(provide 'init-org)
