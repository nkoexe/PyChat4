import QtQuick
import "../scripts/colorfunctions.js" as ColorFunctions

Rectangle {
    id: root
    border.width: 0
    clip: true

    property string placeholdertext
    property int echoMode: TextInput.Normal
    property color textColor
    property color selectionColor: colors.accent2

    property string text: input.text

    function callback() {}

    TapHandler { onTapped: input.forceActiveFocus() }

    TextInput {
        id: input
        color: root.textColor
        font.pixelSize: root.height - 20
        verticalAlignment: Text.AlignVCenter
        font.family: "Product Sans"
        selectionColor: root.selectionColor
        activeFocusOnTab: true
        focus: true
        selectByMouse: true
        anchors.fill: root
        anchors.margins: 10
        echoMode: root.echoMode

        onAccepted: root.callback()

        Text {
            text: placeholdertext
            color: ColorFunctions.transparency(root.textColor, 0.6)
            font.pixelSize: root.height - 20
            verticalAlignment: Text.AlignVCenter
            font.family: "Product Sans"
            visible: !input.text
            anchors.fill: input
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:4;height:100;width:300}
}
##^##*/
