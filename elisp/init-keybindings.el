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
;; (global-set-key (kbd "C-c p f") 'counsel-git)

;; 格式化代码
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 扩展补全
(global-set-key (kbd "s-/") 'hippie-expand)

;; 转换缩进快捷键
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; 增强occur-mode
(global-set-key (kbd "M-s o") 'occur-dwim)

;; counsel-imenu
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

;; 设置company使用C-n C-p来选择补全
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; org-mode快捷键
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; ag搜索
;; (global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(provide 'init-keybindings)
