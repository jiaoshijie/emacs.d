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
(load-theme 'doom-gruvbox 1)

(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-icon nil)

;; 设置透明效果
(set-frame-parameter nil 'alpha '(90 .100))

(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-center-content t)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

;; -------* *--------- ;;
(provide 'init-style)
