import QtQuick
import Qt.labs.platform
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

Variants{
    model: Quickshell.screens
    PanelWindow{
        id: bgRoot
        readonly property string homePath: StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]
        required property var modelData
        property string wallpaperPath: homePath + `/Wallpapers/04.jpg`
        property int wallpaperWidth: 0
        property int wallpaperHeight: 0
        property real effectiveWallpaperScale: 1
        property real preferredWallpaperScale: 1
        screen: modelData
        anchors{
            top: true
            left: true
            right: true
            bottom: true
        }
        color: "transparent"
        WlrLayershell.namespace: "quickshell:background"
        Component.onCompleted: {
            if (this.WlrLayershell != null) {
                this.WlrLayershell.layer = WlrLayer.Background;
            }
        }
        Process {
            id: getWallpaperSizeProc
            property string path: bgRoot.wallpaperPath
            command: [ "magick", "identify", "-format", "%w %h", path ]
            stdout: StdioCollector {
                id: wallpaperSizeOutputCollector
                onStreamFinished: {
                    const output = wallpaperSizeOutputCollector.text
                    const [width, height] = output.split(" ").map(Number);
                    const [screenWidth, screenHeight] = [bgRoot.screen.width, bgRoot.screen.height];
                    bgRoot.wallpaperWidth = width
                    bgRoot.wallpaperHeight = height

                    if (width <= screenWidth || height <= screenHeight) { // Undersized/perfectly sized wallpapers
                        bgRoot.effectiveWallpaperScale = Math.max(screenWidth / width, screenHeight / height);
                    } else { // Oversized = can be zoomed for parallax, yay
                        bgRoot.effectiveWallpaperScale = Math.min(
                            bgRoot.preferredWallpaperScale,
                            width / screenWidth, height / screenHeight
                        );
                    }
                }
            }
        }
        Image{
            id: wallpaper
            opacity: 1
            x: 0
            y: 0
            source: bgRoot.wallpaperPath
            fillMode: Image.PreserveAspectCrop
            sourceSize{
                width: bgRoot.screen.width * bgRoot.effectiveWallpaperScale
                height: bgRoot.screen.height * bgRoot.effectiveWallpaperScale
            }
        }
    }
}