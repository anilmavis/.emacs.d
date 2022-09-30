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

;; screen

(anil-package-install 'zenburn-theme)
(load-theme 'zenburn t)    

(column-number-mode)
(global-display-line-numbers-mode)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-message t
      initial-scratch-message nil)

(set-face-attribute 'default nil :height 200)

;; completion

(anil-package-install 'company
                         'eglot
                         'yasnippet-snippets
                         'which-key)

(global-company-mode)
(icomplete-mode)
(yas-global-mode)
(which-key-mode)

(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'java-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)

;;; init.el ends here