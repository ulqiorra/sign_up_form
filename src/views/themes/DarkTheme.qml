import QtQuick 2.12
import QtQuick.Window 2.12

Item
{
    id: root

    property alias background: background
    property alias fonts: fonts

    Item
    {
        id: background

        property color default_color: "#20273F"
    }

    Item
    {
        id: fonts

        property color default_color: "#FFFFFF"
    }
}
