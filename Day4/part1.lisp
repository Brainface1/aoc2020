(ql:quickload "str")

(defun set-eq (a b)
  (and (subsetp a b) (subsetp b a)))

(defvar fields '(ecl pid eyr hcl byr iyr hgt))


(defun input ()
  (setf n 0)
  (setf acc '())
  (loop for line = (read-line t nil :eof) until (eq line :eof)
        do (progn
             (if (str:blankp line) (progn
                                   (when (set-eq acc fields) (incf n))
                                   (setf acc nil))
                 (setf acc (append acc (remove nil (mapcar #'(lambda (sym)
                                                    (when (str:containsp (string sym) line :ignore-case t) sym)) fields)))))))
  (format t "~&~D" n))
