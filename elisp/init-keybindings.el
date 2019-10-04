;; 定义的键盘映射

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; ---------------------------------------------- ;;
;; ------ * define evil-mode keybindings * ------ ;;
;; ---------------------------------------------- ;;

;; ========== @ insert mode @ ========= ;;
(define-key evil-insert-state-map (kbd "C-j") 'evil-force-normal-state)
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
(define-key evil-insert-state-map (kbd "C-x C-o") 'hippie-expand)
(define-key evil-insert-state-map (kbd "C-r =") 'evil-paste-before)

;; ========= @ normal mode @ ========== ;;
(evil-leader/set-key
  "SPC" 'counsel-M-x
  "ESC" 'keyboard-quit
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "bD" 'kill-buffer
  "s"  'save-buffer
  "qq" 'save-buffers-kill-terminal
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "4"  'select-window-4
  "wq" 'delete-other-windows
  "w/" 'split-window-right
  "w-" 'split-window-below

  "pp" 'org-html-export-to-html  ;; 导出org->html
  "pn" 'indent-region-or-buffer  ;; 格式化代码
  "fg" 'counsel-git
  )
;; 注释代码
(define-key evil-normal-state-map (kbd "SPC c c") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "SPC c c") 'evilnc-comment-or-uncomment-lines)

;; ------ * end evil mode keybindings * --------- ;;



;; ---------------------------------------------- ;;
;; --------- * company使用C-n C-p来选择 * -------- ;;
;; ---------------------------------------------- ;;
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-h") 'evil-delete-backward-char-and-join))


;; ---------------------------------------------- ;;
;; ---------- * ivy-mode keybindings * ---------- ;;
;; ---------------------------------------------- ;;
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;; ---------------------------------------------- ;;
;; ---------- * org-mode keybindings * ---------- ;;
;; ---------------------------------------------- ;;
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)


(provide 'init-keybindings)
