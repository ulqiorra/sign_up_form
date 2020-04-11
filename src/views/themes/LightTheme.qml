import QtQuick 2.12
import QtQuick.Window 2.12

Item
{
    id: root

    property alias background: background

    Item
    {
        id: background

        property color default_color: "gray"
    }
}
