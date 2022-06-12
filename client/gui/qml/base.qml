import QtQuick
import "views/components"


Window {
    id: win
    visible: true
    width: 1250
    height: 650
    minimumWidth: 650
    minimumHeight: 450
    title: "PyChat v4"
    flags: Qt.Window | Qt.FramelessWindowHint

    property int sizingHandleSize: 5
    property bool isMaximized: false


    function loadView (view) {
        mainView.setSource('views/' + view + '.qml')
    }


    Item {
        id: root
        focus: true
        anchors.fill: parent

        Rectangle {
            id: titlebar
            color: colors.titlebar_bg
            border.width: 0
            height: 30
            anchors.left: root.left
            anchors.right: root.right

            Rectangle {
                property int padding: 3

                id: titlebar_icon
                color: colors.titlebar_icon
                x: padding
                y: padding
                width: titlebar.height - padding * 2
                height: titlebar.height - padding * 2
            }

            Text {
                id: windowtitle
                text: "PyChat v4"
                font.family: "Product Sans"
                font.pointSize: 10
                color: colors.titlebar_text
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: titlebar_icon.right
                anchors.leftMargin: 10
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
                    win.isMaximized = false
                }
            }

            Item {
                id: titlebar_buttons
                anchors.top: titlebar.top
                anchors.bottom: titlebar.bottom
                anchors.right: titlebar.right

                Button {
                    id: closeButton
                    iconSrc: "close"
                    iconPadding: 8
                    iconColor: colors.titlebar_icon
                    baseColor: colors.titlebar_button_bg
                    hoverColor: colors.titlebar_close_hover
                    pressedColor: colors.titlebar_close_pressed
                    width: 50
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                    }

                    function callback() {
                        win.close()
                    }
                }

                Button {
                    id: maximizeButton
                    iconSrc: "maximize"
                    iconPadding: 8
                    iconColor: colors.titlebar_icon
                    baseColor: colors.titlebar_button_bg
                    hoverColor: colors.titlebar_maximize_hover
                    pressedColor: colors.titlebar_maximize_pressed
                    width: 50
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: closeButton.left
                    }

                    function callback() {
                        if (win.isMaximized) {
                            win.showNormal()
                        } else {
                            win.showMaximized()
                        }
                        win.isMaximized = !win.isMaximized
                    }
                }

                Button {
                    id: minimizeButton
                    iconSrc: "minimize"
                    iconPadding: 8
                    iconColor: colors.titlebar_icon
                    baseColor: colors.titlebar_button_bg
                    hoverColor: colors.titlebar_minimize_hover
                    pressedColor: colors.titlebar_minimize_pressed
                    width: 50
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: maximizeButton.left
                    }

                    function callback() {
                        win.showMinimized()
                    }
                }
            }
        }

        Loader {
            id: mainView
            clip: true
            anchors {
                left: root.left
                right: root.right
                top: titlebar.bottom
                bottom: root.bottom
            }

        }


        MouseArea {
            id : res_topleft
            visible: !win.isMaximized
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
            visible: !win.isMaximized
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
            visible: !win.isMaximized
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
            visible: !win.isMaximized
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
            visible: !win.isMaximized
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
            visible: !win.isMaximized
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
            visible: !win.isMaximized
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
            visible: !win.isMaximized
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


