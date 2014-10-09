import QtQuick 2.3
import QtQuick.Controls 1.2

Rectangle {
    id: root
    width: 20
    height: 400
    color: "#000000"

    property real value: slider.value
    //property bool hovered: false

        Slider {
            id: slider
            width: parent.width
            height: parent.height
            minimumValue: 0
            tickmarksEnabled: true
            stepSize: 1
            updateValueWhileDragging: true
            value: 0
            maximumValue: 220
            orientation: Qt.Vertical
    }
}
