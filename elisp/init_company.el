(require 'company)
(global-company-mode 1)

;; --------- * company使用C-n C-p来选择 * -------- ;;
(with-eval-after-load 'company
                      (define-key company-active-map (kbd "M-n") nil)
                      (define-key company-active-map (kbd "M-p") nil)
                      (define-key company-active-map (kbd "C-n") #'company-select-next)
                      (define-key company-active-map (kbd "C-p") #'company-select-previous)
                      (define-key company-active-map (kbd "C-h") 'evil-delete-backward-char-and-join)
                      (define-key company-active-map (kbd "C-w") 'backward-kill-word)
                      )

(provide 'init_company)
