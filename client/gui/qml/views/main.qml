import QtQuick

Rectangle {
    id: main
    color: colors.background2
    border.width: 0

    //  TESTIG :D
    Rectangle {color: colors.background1
        radius: 20
        anchors {top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.horizontalCenter
            margins: 20}
        MouseArea {anchors.fill: parent
            onReleased: {backend.loadView("login")}}}
    Rectangle {color: colors.background1
        radius: 20
        anchors {top: parent.top
            bottom: parent.verticalCenter
            left: parent.horizontalCenter
            right: parent.right
            margins: 20}}
    Rectangle {color: colors.background1
        radius: 20
        anchors {top: parent.verticalCenter
            bottom: parent.bottom
            left: parent.horizontalCenter
            right: parent.right
            margins: 20}}

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.5;height:480;width:800}
}
##^##*/
