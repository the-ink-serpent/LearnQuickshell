import QtQuick
import QtQuick.Layouts
import Quickshell
import qs

Rectangle{
    id: timeSection
    width: timeBlock.implicitWidth
    height: timeBlock.implicitHeight
    color: "transparent"
    //get clock data
    SystemClock{
        id: clock
        precision: SystemClock.seconds
    }
    Text{
        id: timeBlock
        text: Qt.formatDateTime(clock.date, "hh:mm dd MMM, yyyy")
        color: MatugenColors.primary
    }
}