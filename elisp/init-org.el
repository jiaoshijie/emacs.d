;; 使org文本文件支持语法高亮
(require 'org)
(setq org-src-fontify-natively 1)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)))

;; --------* *------- ;;
(provide 'init-org)
