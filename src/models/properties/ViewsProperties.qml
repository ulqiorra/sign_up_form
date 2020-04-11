pragma Singleton

import QtQuick 2.10
import QtQuick.Window 2.2

//import SignUpForm.Model 1.0

Item
{
    id: root

    property alias sizes: sizes
    property real scale: Screen.width / 1920
    property real fontScale: Screen.width / 1920
    property real windowScale: Screen.width / 1920


    Component.onCompleted:
    {
        var refPpmm = 3.622;
        var refWidth = 1920
        var refHeight = 1080
        var refLogicalDotsPerInch = 3.78
        var maxDpiScale = 1.35
        var height = Math.min(Screen.width, Screen.height)
        var width = Math.max(Screen.width, Screen.height)

        root.windowScale = Math.min(height / refHeight, width / refWidth)

        var dpiScale = Screen.pixelDensity / refPpmm;
        var clampedDpiScale = Math.max(Math.min(dpiScale, maxDpiScale), 1)
        var dpiScaleRest = dpiScale / clampedDpiScale

        root.scale = root.windowScale * clampedDpiScale
        root.fontScale = refLogicalDotsPerInch / Screen.logicalPixelDensity
    }

    function points(px)
    {
        return px * root.scale
    }

    function font_points(px)
    {
        return px * root.fontScale
    }

    Item
    {
        id: sizes
//        property alias input_form: text_input_form

        property int default_spacing: points(15)
        property int default_margin: points(20)
        property int default_border_radius: points(5)
        property int default_padding: points(10)
    }
}
