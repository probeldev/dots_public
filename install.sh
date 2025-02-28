mkdir ~/.config/hypr
cp hyprland.conf ~/.config/hypr/hyprland.conf
cp hyprlock.conf ~/.config/hypr/hyprlock.conf
cp hyprpaper.conf ~/.config/hypr/hyprpaper.conf

mkdir ~/.config/waybar
cp waybar/style.css ~/.config/waybar/style.css
cp waybar/config ~/.config/waybar/config

rm -rf ~/.config/swaync
cp -r swaync ~/.config/swaync

rm -r ~/.config/rofi
cp -r rofi ~/.config/rofi

rm -rf ~/.config/foot
cp -r foot ~/.config/foot

cp zshenv ~/.zshenv

sudo yum install -y hyprland
sudo yum install -y network-manager-gnome
sudo yum install -y htop
sudo yum install -y hyprpaper
sudo yum install -y foot
sudo yum install -y git
sudo yum install -y rofi
sudo yum install -y grim
sudo yum install -y slurp
sudo yum install -y brightnessctl
sudo yum install -y waybar
# sudo yum install -y mako-notifier
sudo yum install -y pulsemixer
sudo yum install -y wl-clipboard
sudo yum install -y linux-cpupower
sudo yum install -y pipewire-alsa
sudo yum install -y wf-recorder # todo add hotkey and notification
sudo yum install -y breeze      # todo: разобраться как выбирать иконки в kde приложениях
sudo yum install -y firefox-esr
sudo yum install -y swayidle
sudo yum install -y redshift
sudo yum install -y swappy
sudo dnf install -y fira-code-fonts
sudo yum install -y gnome-keyring # связка ключей для всяких скайпов

# sudo yum install -y wofi
sudo yum install -y sway-notification-center

# sh nwg-drawer.sh
#sh libinput-gestures.sh  # todo: remove
