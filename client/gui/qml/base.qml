import QtQuick

import "views/components"

/* TODO:
 * - remove resizing handles when window is maximized
 */


Window {
    id: win
    visible: true
    width: 1250
    height: 650
    title: "PyChat v4"
    flags: Qt.Window | Qt.FramelessWindowHint


    property int sizingHandleSize: 5


    function loadView (view) {
        mainView.source = 'views/' + view + '.qml'
    }


    Item {
        id: root
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

            Item {
                property int buttonWidth: 50

                id: titlebar_buttons
                width: buttonWidth * 3
                anchors.top: titlebar.top
                anchors.bottom: titlebar.bottom
                anchors.right: titlebar.right

                MyButton {
                    id: closeButton
                    baseColor: colors.titlebar_button_bg
                    hoverColor: colors.titlebar_close_hover
                    pressedColor: colors.titlebar_close_pressed
                    width: titlebar_buttons.buttonWidth
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                    }

                    function callback() {
                        win.close()
                    }
                }

                MyButton {
                    id: maximizeButton
                    baseColor: colors.titlebar_button_bg
                    hoverColor: colors.titlebar_maximize_hover
                    pressedColor: colors.titlebar_maximize_pressed
                    width: titlebar_buttons.buttonWidth
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: closeButton.left
                    }

                    property bool _isMaximized: false

                    function callback() {
                        if (_isMaximized) {
                            win.showNormal()
                        } else {
                            win.showMaximized()
                        }
                        _isMaximized = !_isMaximized
                    }
                }

                MyButton {
                    id: minimizeButton
                    baseColor: colors.titlebar_button_bg
                    hoverColor: colors.titlebar_minimize_hover
                    pressedColor: colors.titlebar_minimize_pressed
                    width: titlebar_buttons.buttonWidth
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
            anchors {
                left: root.left
                right: root.right
                top: titlebar.bottom
                bottom: root.bottom
            }
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
