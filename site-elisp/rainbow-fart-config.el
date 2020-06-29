;; git clone --depth 1 https://github.com/stardiviner/emacs-rainbow-fart.git

(add-to-list 'load-path "~/.emacs.d/non-elpa/emacs-rainbow-fart/")

(require 'rainbow-fart)
(add-hook 'prog-mode-hook #'rainbow-fart-mode)

(setq rainbow-fart-voice-model "JustKowalski")

(provide 'rainbow-fart-config)
