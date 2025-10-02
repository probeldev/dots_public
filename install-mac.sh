
rm -rf ~/.config/rio 
cp -r rio ~/.config/rio  


rm -rf ~/.config/superfile/
cp -r superfile ~/.config/superfile/ 

cp  aerospace/.aerospace.toml ~/.aerospace.toml

cp  skhd/.skhdrc ~/.skhdrc

# отключения анимаций на маке
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# hack for aerospace
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

