;;; GNU --- "GNU's Not UNIX!"
;;;
;;; This file is part of GNU.
;;;
;;; GNU is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU. If not, see <http://www.gnu.org/licenses/>.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; === GNU System Config by iWas <3 === ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; === Modules === ;;
(use-modules (gnu)
             (gnu packages shells)
             (gnu packages certs)
             (gnu services base)
             (gnu services avahi)
             (gnu services networking)
             (gnu services xorg)
             (gnu services cups)
             (gnu services dbus)
             (gnu services sound)
             (gnu services desktop)
	     (nongnu packages linux)
	     (nongnu system linux-initrd))


;; === Variables === ;;
;; Base options
(define %label "GNU/Linux")
(define %kernel linux)
(define %initrd microcode-initrd)
(define %firmware (list linux-firmware))
(define %hostname "sheldon")
(define %locale "en_US.utf8")
(define %timezone "Europe/Madrid")
(define %keyboard-layout (keyboard-layout "us" "altgr-intl"))
(define %issue "GNU/\\s \\r (\\l)\\n")
;; User
(define %personal-user-name "iwas")
(define %personal-user-fullname "Wasym Atieh Alonso")
(define %personal-user-group "users")
(define %personal-user-suppl-groups '("wheel" "audio" "video"))
;; Filesystems
(define %part-sys-label "SYS")
(define %part-sys-mountpoint "/")
(define %part-sys-format "ext4")
(define %part-boot-label "BOOT")
(define %part-boot-mountpoint "/boot")
(define %part-boot-format "ext4")
(define %part-efi-label "EFI")
(define %part-efi-mountpoint "/boot/efi")
(define %part-efi-format "vfat")
(define %part-data-label "DATA")
(define %part-data-mountpoint
  (string-append "/home/" %personal-user-name "/data"))
(define %part-data-format "ext4")
;; Packages
(define %packages-list
  (list
   nss-certs))


;; === Data Structures === ;;
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
   (timeout -1)
   (theme (grub-theme
	   (gfxmode '("800x600x32"))))))
;; User
(define %personal-user
  (user-account
   (name %personal-user-name)
   (comment %personal-user-fullname)
   (group %personal-user-group)
   (supplementary-groups %personal-user-suppl-groups)))
;; Services
(define %service-agetty-config
  (agetty-configuration
   (tty "ttyS0")
   (term "xterm")
   (no-clear? #t)
   (no-hostname? #t)))
(define %service-xorg-config
  (xorg-configuration
   (keyboard-layout %keyboard-layout)))
(define %service-cups-config
  (cups-configuration
   (web-interface? #t)))
(define %service-os-release-file
  (extra-special-file
   "/etc/os-release"
   (local-file "./config/etc/os-release")))
(define %service-lsb-release-file
  (extra-special-file
   "/etc/lsb-release"
   (local-file "./config/etc/lsb-release")))
(define %service-sysctl-file
  (extra-special-file
   "/etc/sysctl.conf"
   (local-file "./config/etc/sysctl.conf")))
(define %services-list
  (list
   ;; Agetty
   (service agetty-service-type %service-agetty-config)
   ;; Xorg
   (set-xorg-configuration %service-xorg-config)
   ;; D-Bus
   (service avahi-service-type)
   (service udisks-service-type)
   (service upower-service-type)
   (service accountsservice-service-type)
   (service cups-pk-helper-service-type)
   (service colord-service-type)
   (service geoclue-service-type)
   (service polkit-service-type)
   (service elogind-service-type)
   (service dbus-root-service-type)
   ;; DHCP
   (service dhcp-client-service-type)
   ;; NTP
   (service ntp-service-type)
   ;; Audio
   (service alsa-service-type)
   (service pulseaudio-service-type)
   ;; CUPS
   (service cups-service-type %service-cups-config)
   ;; etc extra config files
   %service-os-release-file
   %service-lsb-release-file
   %service-sysctl-file))


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
 ;; %part-fs-list => list
 ;; %base-file-systems => list
 (file-systems (append %part-fs-list %base-file-systems))
 
 ;; Bootloader
 ;; %bootloader-config => <bootloader-configuration>
 (bootloader %bootloader-config)

 ;; Users
 ;; %personal-user => <user-account>
 ;; %base-user-accounts => list
 (users (cons %personal-user %base-user-accounts))

 ;; Packages
 ;; %packages-list => list
 ;; %base-packages => list
 (packages (append %packages-list %base-packages))

 ;; Services
 ;; %services-list => list
 ;; %base-services => list
 (services (append %services-list %base-services)))
