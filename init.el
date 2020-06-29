(let* ((minver "26.3"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher is required." minver)))

(defvar best-gc-cons-threshold
  4000000
  "Best default gc threshold value.  Should NOT be too big!")

;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))

(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/site-elisp/")

(require 'init-basic) ;; 基础配置
(require 'init-elpa)
(require 'init-style)
(require 'init-org)
(require 'init-tabs)

(require 'fcitx-config)
(require 'rainbow-fart-config)

(setq custom-file (expand-file-name "elisp/custom.el" user-emacs-directory))
(load-file custom-file)

(setq gc-cons-threshold best-gc-cons-threshold)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))

;;; Local Variables:
;;; no-byte-compile: t
;;; End:
(put 'erase-buffer 'disabled nil)
