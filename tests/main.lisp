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
  (:use :cl :cl-octaspire-sdl2-gl :cffi :trivial-main-thread :rove :bytecurry.mocks))
(in-package :cl-octaspire-sdl2-gl/tests/main)


;; Constants declared in include/SDL_render.h

(deftest test-constant-sdl-renderer-software
  (testing "Test constant +SDL-RENDERER-SOFTWARE+"
           (ok (= #x0001 +SDL-RENDERER-SOFTWARE+))))

(deftest test-constant-sdl-renderer-accelerated
  (testing "Test constant +SDL-RENDERER-ACCELERATED+"
           (ok (= #x0002 +SDL-RENDERER-ACCELERATED+))))

(deftest test-constant-sdl-renderer-presentvsync
  (testing "Test constant +SDL-RENDERER-PRESENTVSYNC+"
           (ok (= #x0004 +SDL-RENDERER-PRESENTVSYNC+))))

(deftest test-constant-sdl-renderer-targettexture
  (testing "Test constant +SDL-RENDERER-TARGETTEXTURE+"
           (ok (= #x0008 +SDL-RENDERER-TARGETTEXTURE+))))


;; Constants declared in include/SDL_audio.h

(deftest test-constant-audio-u8
  (testing "Test constant +AUDIO-U8+"
           (ok (= #x0008 +AUDIO-U8+))))

(deftest test-constant-audio-s8
  (testing "Test constant +AUDIO-S8+"
           (ok (= #x8008 +AUDIO-S8+))))

(deftest test-constant-audio-u16lsb
  (testing "Test constant +AUDIO-U16LSB+"
           (ok (= #x0010 +AUDIO-U16LSB+))))

(deftest test-constant-audio-s16lsb
  (testing "Test constant +AUDIO-S16LSB+"
           (ok (= #x8010 +AUDIO-S16LSB+))))

(deftest test-constant-audio-u16msb
  (testing "Test constant +AUDIO-U16MSB+"
           (ok (= #x1010 +AUDIO-U16MSB+))))

(deftest test-constant-audio-s16msb
  (testing "Test constant +AUDIO-S16MSB+"
           (ok (= #x9010 +AUDIO-S16MSB+))))

(deftest test-constant-audio-u16
  (testing "Test constant +AUDIO-U16+"
           (ok (= +AUDIO-U16LSB+ +AUDIO-U16+))))

(deftest test-constant-audio-s16
  (testing "Test constant +AUDIO-S16+"
           (ok (= +AUDIO-S16LSB+ +AUDIO-S16+))))

(deftest test-constant-audio-s32lsb
  (testing "Test constant +AUDIO-S32LSB+"
           (ok (= #x8020 +AUDIO-S32LSB+))))

(deftest test-constant-audio-s32msb
  (testing "Test constant +AUDIO-S32MSB+"
           (ok (= #x9020 +AUDIO-S32MSB+))))

(deftest test-constant-audio-s32
  (testing "Test constant +AUDIO-S32+"
           (ok (= +AUDIO-S16LSB+ +AUDIO-S32+))))

(deftest test-constant-audio-f32lsb
  (testing "Test constant +AUDIO-F32LSB+"
           (ok (= #x8120 +AUDIO-F32LSB+))))

(deftest test-constant-audio-f32msb
  (testing "Test constant +AUDIO-F32MSB+"
           (ok (= #x9120 +AUDIO-F32MSB+))))

(deftest test-constant-audio-f32
  (testing "Test constant +AUDIO-F32+"
           (ok (= +AUDIO-F32LSB+ +AUDIO-F32+))))

(deftest test-constant-audio-u16sys
  (testing "Test constant +AUDIO-U16SYS+"
           (ok (=
                #+little-endian +AUDIO-U16LSB+
                #+big-endian    +AUDIO-U16MSB+
                +AUDIO-U16SYS+))))

(deftest test-constant-audio-s16sys
  (testing "Test constant +AUDIO-S16SYS+"
           (ok (=
                #+little-endian +AUDIO-S16LSB+
                #+big-endian    +AUDIO-S16MSB+
                +AUDIO-S16SYS+))))

(deftest test-constant-audio-s32sys
  (testing "Test constant +AUDIO-S32SYS+"
           (ok (=
                #+little-endian +AUDIO-S32LSB+
                #+big-endian    +AUDIO-S32MSB+
                +AUDIO-S32SYS+))))

(deftest test-constant-audio-f32sys
  (testing "Test constant +AUDIO-F32SYS+"
           (ok (=
                #+little-endian +AUDIO-F32LSB+
                #+big-endian    +AUDIO-F32MSB+
                +AUDIO-F32SYS+))))


;; Constants declared in include/SDL_stdinc.h

(deftest test-constant-sdl-false
  (testing "Test constant +SDL-FALSE+"
           (ok (= #x0 +SDL-FALSE+))))

(deftest test-constant-sdl-true
  (testing "Test constant +SDL-TRUE+"
           (ok (= #x1 +SDL-TRUE+))))


;; Constants declared in include/SDL.h

(deftest test-constant-sdl-init-timer
  (testing "Test constant +SDL-INIT-TIMER+"
           (ok (= #x001 +SDL-INIT-TIMER+))))

(deftest test-constant-sdl-init-audio
  (testing "Test constant +SDL-INIT-AUDIO+"
           (ok (= #x010 +SDL-INIT-AUDIO+))))

(deftest test-constant-sdl-init-video
  (testing "Test constant +SDL-INIT-VIDEO+"
           (ok (= #x020 +SDL-INIT-VIDEO+))))

(deftest test-constant-sdl-init-joystick
  (testing "Test constant +SDL-INIT-JOYSTICK+"
           (ok (= #x200 +SDL-INIT-JOYSTICK+))))

(deftest test-constant-sdl-init-haptic
  (testing "Test constant +SDL-INIT-HAPTIC+"
           (ok (= #x1000 +SDL-INIT-HAPTIC+))))

(deftest test-constant-sdl-init-gamecontroller
  (testing "Test constant +SDL-INIT-GAMECONTROLLER+"
           (ok (= #x2000 +SDL-INIT-GAMECONTROLLER+))))

(deftest test-constant-sdl-init-events
  (testing "Test constant +SDL-INIT-EVENTS+"
           (ok (= #x4000 +SDL-INIT-EVENTS+))))

(deftest test-constant-sdl-init-sensor
  (testing "Test constant +SDL-INIT-SENSOR+"
           (ok (= #x8000 +SDL-INIT-SENSOR+))))

(deftest test-constant-sdl-init-noparachute
  (testing "Test constant +SDL-INIT-NOPARACHUTE+"
           (ok (= #x100000 +SDL-INIT-NOPARACHUTE+))))

(deftest test-constant-sdl-init-everything
  (testing "Test constant +SDL-INIT-EVERYTHING+"
           (ok (= (logior +SDL-INIT-TIMER+
                          +SDL-INIT-AUDIO+
                          +SDL-INIT-VIDEO+
                          +SDL-INIT-EVENTS+
                          +SDL-INIT-JOYSTICK+
                          +SDL-INIT-HAPTIC+
                          +SDL-INIT-GAMECONTROLLER+
                          +SDL-INIT-SENSOR+)
                  +SDL-INIT-EVERYTHING+))))

(deftest test-constant-sdl-texteditingevent-text-size
  (testing "Test constant +SDL-TEXTEDITINGEVENT-TEXT-SIZE+"
           (ok (= 32 +SDL-TEXTEDITINGEVENT-TEXT-SIZE+))))

(deftest test-constant-sdl-textinputevent-text-size
  (testing "Test constant +SDL-TEXTINPUTEVENT-TEXT-SIZE+"
           (ok (= 32 +SDL-TEXTINPUTEVENT-TEXT-SIZE+))))


;; Declared in include/SDL_pixels.h

(deftest test-struct-sdl-color-and-set-color
  (testing "Test struct SDL-COLOR and function SET-COLOR"
           (with-foreign-objects ((color '(:struct sdl-color)))
             (set-color color 1 2 3 4)
             (with-foreign-slots ((r g b a) color (:struct sdl-color))
               (ok (= 1 r))
               (ok (= 2 g))
               (ok (= 3 b))
               (ok (= 4 a))))))


;; Declared in include/SDL_rect.h

(deftest test-struct-sdl-rect-and-set-rect
  (testing "Test struct SDL-RECT and function SET-RECT"
           (with-foreign-objects ((rect '(:struct sdl-rect)))
             (set-rect rect 1 2 3 4)
             (with-foreign-slots ((x y w h) rect (:struct sdl-rect))
               (ok (= 1 x))
               (ok (= 2 y))
               (ok (= 3 w))
               (ok (= 4 h))))))


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

(deftest test-sdl-init-with-noparachute
  (testing "Calling SDL-INIT with +SDL-INIT-NOPARACHUTE+ works."
           (let ((retval (sdl-init +SDL-INIT-NOPARACHUTE+)))
             (sdl-quit)
             (ok (= 0 retval)))))

(deftest test-sdl-init-with-everything
  (testing "Calling SDL-INIT with +SDL-INIT-EVERYTHING+ works."
           (let ((retval (sdl-init +SDL-INIT-EVERYTHING+)))
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

(deftest test-with-init-with-noparachute
  (testing "Calling WITH-INIT with +SDL-INIT-NOPARACHUTE+ works."
           (let ((retval 128))
             (ok (= retval (with-init (+SDL-INIT-NOPARACHUTE+)
                                      retval))))))

(deftest test-with-init-with-everything
  (testing "Calling WITH-INIT with +SDL-INIT-EVERYTHING+ works."
           (let ((retval 128))
             (ok (= retval (with-init (+SDL-INIT-EVERYTHING+)
                                      retval))))))
