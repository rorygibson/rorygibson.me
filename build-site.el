;; Load the publishing system
(require 'ox-publish)


;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "static"
        :base-directory "./content"
        :base-extension "css\\|txt\\|jpg\\|gif\\|png"
        :recursive t
        :publishing-directory  "./public"
        :publishing-function 'org-publish-attachment)

       (list "org-site:main"
             :recursive t
             :base-directory "./content"
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./public"
             :with-author nil           ;; Don't include author name
             :with-creator nil            ;; Include Emacs and Org versions in footer
             :with-toc t                ;; Include a table of contents
             :section-numbers nil       ;; Don't include section numbers
             :time-stamp-file nil)))    ;; Don't include time stamp in file

;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-html5-fancy t
      org-html-head

      "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />
       <link rel=\"stylesheet\" href=\"./override.css\" />

        <script async src=\"https://www.googletagmanager.com/gtag/js?id=G-8GG8XZE028\"></script>
        <script>
         window.dataLayer = window.dataLayer || [];
         function gtag(){dataLayer.push(arguments);}
         gtag('js', new Date());

         gtag('config', 'G-8GG8XZE028');
        </script>

        <meta name=\"msvalidate.01\" content=\"7490D30E228C1CFFF1AD4A323FDF1B41\" />")



;; Generate the site output
(org-publish-all t)


(message "Build complete!")
