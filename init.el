(add-to-list 'load-path "~/.emacs.d/elisp/")

;; 自己定义的函数
;; 快速打开配置文件
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

;; gui配置
(setq custom-file (expand-file-name "elisp/custom.el" user-emacs-directory))
(load-file custom-file)
