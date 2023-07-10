;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; === GNU System Config by iWas <3 === ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-module (robby install))

;; Base options
(define-public %label "GNU/Linux (iso)")
(define-public %kernel linux)
(define-public %initrd microcode-initrd)
(define-public %firmware (list linux-firmware))
(define-public %hostname "gnu")
(define-public %locale "en_US.utf8")
(define-public %timezone "Europe/Madrid")
(define-public %keyboard-layout (keyboard-layout "us" "altgr-intl"))
(define-public %issue "GNU/\s (iso) \r (\l)")

;; Packages
(define-public %package-list
  (list
    "glibc"
    "fontconfig"
    "font-dejavu"
    "font-gnu-unifont"
    "grub"
    "nss-certs"))
