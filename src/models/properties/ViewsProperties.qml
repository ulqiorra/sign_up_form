pragma Singleton

import QtQuick 2.12
import QtQuick.Window 2.2

Item
{
    id: root

    property alias sizes: sizes
    property alias durations: durations
    property alias ratios: ratios
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

        property int default_spacing: points(10)
        property int inputs_spacing: points(20)
        property int default_margin: points(10)
        property int inputs_margin: points(20)
        property int default_input_height: points(40)

        property int default_window_height: points(550)
        property int default_window_width: points(400)
        property int min_window_width: points(356)

        property int switch_button_height: points(25)
        property int switch_button_width: points(45)
        property int sign_up_button_width: points(140)

        property int content_left_margin: points(35)
        property int content_top_margin: points(25)

        property int popup_width: points(300)
        property int popup_height: points(250)
        property int popup_content_width: points(200)
        property int popup_inset: points(11)
        property int popup_content_margin: points(20)
        property int authorized_info_height: points(20)

        property int header_label_font: font_points(30)
        property int header_tip_font: font_points(15)
        property int header_separator_margin: points(105)

        property int terms_of_use_font: font_points(15)
        property int button_font: font_points(17)
        property int authorized_info_font: font_points(14)

        property int password_output_width: points(80)
        property int show_pass_button_width: points(55)
        property int sign_up_again_button_width: points(150)
    }

    Item
    {
        id: durations

        property int default_animation: 250
        property int inform_timer: 2000
        property int blink_timer: 200
    }

    Item
    {
        id: ratios

        property real content_column: 0.7
        property real default_content_width: 0.825
        property real small_content_width: 0.3875
        property real header_tip_font_opacity: 0.6
        property real header_separator_opacity: 0.5
        property real adaptive_spacing: 0.05
    }
}
