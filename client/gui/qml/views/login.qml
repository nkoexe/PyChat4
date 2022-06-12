import QtQuick
import Qt5Compat.GraphicalEffects
import "components"
import "scripts/colorfunctions.js" as ColorFunctions

Rectangle {
    id: root
    color: colors.background2
    border.width: 0

    function submitLogin () {
        console.log(username.text, password.text, rememberme.checked)
    }

    // back button
    Button {
        width: 50
        height: 50
        iconSrc: "return"
        iconPadding: 10
        iconColor: colors.text3

        function callback() {
            backend.loadView("test")
        }

    }

    /*  ~~~~~  BACKGROUND  ~~~~~  */

    RadialGradient {
        id: bg_grad
        visible: false  // not visible until start animation
        height: root.height * 2
        width: height
        x: root.width - height/2
        y: 0
        gradient: Gradient {
            GradientStop { position: 0.0; color: ColorFunctions.transparency(colors.accent1, 0.35) }
            GradientStop { position: 0.5; color: "transparent" }
        }
    }

    Rectangle {
        id: bg_rect1
        visible: false
        x: root.width * 0.8
        y: root.height * 0.35
        width: 10 + root.height / 20
        height: width
        color: ColorFunctions.transparency(colors.accent1, 0.7)
        radius: 10

        NumberAnimation on rotation {
            id: bg_rect1_anim1
            running: false
            from: 1
            to: 90
            loops: Animation.Infinite
            duration: 2000
        }

        NumberAnimation on rotation {
            id: bg_rect1_anim2
            running: false
            to: 360
            duration: 650
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
        visible: false
        x: root.width * 0.85
        y: root.height * 0.5
        width: 10 + root.height / 15
        height: width
        color: ColorFunctions.transparency(colors.accent1, 0.7)
        radius: 10

        NumberAnimation on rotation {
            id: bg_rect2_anim1
            running: false
            from: 46  // rotated 45deg
            to: 135
            loops: Animation.Infinite
            duration: 2000
        }

        NumberAnimation on rotation {
            id: bg_rect2_anim2
            running: false
            to: 315
            duration: 600
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


    /*  ~~~~~  FORM  ~~~~~  */

    Rectangle {
        id: form
        width: 370 + root.width / 12
        height: 300 + root.height / 20  // 320
        color: colors.background2
        radius: 20
        anchors {
            verticalCenter: root.verticalCenter
            left: root.left
            leftMargin: (root.width - width) / 4
        }

        Text {
            id: formtitle
            color: colors.text1
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
            height: 40
            placeholdertext: "username"
            color: colors.background1
            textColor: colors.text1
            anchors {
                left: form.left
                right: form.right
                top: formtitle.bottom
                topMargin: 15 + root.height / 40
                rightMargin: 30
                leftMargin: 30
            }

            function callback () {
                password.forceActiveFocus()
            }
        }

        FormTextInput {
            id: password
            height: 40
            placeholdertext: "password"
            color: colors.background1
            textColor: colors.text1
            echoMode: TextInput.Password
            anchors {
                left: form.left
                right: form.right
                top: username.bottom
                topMargin: 20
                rightMargin: 30
                leftMargin: 30
            }

            function callback () {
                root.submitLogin()
            }
        }

        CheckBox {
            id: rememberme
            height: 20
            checked: true
            text: "Remember Me"
            textColor: colors.text2
            uncheckedColor: colors.background3
            checkedColor: colors.accent1

            anchors {
                left: form.left
                top: password.bottom
                topMargin: 20
                leftMargin: 40
            }
        }

        Button {
            id: submit
            width: 70
            height: 70
            radius: 20
            anchors {
                right: form.right
                bottom: form.bottom
                rightMargin: 25
                bottomMargin: 25
            }

            baseColor: colors.accent2
            hoverColor: colors.accent2
            hoverRotation: 45
            pressedColor: Qt.darker(colors.accent2, 1.2)
            pressedRotation: 45
            animDuration: 300
            animEasing: Easing.OutBack
        }

        Icon {
            source: "rightarrow"
            color: colors.background3

            anchors {
                fill: submit
                margins: 10
            }
        }
    }

    DropShadow {
        anchors.fill: form
        source: form
        transparentBorder: true
        radius: 10
        spread: 0.1
        color: colors.background1
    }


    /*  ~~~~~  ANIMATIONS  ~~~~~  */

    Timer {
        id: starttimer
        interval: 500

        onTriggered: {
            startanim.start()
            bg_rect1_anim2.start()
            bg_rect2_anim2.start()

            bg_grad.visible = true
            bg_rect1.visible = true
            bg_rect2.visible = true
        }
    }

    ParallelAnimation {
        id: startanim

        PropertyAnimation {
            target: bg_grad
            property: "y"
            from: root.height
            to: 0
            duration: 3000
            easing.type: Easing.OutExpo
        }

        PropertyAnimation {
            target: bg_rect1
            property: "y"
            from: root.height
            to: root.height * 0.35
            duration: 1400
            easing.type: Easing.OutExpo
        }
        PropertyAnimation {
            target: bg_rect2
            property: "y"
            from: root.height
            to: root.height * 0.5
            duration: 1400
            easing.type: Easing.OutExpo
        }
    }

    Component.onCompleted: {
        starttimer.start()
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:900}
}
##^##*/
