;; emacs美化配置
;; 全屏显示
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 关闭工具栏
(tool-bar-mode -1)
(menu-bar-mode -1)

;; 关闭文件滑动控件
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
;; (load-theme 'tsdh-dark)
(load-theme 'gruvbox 1)

;; -------* *--------- ;;
(provide 'init-ui)
