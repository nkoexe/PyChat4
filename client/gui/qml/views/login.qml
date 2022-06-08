import QtQuick
import Qt5Compat.GraphicalEffects
import "components"

Rectangle {
    id: main
    color: "#191919"
    border.width: 0

    RadialGradient {
        id: bg_grad
        height: main.height * 2
        width: height
        x: main.width - height/2
        y: 0
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#4bf52974" }
            GradientStop { position: 0.5; color: "transparent" }
        }
    }

    Rectangle {
        id: bg_rect1
        x: main.width * 0.8
        y: main.height * 0.35
        width: 40
        height: 40
        color: "#aeed4fbb"
        radius: 10

        NumberAnimation on rotation {
            id: bg_rect1_anim1
            from: 1
            to: 90
            loops: Animation.Infinite
            duration: 2000
        }

        NumberAnimation on rotation {
            id: bg_rect1_anim2
            to: 360
            duration: 700
            easing.type: Easing.OutCirc

            onFinished: {
                bg_rect1_anim1.start()
            }
        }

        MouseArea {
            anchors.fill: bg_rect1
            hoverEnabled: true
            onEntered: {
                bg_rect1_anim1.stop()
                bg_rect1_anim2.start()
            }
        }
    }

    Rectangle {
        id: bg_rect2
        x: main.width * 0.85
        y: main.height * 0.5
        width: 50
        height: 50
        color: "#aeed4fbb"
        radius: 10

        NumberAnimation on rotation {
            id: bg_rect2_anim1
            from: 1
            to: 90
            loops: Animation.Infinite
            duration: 2000
        }

        NumberAnimation on rotation {
            id: bg_rect2_anim2
            to: 360
            duration: 700
            easing.type: Easing.OutCirc

            onFinished: {
                bg_rect2_anim1.start()
            }
        }

        MouseArea {
            anchors.fill: bg_rect2
            hoverEnabled: true
            onEntered: {
                bg_rect2_anim1.stop()
                bg_rect2_anim2.start()
            }
        }
    }

    Rectangle {
        id: form
        width: 385
        height: 320
        color: "#1b1b1b"
        radius: 20
        anchors {
            verticalCenter: main.verticalCenter
            left: main.left
            leftMargin: (main.width - width) / 4
        }

        Text {
            id: formtitle
            color: "#ffffff"
            text: "Login"
            font.bold: true
            font.family: "Product Sans"
            font.pointSize: 22
            anchors {
                left: form.left
                top: form.top
                leftMargin: 30
                topMargin: 30
            }
        }

        FormTextInput {
            id: username
            placeholdertext: "username"
            height: 40
            anchors {
                left: form.left
                right: form.right
                top: formtitle.bottom
                topMargin: 30
                rightMargin: 30
                leftMargin: 30
            }
        }

        FormTextInput {
            id: password
            placeholdertext: "password"
            _echoMode: TextInput.Password
            height: 40
            anchors {
                left: form.left
                right: form.right
                top: username.bottom
                topMargin: 20
                rightMargin: 30
                leftMargin: 30
            }
        }

        CheckBox {
            id: rememberme
            height: 20
            checked: true
            text: "Remember Me"

            anchors {
                left: form.left
                top: password.bottom
                topMargin: 20
                leftMargin: 40
            }
        }

        MyButton {
            id: submit
            width: 70
            height: 70
            radius: 20
            anchors {
                right: form.right
                top: password.bottom
                topMargin: 20
                rightMargin: 25
            }

            baseColor: "#75db64"
            hoverColor: "#75db64"
            hoverRotation: 45
            pressedColor: "#58a45b"
            pressedRotation: 45
            animDuration: 300
            animEasing: Easing.OutBack
        }
    }

    DropShadow {
        anchors.fill: form
        source: form
        transparentBorder: true
        radius: 10
        spread: 0.1
        color: "#363636"
    }

    SequentialAnimation {
        id: startanim
        PauseAnimation {
            duration: 500
        }

        ParallelAnimation {
            NumberAnimation {
                target: bg_grad
                property: "y"
                from: main.height
                to: 0
                duration: 3000
                easing.type: Easing.OutExpo
            }

            NumberAnimation {
                target: bg_rect1
                property: "y"
                from: main.height
                to: main.height * 0.35
                duration: 1400
                easing.type: Easing.OutExpo
            }
            NumberAnimation {
                target: bg_rect2
                property: "y"
                from: main.height
                to: main.height * 0.5
                duration: 1400
                easing.type: Easing.OutExpo
            }
        }
    }

    Component.onCompleted: {
        bg_rect1_anim2.start()
        startanim.start()
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:900}
}
##^##*/
