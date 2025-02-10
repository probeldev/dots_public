sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists --system flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo flatpak install -y --system flathub org.kde.krita
sudo flatpak install -y --system flathub org.libreoffice.LibreOffice
sudo flatpak install -y --system flathub org.gnome.gitlab.somas.Apostrophe

sudo flatpak install -y --system flathub org.kde.kwrite
gio mime text/csv org.kde.kwrite.desktop         # Установка редактором по умолчанию для csv
gio mime application/json org.kde.kwrite.desktop # Установка редактора по умлчанию для json

sudo flatpak install -y --system flathub app.drey.Dialect
sudo flatpak install -y --system flathub io.github.flattool.Warehouse
sudo flatpak install -y --system flathub io.github.giantpinkrobots.flatsweep
sudo flatpak install -y --system flathub org.telegram.desktop
sudo flatpak install -y --system flathub com.skype.Client
sudo flatpak install -y --system flathub com.viber.Viber
sudo flatpak install -y --system flathub net.nokyan.Resources
sudo flatpak install -y --system flathub org.dbgate.DbGate
sudo flatpak install -y --system flathub md.obsidian.Obsidian
sudo flatpak install -y --system flathub com.github.tchx84.Flatseal
sudo flatpak install -y --system flathub org.kde.ktorrent

#sudo flatpak install -y --system  flathub com.visualstudio.code
#sudo flatpak install -y --system  flathub org.freedesktop.Sdk.Extension.golang # for vs code

sudo flatpak install -y --system flathub io.github.amit9838.mousam
sudo flatpak install -y --system flathub flathub org.feichtmeier.Musicpod

sudo flatpak install -y --system flathub org.gnome.Snapshot

sudo flatpak install -y --system flathub org.kde.dolphin
gio mime x-directory/normal org.kde.dolphin.desktop # Установка файловым менеджером по умолчанию
gio mime inode/directory org.kde.dolphin.desktop    # Установка файловым менеджером по умолчанию

sudo flatpak install -y --system flathub org.kde.haruna

sudo flatpak install -y --system flathub page.kramo.Sly
sudo flatpak install -y --system flathub org.gnome.Papers
gio mime application/pdf org.gnome.Papers.desktop # установка по умолчанию для pdf
sudo flatpak install -y --system flathub org.gnome.Loupe

sudo flatpak install -y --system flathub app.zen_browser.zen
gio mime x-scheme-handler/http app.zen_browser.zen.desktop  # Установка браузером по умолчанию
gio mime x-scheme-handler/https app.zen_browser.zen.desktop # Установка браузером по умолчанию
gio mime text/html app.zen_browser.zen.desktop              # Установка браузером по умолчанию

sudo flatpak install -y --system flathub com.github.tenderowl.frog

sudo flatpak install -y --system flathub org.gnome.FileRoller

sudo flatpak install -y --system flathub codes.loers.Karlender

sudo flatpak install -y --system flathub pw.mmk.OpenFreebuds # для наушников хуавей

sudo flatpak install -y --system flathub org.gnome.gitlab.somas.Apostrophe

sudo flatpak install -y --system flathub io.github.ebonjaeger.bluejay
