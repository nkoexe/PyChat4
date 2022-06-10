import QtQuick

Rectangle {
    id: root
    color: colors.background2
    border.width: 0

    Rectangle {color: colors.background1
        radius: 20
        anchors {top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.horizontalCenter
            margins: 20}
        TapHandler {onTapped: backend.loadView("login")}}
    Rectangle {color: colors.background1
        radius: 20
        anchors {top: parent.top
            bottom: parent.verticalCenter
            left: parent.horizontalCenter
            right: parent.right
            margins: 20}
        TapHandler {onTapped: backend._temp_nextTheme()}}
    Rectangle {color: colors.background1
        radius: 20
        anchors {top: parent.verticalCenter
            bottom: parent.bottom
            left: parent.horizontalCenter
            right: parent.right
            margins: 20}
    TapHandler {onTapped: backend.loadView("test")}}

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.5;height:480;width:800}
}
##^##*/
