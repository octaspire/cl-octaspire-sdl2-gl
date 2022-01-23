;; -*- compile-command: "cd .. && make test && cd -"; -*-
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

(defconstant +MIN-INT32-VALUE+ -2147483648)
(defconstant +MAX-INT32-VALUE+  2147483647)


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


;; Declared in include/SDL.h

(deftest test-sdl-quit
  (testing "Calling SDL-QUIT after init works."
           (let ((retval (sdl-init +SDL-INIT-TIMER+)))
             (sdl-quit)
             (ok (= 0 retval)))))


;; Declared in include/SDL_events.h

(deftest test-cenum-sdl-eventtype-firstevent
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-FIRSTEVENT."
           (ok (= 0 (foreign-enum-value 'sdl-eventtype :SDL-FIRSTEVENT)))))

;; Application

(deftest test-cenum-sdl-eventtype-quit
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-QUIT."
           (ok (= #x100 (foreign-enum-value 'sdl-eventtype :SDL-QUIT)))))

(deftest test-cenum-sdl-eventtype-app-terminating
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-APP-TERMINATING."
           (ok (= #x101 (foreign-enum-value 'sdl-eventtype :SDL-APP-TERMINATING)))))

(deftest test-cenum-sdl-eventtype-app-lowmemory
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-APP-LOWMEMORY."
           (ok (= #x102 (foreign-enum-value 'sdl-eventtype :SDL-APP-LOWMEMORY)))))

(deftest test-cenum-sdl-eventtype-app-willenterbackground
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-APP-WILLENTERBACKGROUND."
           (ok (= #x103 (foreign-enum-value 'sdl-eventtype :SDL-APP-WILLENTERBACKGROUND)))))

(deftest test-cenum-sdl-eventtype-app-didenterbackground
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-APP-DIDENTERBACKGROUND."
           (ok (= #x104 (foreign-enum-value 'sdl-eventtype :SDL-APP-DIDENTERBACKGROUND)))))

(deftest test-cenum-sdl-eventtype-app-willenterforeground
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-APP-WILLENTERFOREGROUND."
           (ok (= #x105 (foreign-enum-value 'sdl-eventtype :SDL-APP-WILLENTERFOREGROUND)))))

(deftest test-cenum-sdl-eventtype-app-didenterforeground
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-APP-DIDENTERFOREGROUND."
           (ok (= #x106 (foreign-enum-value 'sdl-eventtype :SDL-APP-DIDENTERFOREGROUND)))))

(deftest test-cenum-sdl-eventtype-app-localechanged
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-APP-LOCALECHANGED."
           (ok (= #x107 (foreign-enum-value 'sdl-eventtype :SDL-APP-LOCALECHANGED)))))

;; Display

(deftest test-cenum-sdl-eventtype-displayevent
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-DISPLAYEVENT."
           (ok (= #x150 (foreign-enum-value 'sdl-eventtype :SDL-DISPLAYEVENT)))))

;; Window

(deftest test-cenum-sdl-eventtype-windowevent
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-WINDOWEVENT"
           (ok (= #x200 (foreign-enum-value 'sdl-eventtype :SDL-WINDOWEVENT)))))

(deftest test-cenum-sdl-eventtype-syswmevent
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-SYSWMEVENT"
           (ok (= #x201 (foreign-enum-value 'sdl-eventtype :SDL-SYSWMEVENT)))))

;; Keyboard

(deftest test-cenum-sdl-eventtype-keydown
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-KEYDOWN"
           (ok (= #x300 (foreign-enum-value 'sdl-eventtype :SDL-KEYDOWN)))))

(deftest test-cenum-sdl-eventtype-keyup
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-KEYUP"
           (ok (= #x301 (foreign-enum-value 'sdl-eventtype :SDL-KEYUP)))))

(deftest test-cenum-sdl-eventtype-textediting
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-TEXTEDITING"
           (ok (= #x302 (foreign-enum-value 'sdl-eventtype :SDL-TEXTEDITING)))))

(deftest test-cenum-sdl-eventtype-textinput
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-TEXTINPUT"
           (ok (= #x303 (foreign-enum-value 'sdl-eventtype :SDL-TEXTINPUT)))))

(deftest test-cenum-sdl-eventtype-keymapchanged
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-KEYMAPCHANGED"
           (ok (= #x304 (foreign-enum-value 'sdl-eventtype :SDL-KEYMAPCHANGED)))))

;; Mouse

(deftest test-cenum-sdl-eventtype-mousemotion
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-MOUSEMOTION"
           (ok (= #x400 (foreign-enum-value 'sdl-eventtype :SDL-MOUSEMOTION)))))

(deftest test-cenum-sdl-eventtype-mousebuttondown
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-MOUSEBUTTONDOWN"
           (ok (= #x401 (foreign-enum-value 'sdl-eventtype :SDL-MOUSEBUTTONDOWN)))))

(deftest test-cenum-sdl-eventtype-mousebuttonup
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-MOUSEBUTTONUP"
           (ok (= #x402 (foreign-enum-value 'sdl-eventtype :SDL-MOUSEBUTTONUP)))))

(deftest test-cenum-sdl-eventtype-mousewheel
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-MOUSEWHEEL"
           (ok (= #x403 (foreign-enum-value 'sdl-eventtype :SDL-MOUSEWHEEL)))))

;; Joystick

(deftest test-cenum-sdl-eventtype-joyaxismotion
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-JOYAXISMOTION"
           (ok (= #x600 (foreign-enum-value 'sdl-eventtype :SDL-JOYAXISMOTION)))))

(deftest test-cenum-sdl-eventtype-joyballmotion
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-JOYBALLMOTION"
           (ok (= #x601 (foreign-enum-value 'sdl-eventtype :SDL-JOYBALLMOTION)))))

(deftest test-cenum-sdl-eventtype-joyhatmotion
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-JOYHATMOTION"
           (ok (= #x602 (foreign-enum-value 'sdl-eventtype :SDL-JOYHATMOTION)))))

(deftest test-cenum-sdl-eventtype-joybuttondown
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-JOYBUTTONDOWN"
           (ok (= #x603 (foreign-enum-value 'sdl-eventtype :SDL-JOYBUTTONDOWN)))))

(deftest test-cenum-sdl-eventtype-joybuttonup
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-JOYBUTTONUP"
           (ok (= #x604 (foreign-enum-value 'sdl-eventtype :SDL-JOYBUTTONUP)))))

(deftest test-cenum-sdl-eventtype-joydeviceadded
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-JOYDEVICEADDED"
           (ok (= #x605 (foreign-enum-value 'sdl-eventtype :SDL-JOYDEVICEADDED)))))

(deftest test-cenum-sdl-eventtype-joydeviceremoved
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-JOYDEVICEREMOVED"
           (ok (= #x606 (foreign-enum-value 'sdl-eventtype :SDL-JOYDEVICEREMOVED)))))

;; Game controller

(deftest test-cenum-sdl-eventtype-controlleraxismotion
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERAXISMOTION"
           (ok (= #x650 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERAXISMOTION)))))

(deftest test-cenum-sdl-eventtype-controllerbuttondown
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERBUTTONDOWN"
           (ok (= #x651 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERBUTTONDOWN)))))

(deftest test-cenum-sdl-eventtype-controllerbuttonup
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERBUTTONUP"
           (ok (= #x652 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERBUTTONUP)))))

(deftest test-cenum-sdl-eventtype-controllerdeviceadded
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERDEVICEADDED"
           (ok (= #x653 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERDEVICEADDED)))))

(deftest test-cenum-sdl-eventtype-controllerdeviceremoved
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERDEVICEREMOVED"
           (ok (= #x654 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERDEVICEREMOVED)))))

(deftest test-cenum-sdl-eventtype-controllerdeviceremapped
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERDEVICEREMAPPED"
           (ok (= #x655 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERDEVICEREMAPPED)))))

(deftest test-cenum-sdl-eventtype-controllertouchpaddown
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERTOUCHPADDOWN"
           (ok (= #x656 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERTOUCHPADDOWN)))))

(deftest test-cenum-sdl-eventtype-controllertouchpadmotion
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERTOUCHPADMOTION"
           (ok (= #x657 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERTOUCHPADMOTION)))))

(deftest test-cenum-sdl-eventtype-controllertouchpadup
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERTOUCHPADUP"
           (ok (= #x658 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERTOUCHPADUP)))))

(deftest test-cenum-sdl-eventtype-controllersensorupdate
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CONTROLLERSENSORUPDATE"
           (ok (= #x659 (foreign-enum-value 'sdl-eventtype :SDL-CONTROLLERSENSORUPDATE)))))

;; Touch

(deftest test-cenum-sdl-eventtype-fingerdown
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-FINGERDOWN"
           (ok (= #x700 (foreign-enum-value 'sdl-eventtype :SDL-FINGERDOWN)))))

(deftest test-cenum-sdl-eventtype-fingerup
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-FINGERUP"
           (ok (= #x701 (foreign-enum-value 'sdl-eventtype :SDL-FINGERUP)))))

(deftest test-cenum-sdl-eventtype-fingermotion
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-FINGERMOTION"
           (ok (= #x702 (foreign-enum-value 'sdl-eventtype :SDL-FINGERMOTION)))))

;; Gesture

(deftest test-cenum-sdl-eventtype-dollargesture
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-DOLLARGESTURE"
           (ok (= #x800 (foreign-enum-value 'sdl-eventtype :SDL-DOLLARGESTURE)))))

(deftest test-cenum-sdl-eventtype-dollardrecord
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-DOLLARDRECORD"
           (ok (= #x801 (foreign-enum-value 'sdl-eventtype :SDL-DOLLARDRECORD)))))

(deftest test-cenum-sdl-eventtype-multigesture
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-MULTIGESTURE"
           (ok (= #x802 (foreign-enum-value 'sdl-eventtype :SDL-MULTIGESTURE)))))

;; Clipboard

(deftest test-cenum-sdl-eventtype-clipboardupdate
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-CLIPBOARDUPDATE"
           (ok (= #x900 (foreign-enum-value 'sdl-eventtype :SDL-CLIPBOARDUPDATE)))))

;; Drag and Drop

(deftest test-cenum-sdl-eventtype-dropfile
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-DROPFILE"
           (ok (= #x1000 (foreign-enum-value 'sdl-eventtype :SDL-DROPFILE)))))

(deftest test-cenum-sdl-eventtype-droptext
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-DROPTEXT"
           (ok (= #x1001 (foreign-enum-value 'sdl-eventtype :SDL-DROPTEXT)))))

(deftest test-cenum-sdl-eventtype-dropbegin
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-DROPBEGIN"
           (ok (= #x1002 (foreign-enum-value 'sdl-eventtype :SDL-DROPBEGIN)))))

(deftest test-cenum-sdl-eventtype-dropcomplete
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-DROPCOMPLETE"
           (ok (= #x1003 (foreign-enum-value 'sdl-eventtype :SDL-DROPCOMPLETE)))))

;; Audio hotplug

(deftest test-cenum-sdl-eventtype-audiodeviceadded
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-AUDIODEVICEADDED"
           (ok (= #x1100 (foreign-enum-value 'sdl-eventtype :SDL-AUDIODEVICEADDED)))))

(deftest test-cenum-sdl-eventtype-audiodeviceremoved
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-AUDIODEVICEREMOVED"
           (ok (= #x1101 (foreign-enum-value 'sdl-eventtype :SDL-AUDIODEVICEREMOVED)))))

;; Sensor

(deftest test-cenum-sdl-eventtype-sensorupdate
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-SENSORUPDATE"
           (ok (= #x1200 (foreign-enum-value 'sdl-eventtype :SDL-SENSORUPDATE)))))

;; Render

(deftest test-cenum-sdl-eventtype-render-targets-reset
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-RENDER-TARGETS-RESET"
           (ok (= #x2000 (foreign-enum-value 'sdl-eventtype :SDL-RENDER-TARGETS-RESET)))))

(deftest test-cenum-sdl-eventtype-render-device-reset
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-RENDER-DEVICE-RESET"
           (ok (= #x2001 (foreign-enum-value 'sdl-eventtype :SDL-RENDER-DEVICE-RESET)))))

;; User

(deftest test-cenum-sdl-eventtype-userevent
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-USEREVENT"
           (ok (= #x8000 (foreign-enum-value 'sdl-eventtype :SDL-USEREVENT)))))

;; Last event

(deftest test-cenum-sdl-eventtype-lastevent
  (testing "Test cenum SDL-EVENTTYPE with value :SDL-LASTEVENT"
           (ok (= #xFFFF (foreign-enum-value 'sdl-eventtype :SDL-LASTEVENT)))))


;; Declared in include/SDL_scancode.h

(deftest test-cenum-sdl-scancode-unknown
  (testing "Test cenum SDL-scancode with value :SDL-SCANCODE-UNKNOWN."
           (ok (= 0 (foreign-enum-value 'sdl-scancode :SDL-SCANCODE-UNKNOWN)))))

;; Usage page 0x07 (USB keyboard page).

(deftest test-cenum-sdl-scancode-a
  (testing "Test cenum SDL-scancode with value :SDL-SCANCODE-A."
           (ok (= 4 (foreign-enum-value 'sdl-scancode :SDL-SCANCODE-A)))))

(deftest test-cenum-sdl-scancode-b
  (testing "Test cenum SDL-scancode with value :SDL-SCANCODE-B"
    (ok (= 5 (foreign-enum-value 'sdl-scancode :SDL-SCANCODE-B)))))

(deftest test-cenum-sdl-scancode-c
  (testing "Test cenum SDL-scancode with value :SDL-SCANCODE-C"
    (ok (= 6 (foreign-enum-value 'sdl-scancode :SDL-SCANCODE-C)))))

(deftest test-cenum-sdl-scancode-d
  (testing "Test cenum SDL-scancode with value :SDL-SCANCODE-D"
    (ok (= 7 (foreign-enum-value 'sdl-scancode :SDL-SCANCODE-D)))))

;; TODO Scancodes 8 - 286 skipped at the moment.

(deftest test-cenum-sdl-num-scancodes
  (testing "Test cenum SDL-scancode with value :SDL-NUM-SCANCODES"
    (ok (= 512 (foreign-enum-value 'sdl-scancode :SDL-NUM-SCANCODES)))))


;; Declared in include/SDL_keycode.h

(deftest test-ctype-sdl-keycode-with-min-int32-value
  (testing "Test ctype SDL-KEYCODE with smallest possible int32 value"
    (let ((value +MIN-INT32-VALUE+))
      (with-foreign-objects ((keycode 'sdl-keycode))
        (setf keycode value)
        (ok (= value keycode))))))

(deftest test-ctype-sdl-keycode-with-zero
  (testing "Test ctype SDL-KEYCODE with value zero"
    (let ((value 0))
      (with-foreign-objects ((keycode 'sdl-keycode))
        (setf keycode value)
        (ok (= value keycode))))))

(deftest test-ctype-sdl-keycode-with-max-int32-value
  (testing "Test ctype SDL-KEYCODE with largest possible int32 value"
    (let ((value +MAX-INT32-VALUE+))
      (with-foreign-objects ((keycode 'sdl-keycode))
        (setf keycode value)
        (ok (= value keycode))))))


;; Declared in include/SDL_keyboard.h

(deftest test-struct-sdl-keysym
  (testing "Test struct SDL-KEYSYM and function SET-KEYSYM"
           (with-foreign-objects ((keysym '(:struct sdl-keysym)))
             (set-keysym keysym :SDL-SCANCODE-UNKNOWN 1 2)
             (with-foreign-slots ((scancode sym mod) keysym (:struct sdl-keysym))
               (ok (= 0 (foreign-enum-value 'sdl-scancode scancode)))
               (ok (= 1 sym))
               (ok (= 2 mod))))))

(deftest test-format-sdl-keysym
  (testing "Test function FORMAT-SDL-KEYSYM"
           (with-foreign-objects ((keysym '(:struct sdl-keysym)))
             (set-keysym keysym :SDL-SCANCODE-UNKNOWN 1 2)
             (ok (string= "scancode=SDL-SCANCODE-UNKNOWN sym=1 mod=2"
                          (format-sdl-keysym keysym))))))



;; Declared in include/SDL_events.h

(deftest test-struct-sdl-commonevent
  (testing "Test struct SDL-COMMONEVENT and functions
SET-SDL-COMMONEVENT and FORMAT-SDL-COMMONEVENT"
           (with-foreign-objects ((event '(:struct sdl-commonevent)))
             (set-sdl-commonevent event 1000 2000)
             (with-foreign-slots ((type timestamp) event (:struct sdl-commonevent))
               (ok (= 1000 type))
               (ok (= 2000 timestamp)))
             (ok (string= "Event 'xyz' type=1000 timestamp=2000"
                          (format-sdl-commonevent event "xyz"))))))

(deftest test-struct-sdl-displayevent
  (testing "Test struct SDL-DISPLAYEVENT and functions
SET-SDL-DISPLAYEVENT FORMAT-SDL-DISPLAYEVENT"
           (with-foreign-objects ((event '(:struct sdl-displayevent)))
             (set-sdl-displayevent event 1000 2000 3000 32 4000)
             (with-foreign-slots ((type timestamp display event data1) event (:struct sdl-displayevent))
               (ok (= 1000 type))
               (ok (= 2000 timestamp))
               (ok (= 3000 display))
               (ok (= 32   event))
               (ok (= 4000 data1)))
             (ok (string= "Event 'DisplayEvent' type=1000 timestamp=2000 display=3000 event=32 data1=4000"
                          (format-sdl-displayevent event))))))

(deftest test-struct-sdl-windowevent
  (testing "Test struct SDL-WINDOWEVENT and functions
SET-SDL-WINDOWEVENT FORMAT-SDL-WINDOWEVENT"
           (with-foreign-objects ((event '(:struct sdl-windowevent)))
             (set-sdl-windowevent event 1000 2000 3000 32 4000 5000)
             (with-foreign-slots ((type timestamp windowID event data1 data2) event (:struct sdl-windowevent))
               (ok (= 1000 type))
               (ok (= 2000 timestamp))
               (ok (= 3000 windowID))
               (ok (= 32   event))
               (ok (= 4000 data1))
               (ok (= 5000 data2)))
             (ok (string= "Event 'WindowEvent' type=1000 timestamp=2000 windowID=3000 event=32 data1=4000 data2=5000"
                          (format-sdl-windowevent event))))))
