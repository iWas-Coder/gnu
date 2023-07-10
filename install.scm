;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; === GNU System Config by iWas <3 === ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; === Global Modules === ;;
(use-modules (gnu)
	           (nongnu packages linux)
	           (nongnu system linux-initrd)
             (robby install))


;; === Global Variables === ;;
;; Packages
(define %package-spec-list
  (specifications->packages %package-list))


;; === GNU Install Definition === ;;
(operating-system
  ;; Base options
  (label %label)
  (kernel %kernel)
  (initrd %initrd)
  (firmware %firmware)
  (hostname %hostname)
  (locale %locale)
  (timezone %timezone)
  (keyboard-layout %keyboard-layout)
  (issue %issue)

  ;; Packages
  ; %package-spec-list => <specifications->packages>
  ; %installer-disk-utilities => list
  ; %base-packages => list
  (packages (append %package-spec-list
                    %installer-disk-utilities
                    %base-packages))

  ;; Services
  ; %installation-services => list
  (services %installation-services))
