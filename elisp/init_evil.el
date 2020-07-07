;; evil config
(require 'evil)
(require 'evil-surround)
(require 'evil-nerd-commenter)

;; evil terminal cursor changer
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate) ; or (etcc-on)
  )
(setq evil-motion-state-cursor 'box)
(setq evil-visual-state-cursor 'box)
(setq evil-normal-state-cursor 'box)
(setq evil-insert-state-cursor 'bar)
(setq evil-emacs-state-cursor  'hbar)


(evil-mode 1)
(global-evil-surround-mode)
(evilnc-default-hotkeys nil t)

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

;; ========== @ insert mode @ ========= ;;
(evil-define-key 'insert 'global
  (kbd "C-j") 'evil-force-normal-state
  (kbd "C-h") 'evil-delete-backward-char-and-join
  (kbd "C-w") 'backward-kill-word
  )

;; ========= @ normal mode @ ========== ;;
(evil-set-leader 'normal " ")
;; (evil-set-leader 'normal "," "<localleader>")

(evil-define-key 'normal 'global
  ;; ---- * non-leader * ---- ;;
  (kbd "C-p") 'counsel-rg
  (kbd "<f2>") 'open-my-init-file

  ;; ---- * leader-??? * ---- ;;
  (kbd "<leader>SPC") 'counsel-M-x

  (kbd "<leader>ff") 'counsel-find-file
  (kbd "<leader>fh") 'open-home-dir
  (kbd "<leader>fr") 'counsel-recentf
  (kbd "<leader>fg") 'counsel-git
  (kbd "<leader>bb") 'counsel-switch-buffer
  (kbd "<leader>bD") 'kill-buffer
  (kbd "<leader>s") 'save-buffer
  (kbd "<leader>qq") 'save-buffers-kill-terminal

  (kbd "<leader>ti") 'jsj-toggle-indent

  (kbd "<leader>ww") 'other-window
  (kbd "<leader>wo") 'delete-other-windows
  (kbd "<leader>wd") 'delete-window
  (kbd "<leader>w/") 'split-window-right
  (kbd "<leader>w-") 'split-window-below
  (kbd "M-H") 'windmove-left
  (kbd "M-J") 'windmove-down
  (kbd "M-K") 'windmove-up
  (kbd "M-L") 'windmove-right

  (kbd "<leader>u") 'undo-tree-visualize

  (kbd "<leader>hk") 'describe-key
  (kbd "<leader>hv") 'counsel-describe-variable
  (kbd "<leader>hf") 'counsel-describe-function

  ;; org-mode
  (kbd "<leader>ft") 'open-my-task-dir
  (kbd "<leader>oa") 'org-agenda
  (kbd "<leader>ot") 'org-capture
  (kbd "<leader>oo") 'org-sparse-tree
  (kbd "<leader>ou") 'outline-up-heading
  (kbd "<leader>os") 'org-todo
  (kbd "<leader>ods") 'org-schedule
  (kbd "<leader>odd") 'org-deadline
  (kbd "<leader>oci") 'org-clock-in
  (kbd "<leader>oco") 'org-clock-out
  (kbd "<leader>ocr") 'org-clock-report
  (kbd "<leader>occ") 'org-ctrl-c-ctrl-c  ;; [/] [%] 任务细分
  )

(evil-define-key '(normal visual) 'global
  (kbd "<leader>cc") 'evilnc-comment-or-uncomment-lines
  )

(provide 'init_evil)
