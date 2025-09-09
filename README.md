# LearnQuickshell
1) install matugen to dynamicaly generate colors
2) place all the folders in the ~/.config folder
3) make a "Wallpapers" and "Icons" folders and populate it with your own SVGs
4) make sure to run "sudo pacman -S qt6-5compat" to use the GraphicalEffects library in quickshell

###---Hey---###

If you don't want to use matugen and go with pywal, I have added a template file, it generates a qml file for quickshell as it pywal does not generate it by default (also have a starship config template modified from a preset); put it in the ~/.config/wal/template folder and run the "wal -i <path>" command, it will generate the template file in the .cache pywal directory.

I have also added a shell script that creates symlinks(hard) for the .cache color files generated to the respective .config app directory. just run it after the wal command, once the color files get generated. Change the paths in the scripts if necessary.

don't be afraid, if you break anything just reinstall arch 🤣🤣🤣

<img width="1366" height="768" alt="20250909_20h24m27s_grim" src="https://github.com/user-attachments/assets/e5f20346-0988-448e-adb2-42f7e2c31038" />

<img width="1366" height="768" alt="20250823_13h10m14s_grim" src="https://github.com/user-attachments/assets/dec6c51f-3faa-41d9-95f7-c9679da87d41" />
