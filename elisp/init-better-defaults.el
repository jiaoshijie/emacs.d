;; 禁止emacs自动生成备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 自动更新配置文件
(global-auto-revert-mode t)

;; 显示行号
(global-linum-mode 1)
(global-hl-line-mode 1)

;; 定义简写
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; jiaoshijie
					    ("8sj" "jiaoshijie")
					    ;; mingzikuazhang
					    ("8mz" "mingzikuazhang")
					    ))

;; 显示最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 向正常编辑器一样替换
(delete-selection-mode 1)

;; 匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; ---------* *-------- ;;
(provide 'init-better-defaults)
