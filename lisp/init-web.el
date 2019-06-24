;; web: html, js, jsx, css

(use-package web-mode
  :ensure t
  :defer 2
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)  ; HTML
    (setq web-mode-css-indent-offset 2)  ; CSS
    (setq web-mode-code-indent-offset 2) ; script/code
    (setq web-mode-script-padding 1)     ; html 内嵌 script 开头缩进
    )
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  :config
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.js[x]?\\'")))
  )

(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'html-mode-hook 'emmet-mode)
  :config
  (global-set-key (kbd "M-e") nil)
  (global-set-key (kbd "M-e p") 'emmet-prev-edit-point)
  (global-set-key (kbd "M-e n") 'emmet-next-edit-point)
  )

;; for LESS
(use-package css-mode
  :ensure t
  :defer 2
  :init
  (add-to-list 'auto-mode-alist '("\\.less\\'" . css-mode))
  :config
  (setq css-indent-offset 2)
  )

(provide 'init-web)
