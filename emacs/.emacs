(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/elpa/workgroups")
(add-to-list 'load-path "~/.emacs.d/elpa/which-key")

(require 'evil)
(evil-mode 1)

;; workgroups settings 
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
(wg-load "~/.emacs.d/elpa/wg/startup")


;; which-key settings, load on startup
(require 'which-key)
(which-key-mode 1)

(hl-line-mode 1)
(display-battery-mode 1)
(menu-bar-mode -1)


(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(global-set-key (kbd "M-p") 'ace-window)

(set-frame-parameter (selected-frame) 'alpha '(90 . 50))
(add-to-list 'default-frame-alist '(alpha . (90 . 50)))

(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(85 . 50) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

(require 'helm-config)

;(require 'evil-vimish-fold)
(evil-vimish-fold-mode 1)

(setq ranger-show-literal nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (peacock)))
 '(custom-safe-themes
   (quote
    ("e4859645a914c748b966a1fe53244ff9e043e00f21c5989c4a664d649838f6a3" "7c49651e62ee04b5f6d8fca78bca6f31730d982901fc1e1c651e464fa0ecfea4" "82fce2cada016f736dbcef237780516063a17c2436d1ee7f42e395e38a15793b" "c63a789fa2c6597da31f73d62b8e7fad52c9420784e6ec34701ae8e8f00071f6" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "66881e95c0eda61d34aa7f08ebacf03319d37fe202d68ecf6a1dbfd49d664bc3" "858a353233c58b69dbe3a06087fc08905df2d8755a0921ad4c407865f17ab52f" "8e4efc4bed89c4e67167fdabff77102abeb0b1c203953de1e6ab4d2e3a02939a" default)))
 '(fringe-mode 0 nil (fringe))
 '(ranger-listing-dir-first nil)
 '(scroll-bar-mode nil)
 '(set-default (quote cursor-type) t)
 '(tool-bar-mode nil))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; packages in use: ace-window, erc-colorize, ess, evil, folding, pdf-tools, ranger, undo-tree, which-key, workgroups
