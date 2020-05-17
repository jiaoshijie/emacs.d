;; 插件管理
(defun initialize-package ()
  (unless nil ;package--initialized
    ;; optimization, no need to activate all the packages so early
    (setq package-enable-at-startup nil)
    (package-initialize)))

(initialize-package)

(setq package-archives '(
                         ;; ("gnu" . "https://elpa.gnu.org/packages/")
                         ;; ("melpa" . "https://melpa.org/packages/")
                         ;; ("melpa-stable" . "https://stable.melpa.org/packages/")

                         ;; emacs-china mirror repository:
                         ("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/")

                         ;; 163 mirror repository:
                         ;; ("gnu" . "https://mirrors.163.com/elpa/gnu/")
                         ;; ("melpa" . "https://mirrors.163.com/elpa/melpa/")
                         ;; ("melpa-stable" . "https://mirrors.163.com/elpa/melpa-stable/")

                         ;; tsinghua mirror repository
                         ;; @see https://mirror.tuna.tsinghua.edu.cn/help/elpa/ on usage:
                         ;; ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ;; ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ;; ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
                         ))
;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
                      ;; {{ theme
                      dashboard
                      doom-themes
                      doom-modeline
                      ;; }}

                      ;; {{ evil
                      evil
                      evil-leader
                      evil-surround
                      evil-nerd-commenter
                      ;; }}

                      ;; {{ ivy-mode
                      counsel
                      ;; }}

                      ;; {{ auto-completion
                      company
                      ;; }}

                      ;; {{ window
                      window-numbering
                      popwin
                      ;; }}

                      ;; {{ undo-tree
                      undo-tree
                      ;; }}

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

(require 'init_evil)
(require 'init_company)
(require 'init_misc)

(provide 'init-elpa)
