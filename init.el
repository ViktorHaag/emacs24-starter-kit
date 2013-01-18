;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;

;; load the starter kit from the `after-init-hook' so all packages are loaded
(add-hook `after-init-hook
 `(lambda ()
    ;; remember this directory
    (setq starter-kit-dir
          ,(file-name-directory (or load-file-name (buffer-file-name))))
    
    ;; Use local org mode instead of the one that ships with Emacs binary, as an
    ;; attempted workaround for post 24.2 pretest builds botching
    (require 'cl)
    (setq load-path (remove-if (lambda (x) (string-match-p "org$" x)) load-path))
    
    (add-to-list 'load-path (car (file-expand-wildcards
                                  (concat starter-kit-dir
                                          "elpa/org-*"))))
             
    ;; load up the starter kit
    (require 'org)
    (org-babel-load-file (expand-file-name "starter-kit.org" starter-kit-dir))))

;;; init.el ends here
