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
(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu packages)
             (gnu packages package-management)
             (gnu services)
             (guix gexp))


;; === GNU Home Definition === ;;
(home-environment
 ;; Packages
 (packages
  (specifications->packages
   (list
    "bat"
    "binutils"
    "btop"
    "cava"
    "curl"
    "dmenu"
    "emacs"
    "feh"
    "file"
    "gcc"
    "git"
    "gnupg"
    "htop"
    "i3-wm"
    "i3status"
    "i3lock"
    "kitty"
    "mangohud"
    "neofetch"
    "neovim"
    "netcat"
    "openssh"
    "p7zip"
    "pinentry"
    "python"
    "ripgrep"
    "squashfs-tools"
    "tree"
    "ungoogled-chromium"
    "wine"
    "xinit"
    "xrandr"
    "zsh")))

 ;; Services
 (services
  (list
   ;; channels
   (simple-service 'channels-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("guix/channels.scm"
		      ,(local-file "./channels.scm"))))
   ;; i3
   (simple-service 'i3-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("i3/config"
		      ,(local-file "./config/i3/config"))))
   ;; kitty
   (simple-service 'kitty-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("kitty/kitty.conf"
		      ,(local-file "./config/kitty/kitty.conf"))
		    `("kitty/color.ini"
		      ,(local-file "./config/kitty/color.ini"))))
   ;; emacs
   (simple-service 'emacs-config
		   home-files-service-type
		   (list
		    `(".emacs.d/init.el"
		      ,(local-file "./config/emacs/init.el"))
		    `(".emacs.d/config.org"
		      ,(local-file "./config/emacs/config.org"))
		    `(".emacs.d/logo.png"
		      ,(local-file "./config/emacs/logo.png"))))
   ;; git
   (simple-service 'git-config
		   home-files-service-type
		   (list
		    `(".gitconfig"
		      ,(local-file "./config/git/gitconfig"))))
   ;; wallpapers
   (simple-service 'wallpapers-config
		   home-files-service-type
		   (list
		    `(".wallpapers"
		      ,(local-file "./config/wallpapers" #:recursive? #t))))
   ;; zsh
   (simple-service 'zsh-config
		   home-files-service-type
		   (list
		    ;; local
		    `(".zshrc"
		      ,(local-file "./config/zsh/zshrc"))
		    `(".zsh/.fzf.zsh"
		      ,(local-file "./config/zsh/fzf.zsh"))
		    `(".zsh/.p10k.zsh"
		      ,(local-file "./config/zsh/p10k.zsh"))
		    `(".zsh/zsh-sudo/sudo.plugin.zsh"
		      ,(local-file "./config/zsh/sudo.plugin.zsh"))
		    ;; external
		    `(".zsh/powerlevel10k"
		      ,(local-file "./src/powerlevel10k"
				   #:recursive? #t))
		    `(".zsh/fzf"
		      ,(local-file "./src/fzf"
				   #:recursive? #t))
		    `(".zsh/zsh-syntax-highlighting"
		      ,(local-file "./src/zsh-syntax-highlighting"
				   #:recursive? #t))
		    `(".zsh/zsh-autosuggestions"
		      ,(local-file "./src/zsh-autosuggestions"
				   #:recursive? #t))))
   ;; xorg
   (simple-service 'xorg-config
		   home-files-service-type
		   (list
		    `(".xprofile"
		      ,(local-file "./config/xorg/xprofile"))
		    `(".Xresources"
		      ,(local-file "./config/xorg/Xresources"))))
   ;; neofetch
   (simple-service 'neofetch-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("neofetch/config.conf"
		      ,(local-file "./config/neofetch/config.conf"))))
   ;; mangohud
   (simple-service 'mangohud-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("MangoHud/Mangohud.conf"
		      ,(local-file "./config/MangoHud/MangoHud.conf"))))
   ;; btop
   (simple-service 'btop-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("btop/btop.conf"
		      ,(local-file "./config/btop/btop.conf"))))
   ;; htop
   (simple-service 'htop-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("htop/htoprc"
		      ,(local-file "./config/htop/htoprc"))))
   ;; ssh
   (simple-service 'ssh-config
		   home-files-service-type
		   (list
		    `(".ssh/config"
		      ,(local-file "./config/ssh/config"))))
   ;; minecraft
   (simple-service 'minecraft-config
		   home-files-service-type
		   (list
		    `(".minecraft/launch"
		      ,(local-file "./config/minecraft/launch"))
		    `(".minecraft/launcher/cmds.txt"
		      ,(local-file "./config/minecraft/launcher/cmds.txt"))
		    `(".minecraft/launcher/skin.png"
		      ,(local-file "./config/minecraft/launcher/skin.png"))
		    `(".minecraft/game/options.txt"
		      ,(local-file "./config/minecraft/game/options.txt"))))
   ;; minecraft-cmcl
   (simple-service 'minecraft-cmcl-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("cmcl/cmcl.json"
		      ,(local-file "./config/minecraft/launcher/cmcl.json"))))
   ;; cava
   (simple-service 'cava-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("cava/config"
		      ,(local-file "./config/cava/config"))))
   ;; chromium
   (simple-service 'chromium-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("chromium-flags.conf"
		      ,(local-file "./config/chromium/chromium-flags.conf"))))
   ;; neovim
   (simple-service 'neovim-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("nvim"
		      ,(local-file "./src/nvchad"
				   #:recursive? #t))))
   ;; jetbrains-mono-nf-font
   (simple-service 'jetbrains-mono-nf-font-config
		   home-files-service-type
		   (list
		    `(".local/share/fonts/jetbrains-mono-nf"
		      ,(local-file "./config/fonts/jetbrains-mono-nf"
				   #:recursive? #t))))
   ;; macos-bigsur-cursor
   (simple-service 'macos-bigsur-cursor-config
		   home-files-service-type
		   (list
		    `(".local/share/icons/macos-bigsur"
		      ,(local-file "./config/cursors/macos-bigsur"
				   #:recursive? #t))))
   ;; bumblebee-status
   (simple-service 'bumblebee-status-config
		   home-xdg-configuration-files-service-type
		   (list
		    `("bumblebee-status"
		      ,(local-file "./src/bumblebee-status"
				   #:recursive? #t)))))))
