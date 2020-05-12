;; git clone --depth 1 https://github.com/cute-jumper/fcitx.el

(add-to-list 'load-path "~/.emacs.d/non-elpa/fcitx.el/")

;; 中文输入法切换
(require 'fcitx)
(fcitx-aggressive-setup)

(provide 'fcitx-config)
