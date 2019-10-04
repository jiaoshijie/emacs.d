;; 插件管理
;; 设置安装源和包管理
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; use-package 更好的使用包

		      ;; --- Auto-completion ---
		      company
		      auto-yasnippet  ;; 代码补全插件

		      ;; --- Themes ---
		      ;; spacemacs-theme
		      ;; darkokai
		      gruvbox-theme
		      
		      hungry-delete ;; 删除空格
		      swiper ;; 搜索
		      counsel
		      smartparens ;; 补全括号
		      window-numbering  ;; 数字交换窗口
		      which-key  ;; 展示可以使用的快捷键
		      popwin

		      ;; ----- * web plugin * ----- ;;
		      js2-mode
		      nodejs-repl
		      js2-refactor
		      web-mode

		      flycheck ;; 语法检查
		      
		      ;; ----- * edit * ------ ;;
		      markdown-mode
		      org-pomodoro

		      ;; ----- * evil * ----- ;;
		      evil
		      evil-leader
		      evil-surround
		      evil-nerd-commenter


		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;; ------------------------* end *--------------------- ;;


;; ----------* evil-mode vi layer *--------------------- ;;
(global-evil-leader-mode)
(evil-mode 1)

;; 取消evil instert 模式的屏蔽
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(window-numbering-mode 1)

(require 'evil-surround)
(global-evil-surround-mode)

(evilnc-default-hotkeys)
;; ---------------* evil end *------------------- ;;

;; show current useable keybindings
(which-key-mode 1)

;; delete space plngin
(require 'hungry-delete)
(global-hungry-delete-mode)

;; swiper设置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; smartparens配置
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; 激活flycheck
;; (global-flycheck-mode t)
(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)



;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; 设置wed-mode各种语言缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;
; popwin
(require 'popwin)
(popwin-mode 1)

;; 代码补全插件(要在最后)
(global-company-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-packages)
