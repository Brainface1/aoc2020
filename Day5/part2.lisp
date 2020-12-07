(defun parse-line (line)
  (do* ((n -1 (1+ n))
        (c nil (char line n))
        (xupper 127 (if (equal c #\F) (- xupper (ceiling (/ (- xupper xlower) 2))) xupper))
        (xlower 0 (if (equal c #\B) (+ xlower (ceiling (/ (- xupper xlower) 2))) xlower))

        (yupper 8 (if (equal c #\L) (- yupper (ceiling (/ (- yupper ylower) 2))) yupper))
        (ylower 0 (if (equal c #\R) (+ ylower (ceiling (/ (- yupper ylower) 2))) ylower)))
       ((= n (1- (length line))) (+ (* 8 xlower) ylower))))

(defun main ()
    (let ((seq (loop for line = (read-line t nil :eof) ; stream, no error, :eof value
        until (eq line :eof)
                    collect (parse-line line))))
      (loop for s in seq when (and (not (member (+ s 1) seq)) (member (+ s 2) seq)) return (+ s 1))))
