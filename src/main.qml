import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import SignUpForm.View 1.0

import "qrc:/views/controls" as Controls

Window
{
    id: root

    visible: true
    width: ViewsProperties.sizes.default_window_width
    height: ViewsProperties.sizes.default_window_height
    minimumHeight: ViewsProperties.sizes.default_window_height
    color: Theme.background.default_color

    Behavior on color
    {
        ColorAnimation
        {
            duration: ViewsProperties.durations.default_animation
        }
    }

    Column
    {
        id: labels_column

        width: parent.width * 0.7
        anchors.top: parent.top
        anchors.topMargin: ViewsProperties.sizes.content_top_margin
        anchors.left: parent.left
        anchors.leftMargin: ViewsProperties.sizes.content_left_margin
        spacing: ViewsProperties.sizes.default_spacing

        Text
        {
            id: sign_up_label

            text: "Sign Up"
            font
            {
                pixelSize: 30
                weight: Font.Black
            }
            color: Theme.fonts.default_color
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Text
        {
            id: fill_form_label

            text: "Please fill in this form to create an account!"
            font
            {
                pixelSize: 15
                weight: Font.Thin
            }
            color: "gray"
            opacity: 0.6
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle
    {
        id: block_separator

        anchors.top: parent.top
        anchors.topMargin: 105
        width: parent.width
        height: 1
        opacity: 0.5
        color: "gray"
    }

    Controls.ThemedSwitch
    {
        id: theme_switch

        anchors.top: parent.top
        anchors.topMargin: ViewsProperties.sizes.default_margin
        anchors.right: parent.right
        anchors.rightMargin: ViewsProperties.sizes.default_margin
        checked: true
        width: ViewsProperties.sizes.switch_button_width
        height: ViewsProperties.sizes.switch_button_height
        switch_duration: ViewsProperties.durations.default_animation

        onCheckedChanged:
        {
            ThemeController.change_theme(checked ? "light" : "dark")
        }
    }
}
