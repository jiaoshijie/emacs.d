(set-language-environment "UTF-8")

;; 禁止emacs自动生成备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 显示行号
(global-linum-mode 1)
(global-hl-line-mode 1)

;; 显示最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 向正常编辑器一样替换
(delete-selection-mode 1)

;; 匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 进行目录操作是重用一个buffer
(put 'dired-find-alternate-file 'disabled nil)
;; 延迟加载
(with-eval-after-load 'dired
                      (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 中文输入法切换
(require 'fcitx)
(fcitx-aggressive-setup)

;; 设置缩进
(setq default-tab-width 2)
(setq indent-tabs-mode nil)

;; emacs-gdb
(setq gdb-many-windows t)

;; ---------* *-------- ;;
(provide 'init-basic)
