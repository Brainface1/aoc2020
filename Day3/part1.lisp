(defun read-input ()
  (setf seq nil)
  (loop for line = (read-line t nil :eof) ; stream, no error, :eof value
      until (eq line :eof)
        do (setf seq (append seq (list (parse-line line)))))
  seq)

(defun parse-line (str)
  (mapcar #'(lambda (ch) (if (equal ch #\#) t nil))
          (do* ((n 0 (1+ n))
                (ch (char str n) (char str n))
                (row (list ch) (append row (list ch))))
            ((eq n (- (length str) 1)) row))))

(defun get-pos (x y table)
  (let ((seq (nth y table)))
    (nth (mod x (length seq)) seq)))

(defun traverse (table)
  (setf goal (list-length table))
  (setf x 0)
  (setf k 0)
  (dotimes (y (1- goal))
    (setf x (+ x 3))
    (when (get-pos x (1+ y) table) (incf k)))
  (format t "~&~S" k))

(defun main ()
  (traverse (read-input)))

(sb-ext:save-lisp-and-die "aoc" :toplevel #'main :executable t)
