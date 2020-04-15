import QtQuick 2.12
import QtQuick.Controls 2.12

import SignUpForm.View 1.0

import "qrc:/views/controls" as Controls

Item
{
    id: root

    property int input_height: ViewsProperties.sizes.default_input_height
    property real content_width_ratio: ViewsProperties.ratios.default_content_width
    property real small_content_width_ratio: ViewsProperties.ratios.small_content_width

    signal requestPopup()

    anchors.fill: parent

    function reset_sign_up_panel()
    {
        first_name_input.current_text = ""
        last_name_input.current_text = ""
        country_combo_box.currentIndex = -1
        email_input.current_text = ""
        password_input.current_text = ""
        terms_of_use_checkbox.checked = false
    }

    function highlight_necessary_fields()
    {
        if (first_name_input.current_text.length === 0)
        {
            first_name_input.inform_user()
        }
        if (country_combo_box.currentIndex === -1)
        {
            country_combo_box.inform_user()
        }
        if (email_input.current_text.length === 0)
        {
            email_input.inform_user()
        }
        if (password_input.current_text.length === 0)
        {
            password_input.inform_user()
        }
        if (!terms_of_use_checkbox.checked)
        {
            terms_of_use_checkbox.inform_user()
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

    Column
    {
        id: labels_column

        width: parent.width * ViewsProperties.ratios.content_column
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
                pixelSize: ViewsProperties.sizes.header_label_font
                weight: Font.Black
            }
            color: Theme.fonts.default_color
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Text
        {
            id: fill_form_label

            width: root.width * root.content_width_ratio
            wrapMode: Text.Wrap
            maximumLineCount: 1
            text: "Please fill in this form to create an account!"
            font
            {
                pixelSize: ViewsProperties.sizes.header_tip_font
                weight: Font.Thin
            }
            color: "gray"
            opacity: ViewsProperties.ratios.header_tip_font_opacity
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle
    {
        id: header_separator

        anchors.top: parent.top
        anchors.topMargin: ViewsProperties.sizes.header_separator_margin
        width: parent.width
        height: 1
        opacity: ViewsProperties.ratios.header_separator_opacity
        color: "gray"
    }

    Column
    {
        id: inputs_column

        width: parent.width * ViewsProperties.ratios.content_column
        anchors.top: header_separator.bottom
        anchors.topMargin: ViewsProperties.sizes.inputs_margin
        anchors.left: parent.left
        anchors.leftMargin: ViewsProperties.sizes.content_left_margin
        spacing: ViewsProperties.sizes.inputs_spacing

        Grid
        {
            height: root.width >= ViewsProperties.sizes.default_window_width
                    ? root.input_height
                    : (root.input_height * 2 + inputs_column.spacing)
            spacing: root.width >= ViewsProperties.sizes.default_window_width
                     ? root.width * ViewsProperties.ratios.adaptive_spacing
                     : inputs_column.spacing
            columns: root.width >= ViewsProperties.sizes.default_window_width
                     ? 2
                     : 1

            Controls.ThemedTextInput
            {
                id: first_name_input

                width: root.width >= ViewsProperties.sizes.default_window_width
                       ? root.width * root.small_content_width_ratio
                       : root.width * root.content_width_ratio
                height: root.input_height
                placeholder_text: "First Name"
                onEditFinished: root.highlight_necessary_fields()
            }

            Controls.ThemedTextInput
            {
                id: last_name_input

                width: root.width >= ViewsProperties.sizes.default_window_width
                       ? root.width * root.small_content_width_ratio
                       : root.width * root.content_width_ratio
                height: root.input_height
                placeholder_text: "Last Name"
                onEditFinished: root.highlight_necessary_fields()
            }
        }

        Controls.ThemedComboBox
        {
            id: country_combo_box

            height: root.input_height
            width: root.width * root.content_width_ratio
            model: ApplicationController.settings_controller.countries
            onCurrentIndexChanged:
            {
                if (is_initialized)
                {
                    root.highlight_necessary_fields()
                }
            }
        }

        Controls.ThemedTextInput
        {
            id: email_input

            width: root.width * root.content_width_ratio
            height: root.input_height
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
            onEditFinished: root.highlight_necessary_fields()
        }

        Controls.ThemedTextInput
        {
            id: password_input

            width: root.width * root.content_width_ratio
            height: root.input_height
            placeholder_text: "Password"
            input_echo_mode: TextInput.Password
            onEditFinished: root.highlight_necessary_fields()
        }

        Controls.ThemedCheckBox
        {
            id: terms_of_use_checkbox

            checked: false
            spacing: ViewsProperties.sizes.default_spacing
            text: "I accept the Terms of Use"
            font
            {
                pixelSize: ViewsProperties.sizes.terms_of_use_font
                weight: Font.Thin
            }
            onCheckedChanged: root.highlight_necessary_fields()
        }

        Controls.ThemedButton
        {
            id: sign_up_button

            width: ViewsProperties.sizes.sign_up_button_width
            height: root.input_height
            text: "Sign Up"
            enabled: first_name_input.current_text.length !== 0 &&
                     country_combo_box.currentIndex !== -1 &&
                     email_input.is_input_acceptable &&
                     password_input.current_text.length !== 0 &&
                     terms_of_use_checkbox.checked
            font
            {
                pixelSize: ViewsProperties.sizes.button_font
                bold: true
            }

            onClicked:
            {
                ApplicationController.account_controller.sign_up(first_name_input.current_text, last_name_input.current_text,
                                                                 country_combo_box.currentText, email_input.current_text,
                                                                 password_input.current_text)
                root.requestPopup()
            }
        }
    }
}
