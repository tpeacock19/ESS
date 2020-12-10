;;; ess-test-r-tokens.el --- ESS tests for R tokens  -*- lexical-binding: t; -*-
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; A copy of the GNU General Public License is available at
;; https://www.r-project.org/Licenses/
;;
;;; Commentary:
;;

(require 'ert)
(require 'etest)
(require 'ess-r-mode)
(require 'ess-test-r-utils)

(etest-deftest-r ess-r-syntax-backslash-test ()
  :case "sapply(x, ¶\\(y) y"
  :eval (should (equal (syntax-after (point))
                       (string-to-syntax ".")))
  :case "c(\"¶\\\"\")"
  :eval (should (equal (syntax-after (point))
                       (string-to-syntax "\\"))))

(etest-deftest-r ess-r-font-lock-boolean-operator-test ()
  :case "foo ¶| foo ¶|¶| foo ¶& foo ¶&¶& foo"
  :eval (ess-with-enabled-font-lock-keyword 'ess-fl-keyword:operators
          (font-lock-ensure)
          (should (eq (face-at-point) 'ess-operator-face))))

(etest-deftest-r ess-r-font-lock-pipe-operator-test ()
  :case "a ¶|¶> b"
  :eval (ess-with-enabled-font-lock-keyword 'ess-fl-keyword:operators
          (font-lock-ensure)
          (should (eq (face-at-point) 'ess-operator-face))))

(etest-deftest-r ess-r-tokens-pipe-operator-test ()
  :case "a ¶|> b"
  :eval (should (token= "|>"))
  :result "a |>¶ b")
