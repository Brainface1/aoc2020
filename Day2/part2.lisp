(ql:quickload "str")

(defun xor (a b)
  (and (or a b) (not (and a b))))

(defun parse-line (str)
  (let ((seq (str:split " " str)))
    (list
      (parse-integer (first seq))
      (parse-integer (second seq))
      (third seq)
      (fourth seq))))

(defun eval-line (low high ch str)
  (let ((occ (str:count-substring ch str)))
    (xor
     (equal ch (str:s-nth (1- low) str))
     (equal ch (str:s-nth (1- high) str)))))

(defun parse-input ()
  (setf n 0)
  (loop for line = (read-line t nil :eof) ; stream, no error, :eof value
      until (eq line :eof)
        do (when (apply #'eval-line (parse-line line))
             (incf n)))
  (format t "~&~D" n))

(defun main ()
  (parse-input))

(sb-ext:save-lisp-and-die "aoc" :toplevel #'main :executable t)
