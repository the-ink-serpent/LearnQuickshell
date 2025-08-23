pragma Singleton
import Qt.labs.platform
import Quickshell

Singleton {
    id: root
    readonly property string homePath: StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]

    readonly property string battery_alert_Icon: `/Icons/battery-alert.svg`
    readonly property string battery_charging_Icon: `/Icons/battery-charging.svg`
    readonly property string battery_1_Icon: `/Icons/battery-1.svg`
    readonly property string battery_2_Icon: `/Icons/battery-2.svg`
    readonly property string battery_3_Icon: `/Icons/battery-3.svg`
    readonly property string battery_4_Icon: `/Icons/battery-4.svg`
    readonly property string battery_full_Icon: `/Icons/battery-full.svg`
}