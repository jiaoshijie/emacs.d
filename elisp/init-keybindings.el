;; 定义的键盘映射

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; ivy的键盘映射
;; enable this if you want 'swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 打开最近访问文件的映射
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 快速打开counsel-git
(global-set-key (kbd "C-c p f") 'counsel-git)

(provide 'init-keybindings)
