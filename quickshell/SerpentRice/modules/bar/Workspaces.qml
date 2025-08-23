import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

import qs

Rectangle{
    color: MatugenColors.primary_container
    height: 25
    width: workspaceUnitLayout.implicitWidth + 20
    bottomLeftRadius: 10
    bottomRightRadius: 10
    RowLayout{
        id: workspaceUnitLayout
        anchors.centerIn: parent
        spacing: 5
        Repeater{
            model: Hyprland.workspaces
            Rectangle{
                implicitWidth: modelData.active ? 25 : 15
                height: 15
                radius: 10
                color: modelData.active ? MatugenColors.on_primary_fixed : MatugenColors.inverse_primary
                MouseArea{
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + modelData.id)
                }
            }
        }
    }
}