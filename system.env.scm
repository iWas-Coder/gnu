;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; === GNU System Config by iWas <3 === ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-module (robby system))

;; Base options
(define-public %label "GNU/Linux")
(define-public %kernel linux)
(define-public %initrd microcode-initrd)
(define-public %firmware (list linux-firmware))
(define-public %hostname "sheldon")
(define-public %locale "en_US.utf8")
(define-public %timezone "Europe/Madrid")
(define-public %keyboard-layout (keyboard-layout "us" "altgr-intl"))
(define-public %issue "GNU/\s \r (\l)")

;; User
(define-public %personal-user-name "iwas")
(define-public %personal-user-fullname "Wasym Atieh Alonso")
(define-public %personal-user-group "users")
(define-public %personal-user-suppl-groups
  '("wheel"
    "audio"
    "video"))
(define-public %personal-user-shell (file-append zsh "bin/zsh"))

;; Filesystems
(define-public %part-sys-label "SYS")
(define-public %part-sys-mountpoint "/")
(define-public %part-sys-format "ext4")
(define-public %part-boot-label "BOOT")
(define-public %part-boot-mountpoint "/boot")
(define-public %part-boot-format "ext4")
(define-public %part-efi-label "EFI")
(define-public %part-efi-mountpoint "/boot/efi")
(define-public %part-efi-format "vfat")
(define-public %part-data-label "DATA")
(define-public %part-data-mountpoint
  (string-append
    "/home/"
    %personal-user-name
    "/data"))
(define-public %part-data-format "vfat")

;; Packages
(define-public %package-list
  (list
    "nss-certs"))
