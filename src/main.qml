import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import SignUpForm.View 1.0

import "qrc:/views/panels" as Panels

Window
{
    id: root

    visible: true
    width: ViewsProperties.sizes.default_window_width
    minimumWidth: ViewsProperties.sizes.min_window_width
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

    Panels.SignUpPanel
    {
        id: sign_up_panel

        onRequestPopup: popup.open()
    }

    Popup
    {
        id: popup

        anchors.centerIn: parent
        width: ViewsProperties.sizes.popup_width
        height: ViewsProperties.sizes.popup_height
        topInset: ViewsProperties.sizes.popup_inset
        leftInset: popup.topInset
        rightInset: popup.topInset
        bottomInset: popup.topInset
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape

        Panels.AuthorizedInfoPanel
        {
            id: authorized_panel

            onRequestReset:
            {
                sign_up_panel.reset_sign_up_panel()
                popup.close()
            }
        }
    }
}
