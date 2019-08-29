;; 使org文本文件支持语法高亮
(require 'org)
(setq org-src-fontify-natively 1)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; --------* *------- ;;
(provide 'init-org)
