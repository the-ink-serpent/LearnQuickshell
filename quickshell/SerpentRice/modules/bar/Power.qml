import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.UPower
import Quickshell.Io
import Qt5Compat.GraphicalEffects
import qs

Rectangle{
    id: powerRoot
    width: icon.implicitWidth + powerText.implicitWidth
    height: icon.implicitHeight + powerText.implicitHeight
    color: "transparent"
    RowLayout{
        spacing: 5
        Image{
            id: icon
            smooth: false
            width: 30
            height: 30
            source: {
                var temp = GlobalVariables.battery_alert_Icon
                if(UPower.displayDevice.percentage > .10){
                    temp = GlobalVariables.battery_1_Icon
                }
                if(UPower.displayDevice.percentage > .30){
                    temp = GlobalVariables.battery_2_Icon
                }
                if(UPower.displayDevice.percentage > .50){
                    temp = GlobalVariables.battery_3_Icon
                }
                if(UPower.displayDevice.percentage > .70){
                    temp = GlobalVariables.battery_4_Icon
                }
                if(UPower.displayDevice.percentage > .90){
                    temp = GlobalVariables.battery_full_Icon
                }
                if(UPower.displayDevice.state == 1){
                    temp = GlobalVariables.battery_charging_Icon
                }
                return GlobalVariables.homePath + temp
            }
            sourceSize{
                width: 16
                height: 16
            }
        }
        Text{
            id: powerText
            text: Number(UPower.displayDevice.percentage * 100).toFixed(2) + "%"
            color: MatugenColors.primary_fixed_dim
        }
        Loader {
            active: true
            anchors.fill: icon
            sourceComponent: ColorOverlay {
                source: icon
                color: {
                    var temp = MatugenColors.on_error
                    if(UPower.displayDevice.percentage > .10){
                        temp = MatugenColors.primary_fixed_dim
                    }
                    if(UPower.displayDevice.percentage > .30){
                        temp = MatugenColors.secondary_fixed_dim
                    }
                    if(UPower.displayDevice.percentage > .50){
                        temp = MatugenColors.secondary_fixed_dim
                    }
                    if(UPower.displayDevice.percentage > .70){
                        temp = MatugenColors.secondary_fixed_dim
                    }
                    if(UPower.displayDevice.percentage > .90){
                        temp = MatugenColors.tertiary_fixed_dim
                    }
                    if(UPower.displayDevice.state == 1){
                        temp = MatugenColors.inverse_primary
                    }
                    return temp
                }
            }
        }
    }
    
}