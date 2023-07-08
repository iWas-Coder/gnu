;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; === GNU System Config by iWas <3 === ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; === Global Modules === ;;
(use-modules (gnu)
	     (nongnu packages linux)
	     (nongnu system linux-initrd))
;; === Service Modules === ;;
(use-service-modules networking ssh cups xorg desktop)

;; === GNU System Definition === ;;
(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "Europe/Madrid")
  (keyboard-layout (keyboard-layout "us" "altgr-intl"))
  (host-name "sheldon")
  
  ;; Users
  (users (cons* (user-account
                  (name "iwas")
                  (comment "Wasym Atieh Alonso")
                  (group "users")
                  (home-directory "/home/iwas")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages (system-wide)
  (packages (append (list (specification->package "nss-certs"))
                    %base-packages))

  ;; Services
  (services
   (append (list (service cups-service-type)
                 (set-xorg-configuration
                  (xorg-configuration (keyboard-layout keyboard-layout))))
           %desktop-services))

  ;; Bootloader
  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets (list "/dev/sda"))
                (keyboard-layout keyboard-layout)))

  ;; Filesystems
  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid "6c4af1dc-91a3-4873-85e1-049e471c9ef1"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))
