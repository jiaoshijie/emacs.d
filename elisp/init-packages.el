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
		      ;; --- Auto-completion ---
		      company
		      ;; --- Themes --- 设置在init-ui.el中
		      monokai-theme
		      darkokai-theme
		      ;; solarized-theme
		      hungry-delete
		      ;; smex
		      swiper
		      counsel
		      smartparens
		      js2-mode
		      nodejs-repl
		      popwin
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
;; ------------------------* 结束 *--------------------- ;;

;; 删除空格插件
(require 'hungry-delete)
(global-hungry-delete-mode)

;; popwin
(require 'popwin)
(popwin-mode 1)

;; swiper设置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; smartparens配置
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; 开启简单的补全功能
(global-company-mode 1)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))



(provide 'init-packages)
