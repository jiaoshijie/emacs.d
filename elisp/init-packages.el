;; 插件管理
;; 设置安装源和包管理
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/")))
  ;; (setq package-archives '(("gnu"   . "/mnt/elpa/gnu/")
  ;;          ("melpa" . "/mnt/elpa/melpa/")))
  )

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
                      use-package
                      ;; ----- * theme * ----- ;;
                      doom-themes
                      doom-modeline

                      ;; ----- * evil * ----- ;;
                      evil
                      evil-leader
                      evil-surround
                      evil-nerd-commenter

                      ;; ----- * other * ---- ;;
                      company ;; 补全
                      counsel ;; 更好的显示一些功能
                      smartparens ;; 补全括号
                      window-numbering  ;; 数字交换窗口
                      popwin ;; 弹出窗口
                      markdown-mode

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


;; ---------------------------------------------------- ;;
;; --------------* evil-mode vi layer *----------------- ;;
;; ---------------------------------------------------- ;;

(global-evil-leader-mode)
(evil-mode 1)
(evil-leader/set-leader "SPC")

;; 取消evil instert 模式的屏蔽
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(window-numbering-mode 1)

(use-package evil-surround)
(global-evil-surround-mode)

(evilnc-default-hotkeys)

;; ---------------------------------------------------- ;;
;; ------------------* evil end *---------------------- ;;
;; ---------------------------------------------------- ;;

;; smartparens配置
(use-package smartparens-config)
(smartparens-global-mode t)

;; popwin
(use-package popwin)
(popwin-mode 1)

;; 补全插件
(global-company-mode 1)

(provide 'init-packages)
