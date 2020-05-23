# After Install
Create a new user and edit the Sudoers file.
sudo systemctl enable SERVICENAME
*novp - Not Installed on Vanir PC

# Fonts
+ adobe-source-han-sans-otc-fonts
+ adobe-source-han-serif-otc-fonts
+ noto-fonts
+ noto-fonts-cjk
+ noto-fonts-tc (AUR) *novp
+ ttf-tw (AUR) *novp
+ ttf-hack
+ ttf-font-awesome

# Terminal
+ termite (cutom config on github)

# Sound
+ amixer (volume up and down)
+ playerctl (pause and play buttons)

# Brightness
+ xorg-xbacklight (for brightness)
+ redshift (for less eye strain)
+ arandr (for screens)

# Application
+ git
+ man
+ htop
+ nvim (config on github)
+ feh (for wallpaper)
+ xorg-server && xorg-xinit (for graphical env)
+ i3-gaps (config on github)
+ i3status (config on github)
+ Rofi (instead of dmenu - config on github)
+ ranger (terminal file manager)
+ mupdf (pdf reader) *novp
+ zathura (pdf reader)
+ zathura-pdf-mupdf (table of contents and bookmarks with tab)
+ firefox (create differnt profiles and set up for security)
+ keepassxc
+ mpv (media player)
+ syncthing (for synchronization)
+ polybar (config on github)
+ networkmanager
+ networkmanager-dmenu-git
+ scrot (screenshot)
+ openssh
+ chromium
+ transmission
+ gscan2pdf
+ atom
+ thunar

# Games (optional)
+ retroarch (have to set audio drivers to alsa instead of puls) *novp
+ retroarch-assets-xmb (for menu fonts) *novp
+ libretro-ppsspp (retroarch ppsspp emulator, has some issues with font) *novp
+ libretro-mupen64plus-next (N64 emulator, runs perfect with vulcan) *novp
+ ppsspp (no issues and more customizable, 60fps cheats)
+ openMW

# Optional apps
+ lightdm && lightdm-gtk-greeter (sudo systemctl enable lightdm.service) (optional login screen instead of tty) *novp
