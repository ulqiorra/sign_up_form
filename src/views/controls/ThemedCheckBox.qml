import QtQuick 2.12
import QtQuick.Controls 2.12

CheckBox
{
    id: root

    property color indicator_color: "#838383"
    property color background_border_color: "#AA838383"
    property color text_color: "gray"

    property real text_opacity: 0.6

    indicator: Rectangle
    {
        implicitWidth: 14
        implicitHeight: 14
        x: root.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        color: "#F3F3F3"
        border.color: root.background_border_color

        Rectangle
        {
            width: 8
            height: 8
            x: 3
            y: 3
            radius: 2
            color: root.indicator_color
            visible: root.checked
        }
    }

    contentItem: Text
    {
        text: root.text
        font: root.font
        opacity: root.text_opacity
        color: root.text_color
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        leftPadding: root.indicator.width + root.spacing
    }
}
