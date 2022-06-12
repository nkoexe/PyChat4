import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root
    property string source
    property color color

    Image {
        id: icon
        source: root.source ? "file:///" + backend.getIconPath(root.source) : ""
        fillMode: Image.PreserveAspectFit

        anchors {
            fill: root
        }
    }

    // Todo: custom ShaderEffect
    ColorOverlay {
        id: coloroverlay
        source: icon
        anchors.fill: icon
        color: root.color
    }

}
