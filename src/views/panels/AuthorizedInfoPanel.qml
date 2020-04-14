import QtQuick 2.12
import QtQuick.Controls 2.12

import SignUpForm.View 1.0

import "qrc:/views/controls" as Controls

Rectangle
{
    id: root

    property string first_name
    property string last_name
    property string country
    property string email
    property string password

    signal requestReset()

    anchors.fill: parent
    color: Theme.background.default_color

    Column
    {
        id: popup_content_column

        anchors.top: parent.top
        anchors.topMargin: ViewsProperties.sizes.popup_content_margin
        anchors.horizontalCenter: parent.horizontalCenter
        width: ViewsProperties.sizes.popup_content_width
        spacing: ViewsProperties.sizes.default_spacing
        clip: true

        Text
        {
            id: account_info

            font.pixelSize: ViewsProperties.sizes.authorized_info_font
            color: Theme.fonts.default_color
            textFormat: Text.RichText
            text: "First Name: " + root.first_name +
                  "<br>Last Name: " + root.last_name +
                  "<br>Country: " + root.country +
                  "<br>Email: " + root.email
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Row
        {
            id: secured_row

            spacing: 0
            height: ViewsProperties.sizes.authorized_info_height

            Text
            {
                id: password_label

                font.pixelSize: ViewsProperties.sizes.authorized_info_font
                color: Theme.fonts.default_color
                text: "Password: "
                verticalAlignment: Text.AlignVCenter
            }

            TextInput
            {
                id: password_output

                echoMode: TextInput.Password
                font.pixelSize: ViewsProperties.sizes.authorized_info_font
                color: Theme.fonts.default_color
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                width: ViewsProperties.sizes.password_output_width
                text: root.password
            }

            Controls.ThemedButton
            {
                id: show_password_button

                anchors.verticalCenter: parent.verticalCenter
                width: ViewsProperties.sizes.show_pass_button_width
                height: ViewsProperties.sizes.authorized_info_height
                text: password_output.echoMode === TextInput.Password ? "Show" : "Hide"
                font
                {
                    pixelSize: ViewsProperties.sizes.authorized_info_font
                    bold: true
                }

                onClicked:
                {
                    if (password_output.echoMode === TextInput.Password)
                    {
                        password_output.echoMode = TextInput.Normal
                    }
                    else
                    {
                        password_output.echoMode = TextInput.Password
                    }
                }
            }
        }
    }

    Controls.ThemedButton
    {
        id: sign_up_again_button

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: ViewsProperties.sizes.popup_content_margin
        width: ViewsProperties.sizes.sign_up_again_button_width
        height: ViewsProperties.sizes.default_input_height
        text: "Sign Up Again"
        font
        {
            pixelSize: ViewsProperties.sizes.button_font
            bold: true
        }

        onClicked:
        {
            root.requestReset()
        }
    }
}
