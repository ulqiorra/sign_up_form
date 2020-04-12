import QtQuick 2.12

Item
{
    id: root

    property alias placeholder_text: placeholder_text.text
    property alias is_input_acceptable: text_input.acceptableInput
    property alias current_text: text_input.text
    property alias input_active_focus: text_input.activeFocus
    property real placeholder_text_color_opacity: 0.6
    property color placeholder_text_color: "gray"

    property int text_input_side_margin: 15
    property color text_input_color: "#000000"

    property int background_radius: 3
    property color background_color: "#F3F3F3"
    property color background_border_default_color: "transparent"
    property color background_border_warning_color: "#FF0000"

    property int font_size: 15
    property int maximum_text_length: 50

    property var input_echo_mode: TextInput.Normal
    property var text_input_validator: null

    function show_warning()
    {
        background.border.color = root.background_border_warning_color
    }

    function reset_warning()
    {
        background.border.color = root.background_border_default_color
    }

    Rectangle
    {
        id: background

        color: root.background_color
        width: parent.width
        height: parent.height
        radius: root.background_radius
        border.width: 1
        border.color: root.background_border_default_color
    }

    Text
    {
        id: placeholder_text

        anchors.verticalCenter: text_input.verticalCenter
        anchors.left: text_input.left
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        width: text_input.width
        color: root.placeholder_text_color
        opacity: root.placeholder_text_color_opacity
        wrapMode: TextInput.WordWrap
        font
        {
            pixelSize: root.font_size
            weight: Font.Thin
        }
    }

    TextInput
    {
        id: text_input

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin:  root.text_input_side_margin
        anchors.verticalCenter: background.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        width: parent.width - root.text_input_side_margin * 2
        wrapMode: TextInput.WordWrap
        maximumLength: root.maximum_text_length
        color: root.text_input_color
        echoMode: root.input_echo_mode
        validator: root.text_input_validator
        clip: true
        font
        {
            pixelSize: root.font_size
            weight: Font.Thin
        }

        onTextChanged:
        {
            if (!text_input.activeFocus)
            {
                placeholder_text.visible = text_input.text.length === 0
            }
            else
            {
                root.reset_warning()
            }
        }

        onActiveFocusChanged:
        {
            if (text_input.activeFocus)
            {
                placeholder_text.visible = false
            }
            else
            {
                placeholder_text.visible = text_input.text.length === 0
            }
        }
    }
}
