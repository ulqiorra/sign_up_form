import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import SignUpForm.View 1.0

Window
{
    id: root

    visible: true
    width: ViewsProperties.sizes.default_window_width
    height: ViewsProperties.sizes.default_window_height
    color: Theme.background.default_color

    Button
    {
        anchors.centerIn: parent
        width: 50
        height: 50

        onClicked:
        {
            if (ThemeController.theme_name === "light")
            {
                ThemeController.change_theme("dark")
            }
            else
            {
                ThemeController.change_theme("light")
            }
        }
    }
}
