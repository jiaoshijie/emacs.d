(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/extra_package/fcitx.el/")

(require 'init-plugins)
(require 'init-basic)
(require 'init-org)
(require 'init-style)
(require 'init-keybindings)

;; gui配置
(setq custom-file (expand-file-name "elisp/custom.el" user-emacs-directory))
(load-file custom-file)
