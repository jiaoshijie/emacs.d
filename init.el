(setq gc-cons-threshold (* 50 1000 1000))

(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/extra_package/fcitx.el")

;; 自己定义的函数
;; 快速打开配置文件
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(use-package init-ui)
(use-package init-better-defaults)
(use-package init-org)
(use-package init-keybindings)

;; gui配置
(setq custom-file (expand-file-name "elisp/custom.el" user-emacs-directory))
(load-file custom-file)

(setq gc-cons-threshold (* 2 1000 1000))
