rm ~/.config/hypr/hyprland/pywal-color.conf
rm ~/.config/kitty/pywal-color.conf
rm ~/.config/quickshell/SerpentRice/PywalColor.qml

echo "symlinking pywal files"
ln ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/hyprland/pywal-color.conf
ln ~/.cache/wal/colors-kitty.conf ~/.config/kitty/pywal-color.conf
ln ~/.cache/wal/pywal-color.qml ~/.config/quickshell/SerpentRice/PywalColor.qml

echo "symlinking finished"