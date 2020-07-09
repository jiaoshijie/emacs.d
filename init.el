(defvar best-gc-cons-threshold
  4000000
  "Best default gc threshold value.  Should NOT be too big!")

;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/site-elisp/")

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
		      dashboard
		      powerline

                      evil
		      evil-terminal-cursor-changer
		      undo-tree

		      ivy
		      swiper
                      counsel
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
;; ------------------------------------------------------------------------;;

(require 'init-basic) ;; 基础配置
(require 'init-style)
(require 'init-org)
(require 'init-tabs)

(require 'fcitx-config)

(require 'init_evil)

(setq custom-file (expand-file-name "elisp/custom.el" user-emacs-directory))
(load-file custom-file)

;; ------------------------------------------------------------------------;;
(setq gc-cons-threshold best-gc-cons-threshold)

;;; Local Variables:
;;; no-byte-compile: t
;;; End:
(put 'erase-buffer 'disabled nil)
