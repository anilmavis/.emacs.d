;;; sapphic-customisation.el --- Customisation of Sapphic Emacs.  -*- lexical-binding: t; -*-

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

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(defgroup sapphic nil
  "Customisation of Sapphic Emacs."
  :group 'convenience
  :prefix "sapphic-")

(defgroup sapphic-java nil
  "Java Language Server."
  :group 'sapphic
  :prefix "sapphic-java-")

(defcustom sapphic-java-server-source
  "https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz"
  "URL of the Java Language Server."
  :group 'sapphic-java
  :type 'string)

(defcustom sapphic-java-server-destination
  (concat user-emacs-directory "jdt-language-server-latest")
  "Directory of the Java Language Server."
  :group 'sapphic-java
  :type 'directory)

(provide 'sapphic-customisation)

;;; sapphic-customisation.el ends here
