;; 定义的键盘映射

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; ---------------------------------------------- ;;
;; ------ * define evil-mode keybindings * ------ ;;
;; ---------------------------------------------- ;;

;; ========== @ insert mode @ ========= ;;
(define-key evil-insert-state-map (kbd "C-j") 'evil-force-normal-state)
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
(define-key evil-insert-state-map (kbd "C-x C-o") 'hippie-expand)
;; (define-key evil-insert-state-map (kbd "C-r +") 'yank)
(define-key evil-insert-state-map (kbd "C-w") 'backward-kill-word)

;; ========= @ normal mode @ ========== ;;
(define-key evil-normal-state-map (kbd "C-p") 'swiper)

(evil-leader/set-key
  "SPC" 'counsel-M-x
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
  "wo" 'delete-other-windows
  "wc" 'delete-window
  "w/" 'split-window-right
  "w-" 'split-window-below
  "hk" 'describe-key
  "hv" 'counsel-describe-variabe
  "hf" 'counsel-describe-function
  "hK" 'find-function
  "hV" 'find-variable
  "hF" 'find-function-on-key

  ;; ------ * plugin configure * ------ ;;
  "pn" 'indent-region-or-buffer  ;; 格式化代码
  "fg" 'counsel-git

  ;; org-mode
  "ohh" 'org-html-export-to-html  ;; 导出org->html
  "on" 'org-next-visible-heading
  "op" 'org-previous-visible-heading
  "ob" 'org-backward-heading-same-level
  "of" 'org-forward-heading-same-level
  "ou" 'outline-up-heading
  "ojj" 'org-goto
  "or" 'org-capture
  "oa" 'org-agenda
  "ott" 'org-todo
  )
;; 注释代码
(define-key evil-normal-state-map (kbd "SPC c c") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "SPC c c") 'evilnc-comment-or-uncomment-lines)

;; ========= @ visual mode @ ========== ;;
;; (define-key evil-visual-state-map (kbd "SPC a") ')


;; ---------------------------------------------- ;;
;; ------ * end evil mode keybindings * --------- ;;
;; ---------------------------------------------- ;;



;; ---------------------------------------------- ;;
;; --------- * company使用C-n C-p来选择 * -------- ;;
;; ---------------------------------------------- ;;
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-h") 'evil-delete-backward-char-and-join)  ;; evil-mode C-h 设置
  )


;; ---------------------------------------------- ;;
;; ---------- * ivy-mode keybindings * ---------- ;;
;; ---------------------------------------------- ;;
;; (global-set-key (kbd "C-p") 'swiper)
(global-set-key (kbd "C-s") 'nil)

;; ---------- * other * ---------- ;;
;; C-c C-c key about markdown keybindings 应该不长用, 没有css渲染, 使用的是pandoc

(provide 'init-keybindings)
