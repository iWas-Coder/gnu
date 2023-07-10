;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; === GNU System Config by iWas <3 === ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; === Global Modules === ;;
(use-modules (gnu)
             (gnu services base)
             (gnu services networking)
             (gnu services xorg)
             (gnu services cups)
             (gnu services desktop)
             (gnu services sound)
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
;; Packages
(define %package-spec-list
  (specifications->packages %package-list))


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
  ; %part-fs-list => list
  ; %base-file-systems => list
  (file-systems (append %part-fs-list %base-file-systems))

  ;; Bootloader
  ; %bootloader-config => <bootloader-configuration>
  (bootloader %bootloader-config)

  ;; Users
  ; %personal-user => <user-account>
  ; %base-user-accounts => list
  (users (cons %personal-user %base-user-accounts))

  ;; Packages
  ; %package-spec-list => <specifications->packages>
  ; %base-packages => list
  (packages (cons %package-spec-list %base-packages))

  ;; Services
  (services
    (append
      (list
        (modify-services %base-services
          (sysctl-service-type config =>
            (sysctl-configuration
              (settings
                (append
                  '(("vm.max_map_count" . "1048576"))
                  %default-sysctl-settings)))))
        (agetty-service
          (agetty-configuration
            (term "xterm")
            (no-clear? #t)
            (no-hostname? #t)))
        (extra-special-file
          "/etc/os-release"
          (local-file "./config/os-release"))
        (extra-special-file
          "/etc/lsb-release"
          (local-file "./config/lsb-release"))
        (service dhcp-client-service-type)
        (set-xorg-configuration
          (xorg-configuration (keyboard-layout keyboard-layout)))
        (service cups-service-type
          (cups-configuration
            (web-interface? #t)))
        (dbus-service)
        (elogind-service)
        (service alsa-service-type)
        (service pulseaudio-service-type))
      %base-services))
)
