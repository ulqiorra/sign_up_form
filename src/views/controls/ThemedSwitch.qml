import QtQuick 2.12
import QtQuick.Controls 2.12

Switch
{
    id: root

    property int switch_duration: 250
    property color checked_color: "#0088CC"
    property color unchecked_color: "#516197"
    property color handle_click_color: "#cccccc"
    property color handle_color: "#ffffff"
    property color handle_unchecked_border_color: "#999999"

    indicator:Rectangle
    {
        implicitWidth: root.width
        implicitHeight: root.height
        x: root.leftPadding
        y: parent.height / 2 - height / 2
        radius: root.height / 6
        color: root.checked ? root.checked_color : root.unchecked_color
        border.color: root.checked ? root.checked_color : root.unchecked_color

        Rectangle
        {
            anchors.verticalCenter: parent.verticalCenter
            x: root.checked ? (parent.width - width - root.height * 0.12) : root.height * 0.12
            width: root.height * 0.76
            height: root.height * 0.76
            radius: root.height / 8
            color: root.down ? root.handle_click_color : root.handle_color
            border.color: root.checked ? (root.down ? root.checked_color : root.unchecked_color) : root.handle_unchecked_border_color

            Behavior on x
            {
                NumberAnimation
                {
                    duration: root.switch_duration
                }
            }
        }
    }
}
