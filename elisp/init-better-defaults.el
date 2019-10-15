(set-language-environment "UTF-8")

;; 禁止emacs自动生成备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 自动更新配置文件
(global-auto-revert-mode t)

;; 显示行号
(global-linum-mode 1)
(global-hl-line-mode 1)

;; 定义简写
(abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					    ;; jiaoshijie
					    ("8sj" "jiaoshijie")
					    ))

;; 显示最近打开的文件
(use-package recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 向正常编辑器一样替换
(delete-selection-mode 1)

;; 匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 代码格式化
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;; 特殊补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;; 隐藏DOS下的换行符
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

;; 删除DOS下的换行符
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 进行目录操作是重用一个buffer
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (use-package dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; ---------* *-------- ;;
(provide 'init-better-defaults)
