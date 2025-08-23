import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import qs
import qs.modules.bar

Scope{
    id: bar
    Variants{
        model: Quickshell.screens
        LazyLoader {
            id: barLoader
            required property ShellScreen modelData
            active: true
            component: PanelWindow{
                id: bar
                anchors{
                    top: true
                    left: true
                    right: true
                }
                height: 40
                color: "transparent"
                exclusionMode: ExclusionMode.Ignore
                WlrLayershell.namespace: "quickshell:bar"
                WlrLayershell.layer: WlrLayer.Overlay
                Rectangle{
                    id: barRect
                    anchors{
                        fill: parent
                        topMargin: 5
                        leftMargin: 5
                        rightMargin: 5
                        bottomMargin: 5
                    }
                    color: MatugenColors.on_primary_fixed
                    radius: 10
                    RowLayout{
                        anchors.fill: parent
                        //left gap
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.maximumWidth: 25
                        }
                        //left
                        Rectangle{
                            anchors{
                                top: parent.top
                            }
                            Loader{ active: true; sourceComponent: Workspaces{} }
                        }
                        //middle
                        Rectangle{
                            Layout.fillWidth: true
                        }
                        //right
                        Rectangle{
                            width: right_pieces.implicitWidth
                            height: right_pieces.implicitHeight
                            color: "transparent"
                            RowLayout{
                                id: right_pieces
                                spacing: 20
                                Loader{ active: true; sourceComponent: Power{} }
                                Loader{ active: true; sourceComponent: Time{} }
                            }
                        }
                        //right gap
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.maximumWidth: 25
                        }
                    }
                }
            }
        }
    }
}


/*
Scope{
    id: bar
    Variants{
        model: Quickshell.screens
        LazyLoader {
            id: barLoader
            required property ShellScreen modelData
            active: true
            component: PanelWindow{
                id: bar
                anchors{
                    top: true
                    left: true
                    right: true
                }
                height: 40
                color: "transparent"
                exclusionMode: ExclusionMode.Ignore
                WlrLayershell.namespace: "quickshell:bar"
                WlrLayershell.layer: WlrLayer.Overlay
                Rectangle{
                    id: barRect
                    anchors{
                        fill: parent
                        topMargin: 5
                        leftMargin: 5
                        rightMargin: 5
                        bottomMargin: 5
                    }
                    color: MatugenColors.on_primary_fixed
                    radius: 15
                    //left
                    Item{
                        anchors{
                            left: parent.left
                            leftMargin: 25
                        }
                        Loader{ active: true; sourceComponent: Workspaces{} }
                    }
                    //middle
                    Item{
                        anchors{
                            horizontalCenter: parent.horizontalCenter
                            verticalCenter: parent.verticalCenter
                            verticalCenterOffset: -5
                        }
                        Text{
                            text: "Hello"
                        }
                    }
                    //right
                    Item{
                        anchors{
                            verticalCenter: parent.verticalCenter
                            verticalCenterOffset: -5
                            right: parent.right
                        }
                        RowLayout{
                            anchors.fill: parent
                            spacing: 5
                            Loader{ 
                                anchors{
                                    verticalCenter: parent.verticalCenter
                                    verticalCenterOffset: -5
                                    right: parent.right
                                    rightMargin: 230
                                }
                                active: true
                                sourceComponent: Power{} 
                            }
                            Loader{
                                anchors{
                                    verticalCenter: parent.verticalCenter
                                    verticalCenterOffset: -5
                                    right: parent.right
                                    rightMargin: 25
                                }
                                active: true
                                sourceComponent: Time{}
                            }
                        }
                    }
                }
            }
        }
    }
}
*/
