import QtQuick

Rectangle {
    id: root
    state: "base"
    focus: true
    activeFocusOnTab: true

    property color baseColor
    property int baseRotation: 0
    property int baseScale: 1

    property color hoverColor
    property int hoverRotation: 0
    property int hoverScale: 1

    property color pressedColor
    property int pressedRotation: 0
    property int pressedScale: 1

    property int animDuration: 0
    property int animEasing: Easing.Linear
    property int colorAnimDuration: 0

    function callback() {console.log("button pressed!")}

    states: [
        State {
            name: "base"
            PropertyChanges {
                target: root
                color: baseColor
                rotation: baseRotation
                scale: baseScale
            }
        },
        State {
            id: hoveredState
            name: "hovered"
            PropertyChanges {
                target: root
                color: hoverColor
                rotation: hoverRotation
                scale: hoverScale
            }
        },
        State {
            name: "pressed"
            PropertyChanges {
                target: root
                color: pressedColor
                rotation: pressedRotation
                scale: pressedScale
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "*"
            PropertyAnimation { properties: "rotation,scale"; duration: animDuration; easing.type: animEasing }
            ColorAnimation { duration: colorAnimDuration }
        }
    ]

    onActiveFocusChanged: {
        if (activeFocus) {
            root.state = "hovered"
        } else {
            root.state = "base"
        }
    }

    MouseArea {
        id: mousearea
        anchors.fill: root
        hoverEnabled: true

        onEntered: {
            if (pressed) {
                root.state = "pressed"
            } else {
                root.state = "hovered"
            }
        }
        onExited: {
            root.state = "base"
        }
        onPressed: {
            root.state = "pressed"
        }
        onReleased: {
            if (root.state === "pressed") {
                root.callback()
            }
            root.state = "base"
        }
    }

    Text {
        color: "#ffffff"
        anchors.fill: root
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 10
        text: "·"
    }
}


