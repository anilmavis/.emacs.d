;;; init.el  -*- lexical-binding: t; no-byte-compile: t; -*-

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

;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun anil-package-install (&rest packages)
  "Install packages not installed in PACKAGES."
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

;; screen

(load-theme 'wombat)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-message t
      initial-scratch-message nil)

(add-hook 'prog-mode-hook #'global-display-line-numbers-mode)
(column-number-mode)

;; completion

(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)

(anil-package-install 'company
                      'eglot
                      'which-key)

(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'java-mode-hook #'eglot-ensure)
(add-hook 'js-mode-hook #'eglot-ensure)

(global-company-mode)
(fido-vertical-mode)
(which-key-mode)

;; exwm

(anil-package-install 'exwm)
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)

;; customisation

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
