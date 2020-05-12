(require 'org)
;; 使org文本文件支持语法高亮
(setq org-src-fontify-natively 1)

(setq org-agenda-files '("~/Nutstore Files/Nutstore/GTD"))

;; (setq org-default-notes-file "~/Nutstore Files/Nutstore/GTD/task.org")

;; 设置模板
(setq org-capture-templates
      '(
	("t" "Todo" entry (file+headline "~/Nutstore Files/Nutstore/GTD/task.org" "从心出发")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)

	("h" "homeworks" entry (file+headline "~/Nutstore Files/Nutstore/GTD/homeworks.org" "石油作业")
	 "* TODO [#D] %?\n  %i\n"
	 :empty-lines 1)

	("c" "cyclic task" entry (file+headline "~/Nutstore Files/Nutstore/GTD/cyclic_task.org" "循环任务")
	"* TODO [#C] %?\n  %i\n"
	:empty-lines 1)
	))

;; 设置任务等级
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?D)
(setq org-default-priority ?D)
(setq org-priority-faces
      '((?A . (:background "red" :foreground "white" :weight bold))
        (?B . (:background "DarkOrange" :foreground "white" :weight bold))
        (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
        (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
        ))

;; --------* *------- ;;
(provide 'init-org)
