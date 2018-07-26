(require 'company)

;; markdown-mode, eshell-mode ignore complete
(setq company-global-modes '(not markdown-mode gfm-mode eshell-mode))

(add-hook 'after-init-hook 'global-company-mode)

(setq company-transformers '(company-sort-by-occurrence))
(setq company-echo-delay 0)
(setq company-idle-delay 0)
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; for go
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(provide 'init-complete)