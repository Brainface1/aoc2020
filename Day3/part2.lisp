(defvar steps '((1 1) (3 1) (5 1) (7 1) (1 2)))

(defun parse-line (str)
  (mapcar #'(lambda (ch) (if (equal ch #\#) t nil))
          (do* ((n 0 (1+ n))
                (ch (char str n) (char str n))
                (row (list ch) (append row (list ch))))
            ((eq n (- (length str) 1)) row))))

(defun read-input ()
  (let ((seq nil))
    (loop for line = (read-line t nil :eof) ; stream, no error, :eof value
        until (eq line :eof)
          do (setf seq (append seq (list (parse-line line)))))
    seq))

(defun get-pos (x y table)
  (let ((seq (nth y table)))
    (nth (mod x (length seq)) seq)))

(defun traverse (table xstep ystep)
  (let ((goal (list-length table)))
      (do* ((y 0 (+ y ystep))
            (x 0 (+ x xstep))
            (count 0 (if (get-pos x y table) (1+ count) count)))
           ((eq (1+ y) goal) count))))

(defun main ()
  (let ((table (read-input)))
    (format t "~&~S"
            (apply #'* (mapcar #'(lambda (step) (traverse table (first step) (second step))) steps)))))

(sb-ext:save-lisp-and-die "aoc" :toplevel #'main :executable t)
