import QtQuick

Rectangle {
    property color baseColor
    property color hoverColor
    property color pressedColor

    id: root
    color: baseColor

    function callback() {
        console.log("button pressed!")
    }

    MouseArea {
        anchors.fill: root
        hoverEnabled: true

        onEntered: {
            if (pressed) {
                root.color = pressedColor
            } else {
                root.color = hoverColor
            }
        }
        onExited: {
            root.color = baseColor
        }
        onPressed: {
            root.color = pressedColor
        }
        onReleased: {
            root.color = baseColor
            root.callback()
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
