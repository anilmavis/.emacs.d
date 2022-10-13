;;; sapphic-jdtls.el --- Eclipse JDT Language Server.  -*- lexical-binding: t; -*-

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

(defgroup sapphic-jdtls nil
  "Eclipse JDT Language Server."
  :group 'sapphic
  :prefix "sapphic-jdtls-")

(defcustom sapphic-jdtls-url
  "https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz"
  "URL of the language server."
  :group 'sapphic-jdtls
  :type 'string)

(defcustom sapphic-jdtls-destination
  (concat user-emacs-directory "jdt-language-server-latest")
  "Destination of the language server."
  :group 'sapphic-jdtls
  :type 'directory)

(defun sapphic-jdtls--install ()
  "Install the language server."
  (let ((large-file-warning-threshold nil)
        (newname (expand-file-name (file-name-nondirectory sapphic-jdtls-url)
                                   sapphic-jdtls-destination)))
    (unless (file-exists-p sapphic-jdtls-destination)
      (make-directory sapphic-jdtls-destination)
      (url-copy-file sapphic-jdtls-url newname t)
      (with-temp-buffer
        (let ((temp-buffer (find-file newname)))
          (goto-char (point-min))
          (tar-untar-buffer)
          (kill-buffer temp-buffer)))
      (delete-file newname))))

(sapphic-jdtls--install)

(defun sapphic-jdtls-maven-create ()
  "Create a maven project."
  (interactive)
  (let ((group-id (read-string "group id:"))
        (artifact-id (read-string "artifact id:"))
        (archetype-artifact-id (read-string "archetype artifact id:"))))

  (provide 'sapphic-jdtls)

;;; sapphic-jdtls.el ends here
