import QtQuick
import QtQuick.Window

Window {
    id: win
    visible: true
    color: "#00000000"
    width: 1250
    height: 650
    title: "PyChat v4"
    flags: Qt.Window | Qt.FramelessWindowHint


    property int sizingHandleSize: 10


    Rectangle {
        id: root
        anchors.fill: parent

        Rectangle {
            id: titlebar
            color: "#191919"
            border.width: 0
            height: 30
            anchors.left: root.left
            anchors.right: root.right

            Rectangle {
                id: titlebar_icon
                color: "#262626"
                x: padding
                y: padding
                width: titlebar.height - padding * 2
                height: titlebar.height - padding * 2

                property int padding: 3
            }

            MouseArea {
                id: titlebar_mousearea
                anchors.top: titlebar.top
                anchors.bottom: titlebar.bottom
                anchors.left: titlebar_icon.right
                anchors.right: titlebar_buttons.left

                acceptedButtons: Qt.LeftButton
                pressAndHoldInterval: 10
                onPressAndHold: {
                    win.startSystemMove()
                }
            }

            Rectangle {
                id: titlebar_buttons
                color: "#00000000"
                width: 200
                anchors.top: titlebar.top
                anchors.bottom: titlebar.bottom
                anchors.right: titlebar.right
            }
        }

        Rectangle {
            id: main
            color: "#282828"
            border.width: 0
            anchors.left: root.left
            anchors.right: root.right
            anchors.top: titlebar.bottom
            anchors.bottom: root.bottom
        }


        MouseArea {
            id : res_topleft
            width: sizingHandleSize
            height: sizingHandleSize

            cursorShape: Qt.SizeFDiagCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 30
            onPressAndHold: {
                win.startSystemResize(Qt.TopEdge | Qt.LeftEdge)
            }
        }

        MouseArea {
            id : res_left
            width: sizingHandleSize
            height: root.height - sizingHandleSize * 2
            anchors.top: root.top
            anchors.topMargin: sizingHandleSize

            cursorShape: Qt.SizeHorCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 30
            onPressAndHold: {
                win.startSystemResize(Qt.LeftEdge)
            }
        }

        MouseArea {
            id : res_botleft
            width: sizingHandleSize
            height: sizingHandleSize
            anchors.bottom: root.bottom
            anchors.left: root.left

            cursorShape: Qt.SizeBDiagCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 30
            onPressAndHold: {
                win.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)
            }
        }

        MouseArea {
            id : res_bot
            width: root.width - sizingHandleSize * 2
            height: sizingHandleSize
            anchors.bottom: root.bottom
            anchors.left: root.left
            anchors.leftMargin: sizingHandleSize

            cursorShape: Qt.SizeVerCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 30
            onPressAndHold: {
                win.startSystemResize(Qt.BottomEdge)
            }
        }

        MouseArea {
            id : res_botright
            width: sizingHandleSize
            height: sizingHandleSize
            anchors.bottom: root.bottom
            anchors.right: root.right

            cursorShape: Qt.SizeFDiagCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 30
            onPressAndHold: {
                win.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
            }
        }

        MouseArea {
            id : res_right
            width: sizingHandleSize
            height: root.height - sizingHandleSize * 2
            anchors.top: root.top
            anchors.topMargin: sizingHandleSize
            anchors.right: root.right

            cursorShape: Qt.SizeHorCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 30
            onPressAndHold: {
                win.startSystemResize(Qt.RightEdge)
            }
        }

        MouseArea {
            id : res_topright
            width: sizingHandleSize
            height: sizingHandleSize
            anchors.right: root.right

            cursorShape: Qt.SizeBDiagCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 30
            onPressAndHold: {
                win.startSystemResize(Qt.TopEdge | Qt.RightEdge)
            }
        }

        MouseArea {
            id : res_top
            width: root.width - sizingHandleSize * 2
            height: sizingHandleSize
            anchors.left: root.left
            anchors.leftMargin: sizingHandleSize

            cursorShape: Qt.SizeVerCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 30
            onPressAndHold: {
                win.startSystemResize(Qt.TopEdge)
            }
        }

    }

}
