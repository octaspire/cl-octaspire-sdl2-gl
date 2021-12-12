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
(defpackage cl-octaspire-sdl2-gl/tests/main
  (:use :cl :cl-octaspire-sdl2-gl :rove :bytecurry.mocks))
(in-package :cl-octaspire-sdl2-gl/tests/main)


;; SDL-INIT

(deftest test-sdl-init-with-timer
  (testing "Calling SDL-INIT with +SDL-INIT-TIMER+ works."
    (let ((retval (sdl-init +SDL-INIT-TIMER+)))
      (sdl-quit)
      (ok (= 0 retval)))))

(deftest test-sdl-init-with-audio
  (testing "Calling SDL-INIT with +SDL-INIT-AUDIO+ works."
    (let ((retval (sdl-init +SDL-INIT-AUDIO+)))
      (sdl-quit)
      (ok (= 0 retval)))))

(deftest test-sdl-init-with-video
    (testing "Calling SDL-INIT with +SDL-INIT-VIDEO+ works."
             (let ((retval (sdl-init +SDL-INIT-VIDEO+)))
               (sdl-quit)
               (ok (= 0 retval)))))

(deftest test-sdl-init-with-joystick
    (testing "Calling SDL-INIT with +SDL-INIT-JOYSTICK+ works."
             (let ((retval (sdl-init +SDL-INIT-JOYSTICK+)))
               (sdl-quit)
               (ok (= 0 retval)))))

(deftest test-sdl-init-with-haptic
    (testing "Calling SDL-INIT with +SDL-INIT-HAPTIC+ works."
             (let ((retval (sdl-init +SDL-INIT-HAPTIC+)))
               (sdl-quit)
               (ok (= 0 retval)))))

(deftest test-sdl-init-with-gamecontroller
    (testing "Calling SDL-INIT with +SDL-INIT-GAMECONTROLLER+ works."
             (let ((retval (sdl-init +SDL-INIT-GAMECONTROLLER+)))
               (sdl-quit)
               (ok (= 0 retval)))))

(deftest test-sdl-init-with-events
  (testing "Calling SDL-INIT with +SDL-INIT-EVENTS+ works."
    (let ((retval (sdl-init +SDL-INIT-EVENTS+)))
      (sdl-quit)
      (ok (= 0 retval)))))

(deftest test-sdl-init-with-sensor
  (testing "Calling SDL-INIT with +SDL-INIT-SENSOR+ works."
    (let ((retval (sdl-init +SDL-INIT-SENSOR+)))
      (sdl-quit)
      (ok (= 0 retval)))))


;; WITH-INIT

(deftest test-with-init-with-timer
    (testing "Calling WITH-INIT with +SDL-INIT-TIMER+ works."
             (let ((retval 128))
               (ok (= retval (with-init (+SDL-INIT-TIMER+)
                               retval))))))

(deftest test-with-init-with-audio
  (testing "Calling WITH-INIT with +SDL-INIT-AUDIO+ works."
    (let ((retval 128))
      (ok (= retval (with-init (+SDL-INIT-AUDIO+)
                      retval))))))

(deftest test-with-init-with-video
    (testing "Calling WITH-INIT with +SDL-INIT-VIDEO+ works."
             (let ((retval 128))
               (ok (= retval (with-init (+SDL-INIT-VIDEO+)
                               retval))))))

(deftest test-with-init-with-joystick
    (testing "Calling WITH-INIT with +SDL-INIT-JOYSTICK+ works."
             (let ((retval 128))
               (ok (= retval (with-init (+SDL-INIT-JOYSTICK+)
                               retval))))))

(deftest test-with-init-with-haptic
    (testing "Calling WITH-INIT with +SDL-INIT-HAPTIC+ works."
             (let ((retval 128))
               (ok (= retval (with-init (+SDL-INIT-HAPTIC+)
                               retval))))))

(deftest test-with-init-with-gamecontroller
    (testing "Calling WITH-INIT with +SDL-INIT-GAMECONTROLLER+ works."
             (let ((retval 128))
               (ok (= retval (with-init (+SDL-INIT-GAMECONTROLLER+)
                               retval))))))

(deftest test-with-init-with-events
  (testing "Calling WITH-INIT with +SDL-INIT-EVENTS+ works."
    (let ((retval 128))
      (ok (= retval (with-init (+SDL-INIT-EVENTS+)
                      retval))))))

(deftest test-with-init-with-sensor
  (testing "Calling WITH-INIT with +SDL-INIT-SENSOR+ works."
    (let ((retval 128))
      (ok (= retval (with-init (+SDL-INIT-SENSOR+)
                      retval))))))
