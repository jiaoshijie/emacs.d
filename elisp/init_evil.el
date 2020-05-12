;; evil config
(require 'evil)
(require 'evil-leader)
(require 'evil-surround)
(require 'evil-nerd-commenter)

(evil-mode 1)

(global-evil-leader-mode)
(evil-leader/set-leader "SPC")

;; 取消evil instert 模式的屏蔽
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(global-evil-surround-mode)

(evilnc-default-hotkeys)


;; function
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-my-task-dir ()
  (interactive)
  (find-file "~/Nutstore Files/Nutstore/GTD"))

(defun open-home-dir ()
  (interactive)
  (find-file "~"))

(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
        '(90 . 90) '(100 . 100)))))


;; ------ * define evil-mode keybindings * ------ ;;

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

  "ct" 'toggle-transparency

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

  "u" 'undo-tree-visualize

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
  "occ" 'org-ctrl-c-ctrl-c  ;; [/] [%] 任务细分
  )
;; 注释代码
(define-key evil-normal-state-map (kbd "SPC c c") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "SPC c c") 'evilnc-comment-or-uncomment-lines)

(provide 'init_evil)
