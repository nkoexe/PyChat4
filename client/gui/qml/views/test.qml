import QtQuick

Rectangle {
    id: root
    color: colors.background2
    border.width: 0

    Text {
        id: title
        text: "Testing"
        font.pixelSize: 42
        font.family: "Product Sans"
        font.bold: true
        color: colors.text1

        anchors {
            top: root.top
            topMargin: 40
            horizontalCenter: root.horizontalCenter
        }
    }

    Rectangle {
        id: goto_login
        radius: 15
        color: colors.background3
        height: root.height / 3

        anchors {
            left: root.left
            top: title.bottom
            right: root.horizontalCenter
            margins: 20
        }

        Text {
            text: "Login page"
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Product Sans"
            font.italic: true
            color: colors.text3
            anchors.fill: parent
        }

        TapHandler { onTapped: backend.loadView("login") }
    }

    Rectangle {
        id: goto_loading
        radius: 15
        color: colors.background3
        height: root.height / 3

        anchors {
            left: root.horizontalCenter
            top: title.bottom
            right: root.right
            margins: 20
        }

        Text {
            text: "Loading page"
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Product Sans"
            font.italic: true
            color: colors.text3
            anchors.fill: parent
        }

        TapHandler { onTapped: backend.loadView("loading") }
    }

    Rectangle {
        id: goto_main
        radius: 15
        color: colors.background3

        anchors {
            left: root.left
            top: goto_login.bottom
            right: root.horizontalCenter
            bottom: root.bottom
            margins: 20
        }

        Text {
            text: "Main page"
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Product Sans"
            font.italic: true
            color: colors.text3
            anchors.fill: parent
        }

        TapHandler { onTapped: backend.loadView("main") }
    }

    Rectangle {
        id: color_scheme
        radius: 15
        color: colors.background3
        height: root.height / 3

        anchors {
            left: root.horizontalCenter
            top: goto_loading.bottom
            right: root.right
            bottom: root.bottom
            margins: 20
        }

        Text {
            text: "Change color scheme"
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Product Sans"
            font.italic: true
            color: colors.text3
            anchors.fill: parent
        }

        TapHandler { onTapped: backend._temp_nextTheme() }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.5;height:480;width:800}
}
##^##*/
