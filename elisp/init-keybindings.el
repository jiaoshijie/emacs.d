;; 定义的键盘映射

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; ---------------------------------------------- ;;
;; ------ * define evil-mode keybindings * ------ ;;
;; ---------------------------------------------- ;;

;; ========== @ insert mode @ ========= ;;
;; (define-key evil-insert-state-map (kbd "j k") 'evil-force-normal-state)
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

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
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;; ---------------------------------------------- ;;
;; ---------- * ivy-mode keybindings * ---------- ;;
;; ---------------------------------------------- ;;
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;; ---------------------------------------------- ;;
;; ---------- * org-mode keybindings * ---------- ;;
;; ---------------------------------------------- ;;
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; 增强occur-mode
(global-set-key (kbd "M-s o") 'occur-dwim)

;; counsel-imenu
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

;; 扩展补全
(global-set-key (kbd "s-/") 'hippie-expand)

(provide 'init-keybindings)
