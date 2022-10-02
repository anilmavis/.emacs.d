;;; init.el  -*- lexical-binding: t; -*-

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

;; packages

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun anil-package-install (&rest packages)
  "Install packages not installed in PACKAGES."
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

;; completion

(anil-package-install 'company
                      'eglot
                      'which-key)

(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'java-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)

(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)

(global-company-mode)
(icomplete-mode)
(which-key-mode)

;; exwm

(anil-package-install 'exwm)
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)

;; screen

(anil-package-install 'doom-modeline
                      'doom-themes)

(column-number-mode)
(doom-modeline-mode)
(global-display-line-numbers-mode)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(load-theme 'doom-one t)

(setq inhibit-startup-message t
      initial-scratch-message nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(which-key eglot company doom-themes doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
