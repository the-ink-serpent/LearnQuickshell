echo "removing old symlinked pywal files"

rm ~/.config/hypr/hyprland/pywal-color.conf
rm ~/.config/kitty/pywal-color.conf
rm ~/.config/starship.toml
rm ~/.config/quickshell/SerpentRice/PywalColor.qml

echo "symlinking pywal files"

ln ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/hyprland/pywal-color.conf
ln ~/.cache/wal/colors-kitty.conf ~/.config/kitty/pywal-color.conf
ln ~/.cache/wal/starship-pywal-color.toml ~/.config/starship.toml
ln ~/.cache/wal/pywal-color.qml ~/.config/quickshell/SerpentRice/PywalColor.qml

echo "symlinking finished"