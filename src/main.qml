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

    function reset_window()
    {
        first_name_input.current_text = ""
        last_name_input.current_text = ""
        country_combo_box.currentIndex = -1
        email_input.current_text = ""
        password_input.current_text = ""
        terms_of_use_checkbox.checked = false
    }

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

    Column
    {
        id: inputs_column

        width: parent.width * 0.7
        anchors.top: block_separator.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: ViewsProperties.sizes.content_left_margin
        spacing: 20

        Row
        {
            height: 40
            spacing: 20

            Controls.ThemedTextInput
            {
                id: first_name_input

                width: 155
                height: 40
                placeholder_text: "First Name"
            }

            Controls.ThemedTextInput
            {
                id: last_name_input

                width: 155
                height: 40
                placeholder_text: "Last Name"
            }
        }

        Controls.ThemedComboBox
        {
            id: country_combo_box

            height: 40
            width: 330
            model: [ "blablabla", "olaolaola" ]
        }

        Controls.ThemedTextInput
        {
            id: email_input

            width: 330
            height: 40
            placeholder_text: "Email"
            text_input_validator: RegExpValidator
            {
                id: email_validator

                regExp: /(.+)@(.+){2,}\.(.+){2,}/
            }
            onInput_active_focusChanged:
            {
                if (!activeFocus)
                {
                    if (is_input_acceptable)
                    {
                        reset_warning()
                    }
                    else if (current_text.length !== 0)
                    {
                        show_warning()
                    }
                    else
                    {
                        reset_warning()
                    }
                }
            }
        }

        Controls.ThemedTextInput
        {
            id: password_input

            width: 330
            height: 40
            placeholder_text: "Password"
            input_echo_mode: TextInput.Password
        }

        Controls.ThemedCheckBox
        {
            id: terms_of_use_checkbox

            checked: false
            spacing: 10
            text: "I accept the Terms of Use"
            font
            {
                pixelSize: 15
                weight: Font.Thin
            }
        }

        Controls.ThemedButton
        {
            id: sign_up_button

            width: 140
            height: 40
            text: "Sign Up"
            enabled: first_name_input.current_text.length !== 0 &&
                     country_combo_box.currentIndex !== -1 &&
                     email_input.is_input_acceptable &&
                     password_input.current_text.length !== 0 &&
                     terms_of_use_checkbox.checked
            font
            {
                pixelSize: 17
                bold: true
            }

            onClicked:
            {
                popup.open()
            }
        }
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

    Popup
    {
        id: popup

        anchors.centerIn: parent
        width: 300
        height: 250
        leftInset: 11
        rightInset: 11
        bottomInset: 11
        topInset: 11
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape

        Rectangle
        {
            anchors.fill: parent
            color: Theme.background.default_color
        }

        Controls.ThemedButton
        {
            id: sign_up_again_button

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            width: 150
            height: 40
            text: "Sign Up Again"
            font
            {
                pixelSize: 17
                bold: true
            }

            onClicked:
            {
                root.reset_window()
                popup.close()
            }
        }
    }
}
