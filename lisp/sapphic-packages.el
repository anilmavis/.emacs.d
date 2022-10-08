;;; sapphic-packages.el --- Installing additional features.  -*- lexical-binding: t; -*-

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

(require 'package)

;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun sapphic-package-install (&rest packages)
  "Install packages not installed in PACKAGES."
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

(provide 'sapphic-packages)

;;; sapphic-packages.el ends here
