(setq gc-cons-threshold (* 50 1000 1000))

(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/extra_package/fcitx.el/")

(require 'init-plugins)
(use-package init-basic)
(use-package init-org)
(use-package init-style)
(use-package init-keybindings)

;; gui配置
(setq custom-file (expand-file-name "elisp/custom.el" user-emacs-directory))
(load-file custom-file)

(setq gc-cons-threshold (* 2 1000 1000))
