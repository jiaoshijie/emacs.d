;; emacs美化配置
;; 全屏显示
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 关闭缩进
;; (electric-indent-mode -1)
;; 修改光标的样式
(setq-default cursor-type 'bar)

;; 设置字体
(set-default-font "Source Code Pro-14")

;; 设置主题
(load-theme 'doom-one 1)

;; set powerline
(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))
(setq doom-modeline-height 25)
(setq doom-modeline-bar-width 3)
;; (require 'doom-modeline)
;; (doom-modeline-mode 1)

;; terminal cursor
(unless (display-graphic-p)
  (use-package evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate) ;; or (etcc-on)
  )
(setq evil-motion-state-cursor 'box)
(setq evil-visual-state-cursor 'box)
(setq evil-normal-state-cursor 'box)
(setq evil-insert-state-cursor 'bar)
(setq evil-replace-state-cursor 'hbar)
(setq evil-emacs-state-cursor 'bar)

;; fonts
(use-package all-the-icons)

;; -------* *--------- ;;
(provide 'init-ui)
