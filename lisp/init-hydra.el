(defvar current-date-time-format "%Y-%m-%d %H:%M:%S %a"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
  (interactive)
  (insert (format-time-string current-date-time-format (current-time)))
  )

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(defun hydra-nobinding ()
  "hydra-nobinding prompt"
  (interactive)
  (message "hydra bind nothing")
  )

(use-package hydra
  :pin melpa
  :ensure t
  :init

  (defhydra hydra-right (global-map "<f8>"
									:pre (progn (message "right start >>"))
									:post (progn (message "left end !"))
									:foreign-keys warn
									:timeout 1
									:idle 60
									:hint nil
									:exit t
									)
	"right hand start, left end !"
	;; keyboard line 1
	("1" delete-other-windows "delete other windows")
	("2" split-window-below "split window below")
	("3" split-window-right "split window right")
	("4" hydra-nobinding "todo binding")
	("5" hydra-nobinding "todo binding")
	("6" hydra-nobinding "todo binding")

	;; keyboard line 2
	("q" hydra-nobinding "todo binding")
	("w" save-buffer "write to disk")
	("e" hydra-nobinding "todo binding")
	("r" ivy-resume "ivy resume")
	("t" hydra-nobinding "todo binding")

	;; keyboard line 3
	("a" mark-whole-buffer "mark whole buffer")
	("ss" swiper "search current session")
	("sd" counsel-ag "search directory")
	("dp" show-file-name "display path")
	("f" ivy-switch-buffer "switch buffer")
	("g" hydra-nobinding "todo binding")

	;; keyboard line 4
	("z" hydra-nobinding "todo binding")
	("x" eshell "open eshell")
	("c" save-buffers-kill-terminal "close emacs")
	("v" scroll-up-command "scroll up")
	("b" hydra-nobinding "todo binding")
	("<f8>" nil "quit")
	)

  (defhydra hydra-left (global-map "<f2>"
								   :pre (progn (message "left start >>>>"))
								   :post (progn (message "right end !"))
								   :foreign-keys warn
								   :timeout 1
								   :idle 60
								   :hint nil
								   :exit t
								   )
	"left hand start, right hand end"

	;; keyboard line 1
	("7" hydra-nobinding "todo binding")
	("8" hydra-nobinding "todo binding")
	("9" hydra-nobinding "todo binding")
	("0" delete-window "delete window")
	("-" shrink-window-horizontally "shrink-window-h")
	("_" shrink-window "shrink-window-v" )
	("=" enlarge-window-horizontally "enlarge-window-h")
	("+" enlarge-window "enlarge-window-v")

	;; keyboard line 2
	("y" hydra-nobinding "todo binding")
	("u" undo "undo")
	("it" insert-current-date-time "insert current date time")
	("o" counsel-find-file "open file")
	("pi" projectile-invalidate-cache "projectile invalidate cache")
	("pp" counsel-projectile-switch-project "projectile switch project")
	("pf" counsel-projectile-find-file "projectile find file")
	("[" beginning-of-buffer "beginning of buffer")
	("]" end-of-buffer "end of buffer")

	;; keyboard line 3
	("h" hydra-nobinding "todo binding")
	("j" hydra-nobinding "todo binding")
	("k" kill-buffer "kill buffer")
	("l" display-line-numbers-mode "line number")
	(";" hydra-nobinding "todo binding")
	("'" hydra-nobinding "todo binding")

	;; keyboard line 4
	("n" hydra-nobinding "todo binding")
	("m" counsel-semantic-or-imenu "show imenu")
	("," hydra-nobinding "todo binding")
	("." hydra-nobinding "todo binding")

	("<f2>" nil "quit")
	)
  )

(provide 'init-hydra)
