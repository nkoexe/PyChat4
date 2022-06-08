import QtQuick

Item {
    id: root
    implicitHeight: 30
    implicitWidth: height + (text ? (height/2 + label.paintedWidth) : 0)
    focus: true
    activeFocusOnTab: true

    property bool checked: false
    property color uncheckedColor: "#303030"
    property color checkedColor: "#e3125f"
    property string text: "fdsmfiodsnfiudsnfudsnuofds"

    states: [
        State {
            name: "checked"
            when: root.checked

            PropertyChanges {
                target: recto
                color: checkedColor
                radius: recto.width / 2
            }
        },
        State {
            name: "unchecked"
            when: !root.checked

            PropertyChanges {
                target: recto
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "*"
            PropertyAnimation {
                properties: "radius"
                duration: 200
            }
            ColorAnimation {
                duration: 200
            }
        }
    ]

    TapHandler {
        onTapped: {
            root.checked = !root.checked
        }
    }

    Rectangle {
        id: recto
        x: root.height / 10
        y: x
        height: root.height - x*2
        width: root.height - x*2
        radius: x
        color: uncheckedColor

        Rectangle {
            id: inner
            color: uncheckedColor
            radius: width / 2
            anchors {
                fill: recto
                margins: recto.x * 2
            }
        }
    }

    Text {
        id: label
        text: root.text
        color: "#ffffff"
        font.pixelSize: root.height * 0.75
        anchors {
            left: recto.right
            leftMargin: root.height/2
            top: root.top
        }
    }

    Keys.onReturnPressed: {
        root.checked = !root.checked
    }
    Keys.onSpacePressed: {
        root.checked = !root.checked
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:3}
}
##^##*/
