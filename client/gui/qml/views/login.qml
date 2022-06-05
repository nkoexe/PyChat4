import QtQuick

Rectangle {
    id: main
    color: colors.background2

    Rectangle {color: colors.background3
        width: parent.width / 3
        height: parent.height / 12
        anchors.centerIn: parent
        MouseArea {anchors.fill: parent
            onReleased: backend.loadView("main")}}

}
