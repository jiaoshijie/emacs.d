;; 插件管理
(require 'package)
(package-initialize)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
                      ;; ----- * theme * ----- ;;
                      doom-themes

                      ;; ----- * evil * ----- ;;
                      evil
                      evil-leader
                      evil-surround
                      evil-nerd-commenter

                      window-numbering
                      popwin
                      smartparens
                      company
                      counsel
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

(require 'evil-surround)
(global-evil-surround-mode)

(evilnc-default-hotkeys)
;; ------------------* evil end *---------------------- ;;

;; smartparens配置
(require 'smartparens-config)
(smartparens-global-mode t)

;; popwin
(require 'popwin)
(popwin-mode 1)

;; 补全插件
(global-company-mode 1)

(provide 'init-plugins)
