;;; essd-s+3.el --- S-PLUS 3.x customization

;; Copyright (C) 1997 A. J. Rossini

;; Author: A.J. Rossini <rossini@stat.sc.edu>
;; Maintainer: A.J. Rossini <rossini@stat.sc.edu>
;; Created: 12 Jun 1997
;; Modified: $Date: 1997/11/19 15:33:47 $
;; Version: $Revision: 1.37 $
;; RCS: $Id: essd-s+3.el,v 1.37 1997/11/19 15:33:47 rossini Exp $
;;
;; Keywords: start up, configuration.

;; This file is part of ess-mode.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;;; This file defines all the S-PLUS 3.x customizations for ess-mode.

;;; Requires and Autoloads:

(require 'essl-s)

(autoload 'inferior-ess "ess-inf" "Run an ESS process")
(autoload 'ess-mode     "ess-mode" "Edit an ESS process")

; Code:

(defvar S+3-customize-alist
  '((ess-local-customize-alist     . 'S+3-customize-alist)
    (ess-language                  . "S")
    (ess-dialect                   . "S+3")
    (ess-suffix                    . "S")
    (ess-dump-filename-template    . (concat (user-login-name)
					     ".%s."
					     ess-suffix))
    (ess-mode-editing-alist        . S-editing-alist)
    (ess-mode-syntax-table         . S-syntax-table)
    (ess-mode-edit                 . 'S+3-mode)
    (ess-help-sec-regex            . ess-help-S+3-sec-regex)
    (ess-help-sec-keys-alist       . S+3-help-sec-keys-alist)
    (ess-loop-timeout              . 100000 )
    (ess-object-name-db-file       . "ess-s+3-namedb.el" )
    (ess-retr-lastvalue-command
     . ".Last.value <- get(\".ess.lvsave\",frame=0)\n")
    (ess-save-lastvalue-command
     . "assign(\".ess.lvsave\",.Last.value,frame=0)\n")
    (inferior-ess-program          . inferior-S+3-program-name)
    (inferior-ess-objects-command  . "objects(%d)\n")
    (inferior-ess-help-command     . "help(\"%s\",pager=\"cat\",window=F)\n")
    (inferior-ess-exit-command     . "q()\n")
    (inferior-ess-primary-prompt   . "[a-zA-Z0-9() ]*> ?")
    (inferior-ess-secondary-prompt . "+ ?")
    (inferior-ess-start-file       . nil) ;"~/.ess-S+3")
    (inferior-ess-start-args       . ""))
 "Variables to customize for S+3")


(defun S+3-mode (&optional proc-name)
  "Major mode for editing S+3 source.  See ess-mode for more help."
  (interactive)
  (setq-default ess-customize-alist S+3-customize-alist)
  (ess-mode S+3-customize-alist proc-name))


(defun S+3 (&optional proc-name)
  "Call 'S-PLUS 3.x', the 'Real Thing'  from StatSci."
  (interactive)
  (setq-default ess-customize-alist S+3-customize-alist)
  (ess-write-to-dribble-buffer
   (format "(S): ess-dialect=%s , buf=%s \n"
	   ess-dialect
	   (current-buffer)))
  (inferior-ess))


(defun S+3-transcript-mode ()
  "S-PLUS 3.x transcript mode."
  (interactive)
  (ess-transcript-mode S+3-customize-alist))



 ; Provide package

(provide 'essd-s+3)

 ; Local variables section

;;; This file is automatically placed in Outline minor mode.
;;; The file is structured as follows:
;;; Chapters:     ^L ;
;;; Sections:    ;;*;;
;;; Subsections: ;;;*;;;
;;; Components:  defuns, defvars, defconsts
;;;              Random code beginning with a ;;;;* comment

;;; Local variables:
;;; mode: emacs-lisp
;;; outline-minor-mode: nil
;;; mode: outline-minor
;;; outline-regexp: "\^L\\|\\`;\\|;;\\*\\|;;;\\*\\|(def[cvu]\\|(setq\\|;;;;\\*"
;;; End:

;;; essd-s+3.el ends here
