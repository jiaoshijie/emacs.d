;; emacs美化配置

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; 替换启动画面
(setq inhibit-splash-screen 1)
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-center-content t)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

;; 修改光标的样式
(setq-default cursor-type 'bar)

;; 设置字体
(set-default-font "Source Code Pro-14")

;; 设置透明效果
(set-frame-parameter nil 'alpha '(90 .100))

;; 设置主题
(load-theme 'doom-one 1)

(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-icon nil)

;; -------* *--------- ;;
(provide 'init-style)
