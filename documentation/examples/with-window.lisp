(ql:quickload :cl-octaspire-sdl2-gl)
(in-package :cl-octaspire-sdl2-gl)

(trivial-main-thread:with-body-in-main-thread (:blocking t)
  (with-init (+SDL-INIT-VIDEO+)
    (with-window ("Test" 0 0 256 128 0)
      (with-foreign-objects ((event '(:union sdl-event)))
        (let ((run t))
          (loop while run
                do (loop while (/= (sdl-pollevent event) 0)
                         do
                         (cffi:with-foreign-slots ((type) event (:union sdl-event))
                           (when (eq type :SDL-QUIT) (setf run nil))))))))))

