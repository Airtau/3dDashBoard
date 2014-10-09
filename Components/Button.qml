import QtQuick 2.3

Rectangle {
    id: root
    signal clicked
    property alias textItem: buttonText
    width: 80
    height:  15
    color:  "#77559990"
    radius: 5

    Text { id: buttonText;
        anchors.margins: 5;
        font.family: "Arial";
        font.pixelSize: 23;
        color: "#ffffff"}
    MouseArea {
        anchors.fill: parent;
        onClicked: root.clicked()}
}
