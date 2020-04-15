import QtQuick 2.12
import QtQuick.Controls 2.12

ComboBox
{
    id: root

    property string placeholder_text: "Select your country"

    property int indicator_width: 6
    property int indicator_height: 7
    property int indicator_right_margin: 6
    property int indicator_animation_duration: 250
    property color indicator_color: "#000000"

    property int background_radius: 3
    property color background_color: "#F3F3F3"
    property color background_border_default_color: "transparent"
    property color background_border_warning_color: "#FF0000"

    property real placeholder_color_opacity: 0.9
    property color text_placeholder_color: "gray"
    property color text_selection_color: "#000000"

    property int text_left_margin: 15
    property int font_size: 15
    property int popup_margin: 5
    property color popup_border_color: "#CBCBCB"
    property color popup_highlight_color: "#FFFFFF"

    property int inform_duration: 2000
    property int blink_duration: 200

    property bool is_initialized: false

    function show_warning()
    {
        background_rect.border.color = root.background_border_warning_color
    }

    function reset_warning()
    {
        background_rect.border.color = root.background_border_default_color
    }

    function inform_user()
    {
        blink_timer.start()
        inform_user_timer.start()
    }

    Timer
    {
        id: inform_user_timer

        interval: root.inform_duration
        running: false
        repeat: false
        onTriggered:
        {
            blink_timer.stop()
            root.reset_warning()
        }
    }

    Timer
    {
        id: blink_timer

        repeat: true
        interval: root.blink_duration
        onTriggered:
        {
            if (background.border.color === root.background_border_warning_color)
            {
                root.reset_warning()
            }
            else
            {
                root.show_warning()
            }
        }
    }

    Component.onCompleted:
    {
        currentIndex = -1
        root.is_initialized = true
    }

    background: Rectangle
    {
        id: background_rect
        anchors.fill: parent

        color: background_color
        radius: root.background_radius
        border.color: root.background_border_default_color
        border.width: 1
    }

    contentItem: Text
    {
        id: content_item

        text: root.currentIndex === -1 ? root.placeholder_text : root.displayText
        font.pixelSize: root.font_size
        color: root.currentIndex === -1 ? root.text_placeholder_color : root.text_selection_color
        opacity: root.currentIndex === -1 ? root.placeholder_color_opacity : 1
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        leftPadding: root.text_left_margin
    }

    indicator: Canvas
    {
        id: canvas

        x: root.width - width - root.indicator_right_margin
        y: (root.availableHeight - height) / 2
        width: root.indicator_width
        height: root.indicator_height
        contextType: "2d"

        Connections
        {
            target: root
            onPressedChanged: canvas.requestPaint()
        }

        onPaint:
        {
            if (!context)
            {
                return
            }
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = root.indicator_color
            context.fill();
        }

        rotation: root.down ? 180 : 0
        Behavior on rotation
        {
            NumberAnimation
            {
                duration: root.indicator_animation_duration
            }
        }
    }

    delegate: ItemDelegate
    {
        width: root.width
        height: root.height
        highlighted: root.highlightedIndex === index

        background: Item
        {
            anchors
            {
                fill: parent
                margins: 1
            }

            Rectangle
            {
                id: round_rect
                anchors.fill: parent
                radius: root.background_radius
                color: root.highlightedIndex === index ? root.popup_highlight_color : root.background_color
            }

            Rectangle
            {
                color: round_rect.color
                anchors
                {
                    fill: parent
                    topMargin: index === 0 ? root.background_radius : 0
                    bottomMargin: index === root.count - 1 ? root.background_radius : 0
                }
            }
        }

        contentItem: Text
        {
            font.pixelSize: root.font_size
            text: modelData
            color: root.text_selection_color
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
    }

    popup: Popup
    {
        y: root.height + root.popup_margin
        width: root.width
        padding: 0
        implicitHeight: contentItem.implicitHeight

        contentItem: ListView
        {
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            implicitHeight: contentHeight
            model: root.down ? root.delegateModel : null
            currentIndex: root.highlightedIndex
            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle
        {
            anchors.fill: parent

            color: root.background_color
            radius: root.background_radius
            border.width: 1
            border.color: root.popup_border_color
        }
    }
}
