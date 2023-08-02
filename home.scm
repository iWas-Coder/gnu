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
    "gcc-toolchain"
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
   ;; xdg-configs
   (simple-service 'xdg-configs
		   home-xdg-configuration-files-service-type
		   (list
		    ;; btop
		    `("btop"
		      ,(local-file "./src/pingu/home/iwas/.config/btop" #:recursive? #t))
		    ;; bumblebee-status
		    `("bumblebee-status"
		      ,(local-file "./src/bumblebee-status" #:recursive? #t))
		    ;; cava
		    `("cava"
		      ,(local-file "./src/pingu/home/iwas/.config/cava" #:recursive? #t))
		    ;; chromium-flags
		    `("chromium-flags.conf"
		      ,(local-file "./src/pingu/home/iwas/.config/chromium-flags.conf"))
		    ;; cmcl
		    `("cmcl"
		      ,(local-file "./src/pingu/home/iwas/.config/cmcl" #:recursive? #t))
		    ;; vs-code
		    `("Code"
		      ,(local-file "./src/pingu/home/iwas/.config/Code" #:recursive? #t))
		    ;; guix-channels
		    `("guix/channels.scm"
		      ,(local-file "./channels.scm"))
		    ;; gtk-2.0
		    `("gtk-2.0"
		      ,(local-file "./src/pingu/home/iwas/.config/gtk-2.0" #:recursive? #t))
		    ;; gtk-3.0
		    `("gtk-3.0"
		      ,(local-file "./src/pingu/home/iwas/.config/gtk-3.0" #:recursive? #t))
		    ;; htop
		    `("htop"
		      ,(local-file "./src/pingu/home/iwas/.config/htop" #:recursive? #t))
		    ;; hypr
		    `("hypr"
		      ,(local-file "./src/pingu/home/iwas/.config/hypr" #:recursive? #t))
		    ;; i3
		    `("i3"
		      ,(local-file "./src/pingu/home/iwas/.config/i3" #:recursive? #t))
		    ;; kitty
		    `("kitty"
		      ,(local-file "./src/pingu/home/iwas/.config/kitty" #:recursive? #t))
		    ;; legendary
		    `("legendary"
		      ,(local-file "./src/pingu/home/iwas/.config/legendary" #:recursive? #t))
		    ;; mangohud
		    `("MangoHud"
		      ,(local-file "./src/pingu/home/iwas/.config/MangoHud" #:recursive? #t))
		    ;; neofetch
		    `("neofetch"
		      ,(local-file "./src/pingu/home/iwas/.config/neofetch" #:recursive? #t))
		    ;; nvim
		    `("nvim"
		      ,(local-file "./src/nvchad" #:recursive? #t))
		    ;; picom
		    `("picom"
		      ,(local-file "./src/pingu/home/iwas/.config/picom" #:recursive? #t))
		    ;; user-dirs
		    `("user-dirs.dirs"
		      ,(local-file "./src/pingu/home/iwas/.config/user-dirs.dirs"))
		    ;; waybar
		    `("waybar"
		      ,(local-file "./src/pingu/home/iwas/.config/waybar" #:recursive? #t))))
   ;; home-configs
   (simple-service 'home-configs
		   home-files-service-type
		   (list
		    ;; bitcoin
		    `(".bitcoin"
		      ,(local-file "./src/pingu/home/iwas/.bitcoin"))
		    ;; emacs
		    `(".emacs.d"
		      ,(local-file "./src/pingu/home/iwas/.emacs.d" #:recursive? #t))
		    ;; game-pkg-log
		    `(".game-pkg.log"
		      ,(local-file "./src/pingu/home/iwas/.game-pkg.log"))
		    ;; gitconfig
		    `(".gitconfig"
		      ,(local-file "./src/pingu/home/iwas/.gitconfig"))
		    ;; ironfish
		    `(".ironfish"
		      ,(local-file "./src/pingu/home/iwas/.ironfish"))
		    ;; fonts
		    `(".local/share/fonts"
		      ,(local-file "./src/pingu/home/iwas/.local/share/fonts" #:recursive? #t))
		    ;; minecraft
		    `(".minecraft/launch"
		      ,(local-file "./src/pingu/home/iwas/.minecraft/launch"))
		    `(".minecraft/launcher/skin.png"
		      ,(local-file "./src/pingu/home/iwas/.minecraft/launcher/skin.png"))
		    `(".minecraft/launcher/cmds.txt"
		      ,(local-file "./src/pingu/home/iwas/.minecraft/launcher/cmds.txt"))
		    `(".minecraft/game/options.txt"
		      ,(local-file "./src/pingu/home/iwas/.minecraft/game/options.txt"))
		    ;; ssh
		    `(".ssh/config"
		      ,(local-file "./src/pingu/home/iwas/.ssh/config"))
		    ;; vs-code
		    `(".vscode/extensions/extensions.json"
		      ,(local-file "./src/pingu/home/iwas/.vscode/extensions/extensions.json"))
		    ;; wallpapers
		    `(".wallpapers"
		      ,(local-file "./src/pingu/home/iwas/.wallpapers" #:recursive? #t))
		    ;; wprofile
		    `(".wprofile"
		      ,(local-file "./src/pingu/home/iwas/.wprofile"))
		    ;; xprofile
		    `(".xprofile"
		      ,(local-file "./src/pingu/home/iwas/.xprofile"))
		    ;; xresources
		    `(".Xresources"
		      ,(local-file "./src/pingu/home/iwas/.Xresources"))
		    ;; zsh
		    `(".zshrc"
		      ,(local-file "./src/pingu/home/iwas/.zshrc"))
		    `(".zsh/.fzf.zsh"
		      ,(local-file "./src/pingu/home/iwas/.zsh/.fzf.zsh"))
		    `(".zsh/.p10k.zsh"
		      ,(local-file "./src/pingu/home/iwas/.zsh/.p10k.zsh"))
		    `(".zsh/zsh-sudo"
		      ,(local-file "./src/pingu/home/iwas/.zsh/zsh-sudo" #:recursive? #t))
		    `(".zsh/powerlevel10k"
		      ,(local-file "./src/powerlevel10k" #:recursive? #t))
		    `(".zsh/fzf"
		      ,(local-file "./src/fzf" #:recursive? #t))
		    `(".zsh/zsh-syntax-highlighting"
		      ,(local-file "./src/zsh-syntax-highlighting" #:recursive? #t))
		    `(".zsh/zsh-autosuggestions"
		      ,(local-file "./src/zsh-autosuggestions" #:recursive? #t)))))))
