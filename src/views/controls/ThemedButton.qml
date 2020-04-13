import QtQuick 2.12
import QtQuick.Controls 2.12

Button
{
    id: root

    property real disabled_opacity: 0.5
    property color default_color: "#0088CC"
    property color click_color: "#0072AB"
    property color text_color: "#FFFFFF"

    property int button_radius: 3

    contentItem: Text
    {
        text: root.text
        font: root.font
        opacity: enabled ? 1.0 : root.disabled_opacity
        color: root.text_color
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle
    {
        implicitWidth: root.width
        implicitHeight: root.height
        opacity: enabled ? 1 : root.disabled_opacity
        radius: root.button_radius
        color: root.down ? root.click_color : root.default_color
    }
}
