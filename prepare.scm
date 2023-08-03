(define files '(
		"./src/pingu/home/iwas/.emacs.d"
		"./src/pingu/home/iwas/.game-pkg.log"
		"./src/pingu/home/iwas/.gitconfig"
		"./src/pingu/home/iwas/.wallpapers"
		"./src/pingu/home/iwas/.wprofile"
		"./src/pingu/home/iwas/.xprofile"
		"./src/pingu/home/iwas/.Xresources"
		"./src/pingu/home/iwas/.zshrc"
		"./src/pingu/home/iwas/.zsh/.fzf.zsh"
		"./src/pingu/home/iwas/.zsh/.p10k.zsh"
		))

(define (find-last-slash str)
  (let ((inverted-str (list->string (reverse (string->list str)))))
    (- (string-length str) (string-index inverted-str #\/))))

(for-each (lambda (file)
	    (let* ((last-slash-pos (find-last-slash file))
                   (path (substring file 0 last-slash-pos))
                   (file-name (substring file (+ last-slash-pos 1)))
                   (undotted-file-name (if (string-prefix? "." file-name)
                                           (substring file-name 1)
                                           file-name))
                   (undotted-file (string-append path undotted-file-name)))
	      (system (string-append "cp -v -r " file " " undotted-file))))
	  files)
