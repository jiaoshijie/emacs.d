;; 定义的键盘映射

(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-my-task-dir ()
  (interactive)
  (find-file "~/Nutstore Files/Nutstore/GTD"))

(defun open-home-dir ()
  (interactive)
  (find-file "~"))

;; ---------------------------------------------- ;;
;; ------ * define evil-mode keybindings * ------ ;;
;; ---------------------------------------------- ;;

;; ========== @ insert mode @ ========= ;;
(define-key evil-insert-state-map (kbd "C-j") 'evil-force-normal-state)
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
(define-key evil-insert-state-map (kbd "C-w") 'backward-kill-word)

;; ========= @ normal mode @ ========== ;;
(define-key evil-normal-state-map (kbd "C-p") 'counsel-rg)
(define-key evil-normal-state-map (kbd "<f2>") 'open-my-init-file)

(evil-leader/set-key
  "SPC" 'counsel-M-x

  "ff" 'counsel-find-file
  "fh" 'open-home-dir
  "fr" 'counsel-recentf
  "fg" 'counsel-git

  "bb" 'counsel-switch-buffer
  "bD" 'kill-buffer
  "s"  'save-buffer
  "qq" 'save-buffers-kill-terminal

  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "4"  'select-window-4
  "5"  'select-window-5
  "6"  'select-window-6
  "7"  'select-window-7
  "8"  'select-window-8
  "9"  'select-window-9
  "ww" 'other-window
  "wo" 'delete-other-windows
  "wd" 'delete-window
  "w/" 'split-window-right
  "w-" 'split-window-below

  "hk" 'describe-key
  "hv" 'counsel-describe-variable
  "hf" 'counsel-describe-function

  ;; org-mode
  "ft" 'open-my-task-dir
  "oa" 'org-agenda
  "ot" 'org-capture
  "oo" 'org-sparse-tree
  "ou" 'outline-up-heading
  "os" 'org-todo
  "ods" 'org-schedule
  "odd" 'org-deadline
  "oci" 'org-clock-in
  "oco" 'org-clock-out
  "ocr" 'org-clock-report
  )
;; 注释代码
(define-key evil-normal-state-map (kbd "SPC c c") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "SPC c c") 'evilnc-comment-or-uncomment-lines)

;; ---------------------------------------------- ;;
;; ------ * end evil mode keybindings * --------- ;;
;; ---------------------------------------------- ;;



;; --------- * company使用C-n C-p来选择 * -------- ;;
(with-eval-after-load 'company
                      (define-key company-active-map (kbd "M-n") nil)
                      (define-key company-active-map (kbd "M-p") nil)
                      (define-key company-active-map (kbd "C-n") #'company-select-next)
                      (define-key company-active-map (kbd "C-p") #'company-select-previous)
                      (define-key company-active-map (kbd "C-h") 'evil-delete-backward-char-and-join)
		      (define-key company-active-map (kbd "C-w") 'backward-kill-word)
                      )

(provide 'init-keybindings)
