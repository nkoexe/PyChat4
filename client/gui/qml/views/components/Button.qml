import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root
    state: "base"
    focus: true
    activeFocusOnTab: true

    property string iconSrc: ""
    property int iconPadding: 0

    property color iconColor: "white"
    property color iconHoverColor: iconColor
    property color iconPressedColor: iconColor

    property color baseColor: "transparent"
    property int baseRotation: 0
    property int baseScale: 1

    property color hoverColor: baseColor
    property int hoverRotation: 0
    property int hoverScale: 1

    property color pressedColor: baseColor
    property int pressedRotation: 0
    property int pressedScale: 1

    property int animDuration: 0
    property int animEasing: Easing.Linear
    property int colorAnimDuration: 0

    function callback() {console.log(root, "button pressed!")}

    states: [
        State {
            name: "base"
            PropertyChanges {
                target: root
                color: baseColor
                rotation: baseRotation
                scale: baseScale
            }
            PropertyChanges {
                target: icon
                color: root.iconColor
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
            PropertyChanges {
                target: icon
                color: root.iconHoverColor
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
            PropertyChanges {
                target: icon
                color: root.iconPressedColor
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

    Keys.onReturnPressed: callback()

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

    Icon {
        id: icon
        source: root.iconSrc

        anchors {
            fill: root
            margins: root.iconPadding
        }
    }
}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
