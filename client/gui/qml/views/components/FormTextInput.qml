import QtQuick

Rectangle {
    id: root
    color: "#212121"
    border.width: 0

    property string placeholdertext
    property int _echoMode: TextInput.Normal

    TextInput {
        id: input
        color: "#ffffff"
        font.pixelSize: root.height - 20
        verticalAlignment: Text.AlignVCenter
        font.family: "Product Sans"
        selectionColor: "#e31f95"
        activeFocusOnTab: true
        focus: true
        selectByMouse: true
        anchors.fill: root
        anchors.margins: 10
        echoMode: _echoMode

        Text {
            text: placeholdertext
            color: "#aaa"
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
