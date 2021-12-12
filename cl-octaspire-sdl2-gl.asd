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
(defsystem "cl-octaspire-sdl2-gl"
  :version "0.3.0"
  :author "octaspire"
  :license "MIT"
  :depends-on ("cffi" "cffi-libffi" "trivial-main-thread")
  :components ((:module "src"
                :components
                        ((:file "main"))))
  :description "Octaspire's FFI Library for SDL2 and OpenGL"
  :in-order-to ((test-op (test-op "cl-octaspire-sdl2-gl/tests"))))

(defsystem "cl-octaspire-sdl2-gl/tests"
  :author "octaspire"
  :license "MIT"
  :depends-on ("cl-octaspire-sdl2-gl"
               "rove"
               "bytecurry.mocks")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-octaspire-sdl2-gl"
  :perform (test-op (op c) (symbol-call :rove :run c)))
