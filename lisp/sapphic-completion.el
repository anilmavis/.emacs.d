;;; sapphic-completion.el --- Minibuffer and symbol completion.  -*- lexical-binding: t; -*-

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

;;; Commentary:

;;; Code:

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

(provide 'sapphic-completion)

;;; sapphic-completion.el ends here
