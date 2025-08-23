import qs
import qs.modules.bar
import qs.modules.background

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

ShellRoot{
    id: root
    LazyLoader{ active: true; component: Background{} }
    LazyLoader{ active: true; component: Bar{} }
}