;;; sapphic-screen.el --- The organisation of the screen.  -*- lexical-binding: t; -*-

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

(setq inhibit-startup-screen t
      initial-scratch-message nil)

(add-hook 'prog-mode-hook #'column-number-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(load-theme 'wombat)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(provide 'sapphic-screen)

;;; sapphic-screen.el ends here
