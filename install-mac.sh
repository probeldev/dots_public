
rm -rf ~/.config/ghostty 
cp -r ghostty ~/.config/ghostty 


rm -rf ~/.config/superfile/
cp -r superfile ~/.config/superfile/ 

cp  aerospace/.aerospace.toml ~/.aerospace.toml


# отключения анимаций на маке
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
