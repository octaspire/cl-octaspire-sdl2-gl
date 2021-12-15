# Copyright (c) 2020, 2021 octaspire.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
LISP ?= sbcl

.PHONY: test repl slynk swank demo help

test:
	@$(LISP) --eval "(ql:quickload :cl-octaspire-sdl2-gl/tests)" \
                 --eval "(uiop:quit (if (rove:run :cl-octaspire-sdl2-gl/tests :style :dot) 0 1))"

repl:
	@$(LISP) --eval "(ql:quickload :cl-octaspire-sdl2-gl)"       \
                 --eval "(ql:quickload :cl-octaspire-sdl2-gl/tests)" \
                 --eval "(in-package :cl-octaspire-sdl2-gl)"

slynk:
	@$(LISP) --eval "(ql:quickload :slynk)"                      \
                 --eval "(ql:quickload :cl-octaspire-sdl2-gl)"       \
                 --eval "(ql:quickload :cl-octaspire-sdl2-gl/tests)" \
                 --eval "(slynk:create-server :dont-close t)"        \
                 --eval "(in-package :cl-octaspire-sdl2-gl)"

swank:
	@$(LISP) --eval "(ql:quickload :swank)"                      \
                 --eval "(ql:quickload :cl-octaspire-sdl2-gl)"       \
                 --eval "(ql:quickload :cl-octaspire-sdl2-gl/tests)" \
                 --eval "(swank:create-server :dont-close t)"        \
                 --eval "(in-package :cl-octaspire-sdl2-gl)"

demo:
	@$(LISP) --quit --load documentation/examples/with-window.lisp

help:
	@echo ""
	@echo "Available targets:"
	@echo ""
	@echo "  test  - run unit tests, with exit code 0 for success"
	@echo "  repl  - start loaded in REPL"
	@echo "  slynk - start loaded in REPL with slynk server (sly)"
	@echo "  swank - start loaded in REPL with swank server (slime)"
	@echo "  demo  - display small demo application"
	@echo "  help  - display this message"
	@echo ""
