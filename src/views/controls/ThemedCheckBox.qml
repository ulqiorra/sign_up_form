import QtQuick 2.12
import QtQuick.Controls 2.12

CheckBox
{
    id: root

    property color indicator_color: "#838383"
    property color background_color: "#F3F3F3"
    property color current_background_border_color: "#AA838383"
    property color background_border_default_color: "#AA838383"
    property color background_border_warning_color: "#FF0000"
    property color text_color: "gray"

    property int inform_duration: 2000
    property int blink_duration: 200

    property real text_opacity: 0.6

    function show_warning()
    {
        root.current_background_border_color = root.background_border_warning_color
    }

    function reset_warning()
    {
        root.current_background_border_color = root.background_border_default_color
    }

    function inform_user()
    {
        blink_timer.start()
        inform_user_timer.start()
    }

    Timer
    {
        id: inform_user_timer

        interval: root.inform_duration
        running: false
        repeat: false
        onTriggered:
        {
            blink_timer.stop()
            root.reset_warning()
        }
    }

    Timer
    {
        id: blink_timer

        repeat: true
        interval: root.blink_duration
        onTriggered:
        {
            if (root.current_background_border_color === root.background_border_warning_color)
            {
                root.reset_warning()
            }
            else
            {
                root.show_warning()
            }
        }
    }

    indicator: Rectangle
    {
        implicitWidth: 14
        implicitHeight: 14
        x: root.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        color: root.background_color
        border.color: root.current_background_border_color

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
