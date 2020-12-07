(defun parse-line (line)
  (do* ((n -1 (1+ n))
        (c nil (char line n))
        (xupper 127 (if (equal c #\F) (- xupper (ceiling (/ (- xupper xlower) 2))) xupper))
        (xlower 0 (if (equal c #\B) (+ xlower (ceiling (/ (- xupper xlower) 2))) xlower))

        (yupper 8 (if (equal c #\L) (- yupper (ceiling (/ (- yupper ylower) 2))) yupper))
        (ylower 0 (if (equal c #\R) (+ ylower (ceiling (/ (- yupper ylower) 2))) ylower)))
       ((= n (1- (length line))) (+ (* 8 xlower) ylower))))

(defun main ()
    (loop for line = (read-line t nil :eof) ; stream, no error, :eof value
        until (eq line :eof)
        maximizing (parse-line line)))
