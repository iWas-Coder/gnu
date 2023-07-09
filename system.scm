;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; === GNU System Config by iWas <3 === ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; === Global Modules === ;;
(use-modules (gnu)
	           (nongnu packages linux)
	           (nongnu system linux-initrd)
             (robby system))

;; === Service Modules === ;;
(use-service-modules networking ssh cups xorg)


;; === Global Variables === ;;
;; Filesystems
(define %part-fs-list
  (list
    (file-system
      (device (file-system-label %part-sys-label))
      (mount-point %part-sys-mountpoint)
      (type %part-sys-format))
    (file-system
      (device (file-system-label %part-boot-label))
      (mount-point %part-boot-mountpoint)
      (type %part-boot-format))
    (file-system
      (device (file-system-label %part-efi-label))
      (mount-point %part-efi-mountpoint)
      (type %part-efi-format))
    (file-system
      (device (file-system-label %part-data-label))
      (mount-point %part-data-mountpoint)
      (type %part-data-format))))

;; Bootloader
(define %bootloader-config
  (bootloader-configuration
    (bootloader grub-efi-bootloader)
    (targets (list %part-efi-mountpoint))
    (keyboard-layout keyboard-layout)))
;; User
(define %personal-user
  (user-account
    (name %personal-user-name)
    (comment %personal-user-fullname)
    (group %personal-user-group)
    (supplementary-groups %personal-user-suppl-groups)
    (shell %personal-user-shell)))


;; === GNU System Definition === ;;
(operating-system
  ;; Base options
  (label %label)
  (kernel %kernel)
  (initrd %initrd)
  (firmware %firmware)
  (host-name %hostname)
  (locale %locale)
  (timezone %timezone)
  (keyboard-layout %keyboard-layout)
  (issue %issue)

  ;; Filesystems
  ; %part-fs-list -> list[<file-system>]
  ; %base-file-systems -> list[<file-system>]
  (file-systems (append %part-fs-list %base-file-systems))

  ;; Bootloader
  ; %bootloader-config -> <bootloader-configuration>
  (bootloader %bootloader-config)

  ;; Users
  ; %personal-user -> <user-account>
  ; %base-user-accounts -> list[<user-account>]
  (users (cons %personal-user %base-user-accounts))

  ;; Packages (system-wide)
  (packages
    (append
      (list
        (specification->package
          "nss-certs"))
      %base-packages))

  ;; Services
  (services
    (append
      (list
        (service cups-service-type)
        (set-xorg-configuration
          (xorg-configuration (keyboard-layout keyboard-layout))))
      %desktop-services))
)
