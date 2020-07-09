;; emacs美化配置

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; 替换启动画面
 (setq inhibit-splash-screen 1)
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-center-content t)

;; 修改光标的样式
(setq-default cursor-type 'bar)

;; 设置字体
(set-default-font "Source Code Pro-14")

(require 'powerline)
(powerline-center-evil-theme)

;; -------* *--------- ;;
(provide 'init-style)
