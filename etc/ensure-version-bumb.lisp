;; Copyright (c) 2020, 2021 octaspire.com
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.
;;
;; This file can be used as a git `pre-push` hook by adding a
;; `.git/hooks/pre-push` file with two lines:
;;
;; #!/bin/sh
;; sbcl --load ../../etc/ensure-version-bumb.lisp
;;
;; This makes sure, that the version number is not the same as on
;; the previous push. It could be improved by actually comparing
;; the semantic version numbers and making sure, that the version
;; number has been increased (just by one), and not decreased.
(defparameter *path* "~/.cl-octaspire-sdl2-gl.pushed_version")

(defun read-previous-version (current)
  (with-open-file (stream *path* :if-does-not-exist nil)
                  (if stream
                      (let ((line (read-line stream)))
                        (if line
                            line
                          current))
                    current)))

(defun write-current-version (version)
  (with-open-file (stream *path*
                          :direction :output
                          :if-does-not-exist :create
                          :if-exists :supersede)
                  (when stream
                    (write-line version stream))))

(defun handle-bad-version (version)
  (format t "ERROR: version number ~a is not bumbed~%" version)
  (uiop:quit 1))

(defun handle-ok-version (current previous)
  (format t "OK: version number bumbed from ~a to ~a~%" previous current)
  (write-current-version current)
  (uiop:quit 0))

(let* ((current-version (slot-value (asdf:find-system :cl-octaspire-sdl2-gl) 'asdf:version))
       (previous-version (read-previous-version current-version)))
  (if (string= current-version previous-version)
      (handle-bad-version current-version)
    (handle-ok-version current-version previous-version)))
