;; assembly-test.lisp
;;
;; Copyright (c) 2022 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>


;; Permission to use, copy, modify, and/or distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

(in-package :assembly-test)

(defstruct coordinate
  (x-coord 0.0d0 :type double-float)
  (y-coord 0.0d0 :type double-float))

(defstruct line 
  (first (make-coordinate) :type coordinate)
  (second (make-coordinate) :type coordinate))

(defun make-quad-coordinate (&optional maybe-coord)
  (declare (optimize (speed 2) (space 2) (safety 0) (debug 0) ))
  (with-slots (x-coord y-coord) maybe-coord
    (declare (type double-float x-coord y-coord))
    (make-coordinate :x-coord x-coord :y-coord y-coord)
    (make-coordinate :x-coord (- x-coord) :y-coord (- y-coord))
    (make-coordinate :x-coord (- x-coord) :y-coord y-coord)
    (make-coordinate :x-coord x-coord :y-coord (- y-coord))))
