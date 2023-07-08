;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; === GNU System Config by iWas <3 === ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; === Global Modules === ;;
(use-modules (gnu home)
	     (gnu packages)
	     (gnu packages package-management)
	     (gnu services)
	     (gnu home services)
	     (gnu home services shells)
	     (guix gexp))

(home-environment
  ;; === Packages === ;;
  (packages
    (specifications->packages
      (list "bat"
	    "btop"
	    "cava"
	    "curl"
	    "dmenu"
	    "emacs"
	    "feh"
	    "file"
	    "git"
	    "gnupg"
	    "htop"
	    "i3-wm"
	    "kitty"
	    "mangohud"
	    "neofetch"
	    "neovim"
	    "netcat"
	    "openssh"
	    "pinentry"
	    "python"
	    "squashfs-tools"
	    "tree"
	    "ungoogled-chromium"
	    "wine"
	    "xrandr"
	    "zsh")))

  ;; === Services === ;;
  (services
          ;; i3
    (list (simple-service 'i3-config
			  home-xdg-configuration-files-service-type
			   (list `("i3/config"
				   ,(local-file "./config/i3/config"))))
	  ;; kitty
	  (simple-service 'kitty-config
			  home-xdg-configuration-files-service-type
			   (list `("kitty/kitty.conf"
				   ,(local-file "./config/kitty/kitty.conf"))
				 `("kitty/color.ini"
				   ,(local-file "./config/kitty/color.ini"))))
	  ;; emacs
	  (simple-service 'emacs-config
			  home-files-service-type
			   (list `(".emacs.d/init.el"
				   ,(local-file "./config/emacs/init.el"))
				 `(".emacs.d/config.org"
				   ,(local-file "./config/emacs/config.org"))
				 `(".emacs.d/logo.png"
				   ,(local-file "./config/emacs/logo.png"))))
	  ;; git
	  (simple-service 'git-config
			  home-files-service-type
			   (list `(".gitconfig"
				   ,(local-file "./config/git/gitconfig"))))
	  ;; wallpapers
	  (simple-service 'wallpapers-config
			  home-files-service-type
			         ;; base
			   (list `(".wallpapers/wallpaper-1.jpg"
				   ,(local-file "./config/wallpapers/wallpaper-1.jpg"))
				 `(".wallpapers/wallpaper-2.jpg"
				   ,(local-file "./config/wallpapers/wallpaper-2.jpg"))
				 ;; extra
				 `(".wallpapers/extra/gnu-love.png"
				   ,(local-file "./config/wallpapers/extra/gnu-love.png"))
				 `(".wallpapers/extra/skyrim.jpg"
				   ,(local-file "./config/wallpapers/extra/skyrim.jpg"))
				 ;; icons
				 `(".wallpapers/icons/iwas.png"
				   ,(local-file "./config/wallpapers/icons/iwas.png"))
				 `(".wallpapers/icons/gnu.png"
				   ,(local-file "./config/wallpapers/icons/gnu.png"))
				 ;; the-last-of-us
				 `(".wallpapers/the-last-of-us/tlou2_ellie-dance.jpg"
				   ,(local-file "./config/wallpapers/the-last-of-us/tlou2_ellie-dance.jpg"))
				 `(".wallpapers/the-last-of-us/tlou2_ellie-guitar.jpg"
				   ,(local-file "./config/wallpapers/the-last-of-us/tlou2_ellie-guitar.jpg"))))
	  ;; zsh
	  (simple-service 'zsh-config
			  home-files-service-type
			  	 ;; local
			   (list `(".zshrc"
				   ,(local-file "./config/zsh/zshrc"))
				 `(".zsh/.fzf.zsh"
				   ,(local-file "./config/zsh/fzf.zsh"))
				 `(".zsh/.p10k.zsh"
				   ,(local-file "./config/zsh/p10k.zsh"))
				 `(".zsh/zsh-sudo/sudo.plugin.zsh"
				   ,(local-file "./config/zsh/sudo.plugin.zsh"))
				 ;; external
				 `(".zsh/powerlevel10k"
				   ,(local-file "./src/powerlevel10k" #:recursive? #t))
				 `(".zsh/fzf"
				   ,(local-file "./src/fzf" #:recursive? #t))
				 `(".zsh/zsh-syntax-highlighting"
				   ,(local-file "./src/zsh-syntax-highlighting" #:recursive? #t))
				 `(".zsh/zsh-autosuggestions"
				   ,(local-file "./src/zsh-autosuggestions" #:recursive? #t))))
	  ;; xorg
	  (simple-service 'xorg-config
			  home-files-service-type
			   (list `(".xprofile"
				   ,(local-file "./config/xorg/xprofile"))
				 `(".Xresources"
				   ,(local-file "./config/xorg/Xresources"))))
	  ;; neofetch
	  (simple-service 'neofetch-config
			  home-xdg-configuration-files-service-type
			   (list `("neofetch/config.conf"
				   ,(local-file "./config/neofetch/config.conf"))))
	  ;; mangohud
	  (simple-service 'mangohud-config
			  home-xdg-configuration-files-service-type
			   (list `("MangoHud/Mangohud.conf"
				   ,(local-file "./config/MangoHud/MangoHud.conf"))))
	  ;; btop
	  (simple-service 'btop-config
			  home-xdg-configuration-files-service-type
			   (list `("btop/btop.conf"
				   ,(local-file "./config/btop/btop.conf"))))
	  ;; htop
	  (simple-service 'htop-config
			  home-xdg-configuration-files-service-type
			   (list `("htop/htoprc"
				   ,(local-file "./config/htop/htoprc"))))
	  ;; ssh
	  (simple-service 'ssh-config
			  home-files-service-type
			   (list `(".ssh/config"
				   ,(local-file "./config/ssh/config"))))
	  ;; minecraft
	  (simple-service 'minecraft-config
			  home-files-service-type
			   (list `(".minecraft/launch"
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
			   (list `("cmcl/cmcl.json"
				   ,(local-file "./config/minecraft/launcher/cmcl.json"))))
	  ;; cava
	  (simple-service 'cava-config
			  home-xdg-configuration-files-service-type
			   (list `("cava/config"
				   ,(local-file "./config/cava/config"))))
	  ;; chromium
	  (simple-service 'chromium-config
			  home-xdg-configuration-files-service-type
			   (list `("chromium-flags.conf"
				   ,(local-file "./config/chromium/chromium-flags.conf")))))))
