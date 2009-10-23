(defun def-snippet (new_file_name start end)
  "Create a snippet from the region"
  (interactive "FSave to snippet: \nr")
  (let (
	(my_buf (current-buffer)) 
	(write_file 
	 (concat 
	  (expand-file-name "~/.emacs.d/yasnippet/snippets/text-mode/ruby-mode/") 
	  (file-relative-name new_file_name)
	  )
	 )
	)
    (message "Save region (%s) to file: %s" 
	     (buffer-substring start end) write_file)
    (save-excursion
      (write-region start end write_file t)
      (load-file "~/.emacs")
      (delete-and-extract-region start end)
      (insert-before-markers (file-relative-name new_file_name))
      )
    )
  )

