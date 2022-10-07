;;; sapphic.el --- A starter kit.  -*- lexical-binding: t; -*-

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

(defun sapphic-package-install (&rest packages)
  "Install packages not installed in PACKAGES."
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

(setq inhibit-startup-screen t
      initial-scratch-message nil)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'column-number-mode)

;; completion

(setq js-indent-level 2)

(setq-default indent-tabs-mode nil
              tab-width 4)

(sapphic-package-install 'company
                         'eglot
                         'js2-mode
                         'which-key)

(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'java-mode-hook #'eglot-ensure)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(fido-vertical-mode)
(global-company-mode)
(which-key-mode)

;; customisation

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(defgroup sapphic nil
  "Customisation of Sapphic Emacs."
  :group 'convenience
  :prefix "sapphic-")

(defgroup sapphic-java nil
  "Java LSP."
  :group 'sapphic
  :prefix "sapphic-java-")

(defcustom sapphic-java-server-source
  "https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz"
  "URL of the Java language server."
  :group 'sapphic-java
  :type 'string)

(defcustom sapphic-java-server-destination
  (concat user-emacs-directory "jdt-language-server-latest")
  "Directory of the Java Language server."
  :group 'sapphic-java
  :type 'directory)

;; exwm

(sapphic-package-install 'exwm)

(require 'exwm)
(require 'exwm-config)

(exwm-config-default)

;; screen

(load-theme 'wombat)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(provide 'sapphic)

;;; sapphic.el ends here
