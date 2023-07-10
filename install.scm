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
	           (nongnu packages linux)
	           (nongnu system linux-initrd))


;; === Variables === ;;
;; Base options
(define %label "GNU/Linux (iso)")
(define %kernel linux)
(define %initrd microcode-initrd)
(define %firmware (list linux-firmware))
(define %hostname "gnu")
(define %locale "en_US.utf8")
(define %timezone "Europe/Madrid")
(define %keyboard-layout (keyboard-layout "us" "altgr-intl"))
(define %issue "GNU/\\s (iso) \\r (\\l)")
;; Packages
(define %package-list
  (list
    "glibc"
    "fontconfig"
    "font-dejavu"
    "font-gnu-unifont"
    "grub"
    "nss-certs"))


;; === Data Structures === ;;
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
  (host-name %hostname)
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
