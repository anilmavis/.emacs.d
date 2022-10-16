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

;;; Commentary:

;;; Code:

(defgroup sapphic nil
  "Customisation of Sapphic Emacs."
  :group 'convenience
  :prefix "sapphic-")

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(require 'sapphic-packages)
(require 'sapphic-completion)
(require 'sapphic-jdtls)
(require 'sapphic-screen)
(require 'sapphic-ws)

(provide 'sapphic)

;;; sapphic.el ends here
