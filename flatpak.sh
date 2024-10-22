sudo apt install -y flatpak
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y --user flathub org.kde.krita
flatpak install -y --user flathub org.libreoffice.LibreOffice
flatpak install -y --user flathub org.gnome.gitlab.somas.Apostrophe

flatpak install -y --user flathub org.kde.kwrite
gio mime text/csv org.kde.kwrite.desktop # Установка редактором по умолчанию для csv

flatpak install -y --user flathub app.drey.Dialect
flatpak install -y --user flathub io.github.flattool.Warehouse
flatpak install -y --user flathub io.github.giantpinkrobots.flatsweep
flatpak install -y --user flathub org.telegram.desktop
flatpak install -y --user flathub com.skype.Client
flatpak install -y --user flathub com.viber.Viber
flatpak install -y --user flathub net.nokyan.Resources
flatpak install -y --user flathub org.dbgate.DbGate
flatpak install -y --user flathub md.obsidian.Obsidian
flatpak install -y --user flathub com.github.tchx84.Flatseal
flatpak install -y --user flathub org.kde.ktorrent

#flatpak install -y --user flathub com.visualstudio.code
#flatpak install -y --user flathub org.freedesktop.Sdk.Extension.golang # for vs code

flatpak install -y --user flathub io.github.amit9838.mousam
flatpak install -y --user flathub org.gnome.Podcasts

flatpak install -y --user flathub org.gnome.Snapshot

flatpak install -y --user flathub org.kde.dolphin
gio mime x-directory/normal org.kde.dolphin.desktop # Установка файловым менеджером по умолчанию
gio mime inode/directory org.kde.dolphin.desktop    # Установка файловым менеджером по умолчанию

flatpak install -y --user flathub org.kde.haruna

flatpak install -y --user flathub page.kramo.Sly
flatpak install -y --user flathub org.kde.okular
flatpak install -y --user flathub org.kde.gwenview

flatpak install -y --user flathub io.github.zen_browser.zen
gio mime x-scheme-handler/http io.github.zen_browser.zen.desktop  # Установка браузером по умолчанию
gio mime x-scheme-handler/https io.github.zen_browser.zen.desktop # Установка браузером по умолчанию

flatpak install -y --user flathub com.github.tenderowl.frog
