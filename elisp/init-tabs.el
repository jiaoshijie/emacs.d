;; 设置缩进
(setq tab-width 2)
(setq tab-stop-list '(2 4))
;; (setq indent-tabs-mode nil)

(defun jsj-toggle-indent ()
  (interactive)
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(provide 'init-tabs)
