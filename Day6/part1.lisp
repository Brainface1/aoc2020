(defun parse-line (line)
  (list-length (remove-duplicates (loop for i from 0 to (1- (length line))
                                        collect (char line i)))))

(defun main ()
  (loop for line = (read-line t nil :eof) ; stream, no error, :eof value
      until (eq line :eof)
      sum (parse-line line)))
