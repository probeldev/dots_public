
rm -rf ~/.config/rio 
cp -r rio ~/.config/rio  


rm -rf ~/.config/superfile/
cp -r superfile ~/.config/superfile/ 

cp  aerospace/.aerospace.toml ~/.aerospace.toml

cp  skhd/.skhdrc ~/.skhdrc


# hack for aerospace
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer


# disable dock 
defaults write com.apple.dock autohide-delay -float 1000; killall Dock
# for restore dock
#defaults delete com.apple.dock autohide-delay; killall Dock
