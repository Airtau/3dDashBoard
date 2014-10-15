import QtQuick 2.2
import QtQuick.Window 2.1
import Qt3D 2.0
import Qt3D.Shapes 2.0
import "Components"

Window {
    visible: true
    width: 1200
    height: 451

    Rectangle {
        id: root
        width: parent.width
        height: parent.height

        property real buttonWith: parent.width/9
        property real buttonHeight: 30

//        DashbdView {id: dashView
//            dash.rotateSpeedAngle: speedSlider.value
//            dash.rotateTachoAngle: tachoSlider.value
//        }

        Car3DView {id: carView}

        Row {
            id: checkButtonRow
            anchors.bottom: parent.Bottom
            anchors.right: parent.Right
            anchors.margins: 1
            spacing:  1
            Button {
                id: normal
                height: root.buttonHeight
                textItem.text: "Reset"
                textItem.font.pixelSize: 12
                textItem.font.bold: true
                textItem.anchors.verticalCenter: normal.verticalCenter
                textItem.anchors.left: normal.left
                onClicked: { carView.camera.eye = carView.camera.cameraVectorTop; carView.car.stopAnimation(); dashView.dash.swingDisplay(0)}
            }

            Button {
                id: frontLeftWheelBtn
                height: root.buttonHeight; width: root.buttonWith;
                textItem.text: "Wheel front left"
                textItem.font.pixelSize: 10
                textItem.anchors.verticalCenter: frontLeftWheelBtn.verticalCenter
                textItem.anchors.right: frontLeftWheelBtn.right

                onClicked: { carView.camera.eye = carView.camera.cameraVectorLeftFront; carView.car.blinkWheel(0);
                             carView.light.position = carView.light.lightVectorLeftFront; dashView.dash.swingDisplay(1)}
            }

            Button {
                id: frontRightWheelBtn
                height: root.buttonHeight; width: root.buttonWith;
                textItem.text: "Wheel front right"
                textItem.font.pixelSize: 10
                textItem.anchors.verticalCenter: frontRightWheelBtn.verticalCenter
                textItem.anchors.right: frontRightWheelBtn.right
                onClicked: { carView.camera.eye = carView.camera.cameraVectorRightFront; carView.car.blinkWheel(1);
                             carView.light.position = carView.light.lightVectorRightFront; dashView.dash.swingDisplay(1)}
            }

            Button {
                id: rearLeftWheelBtn
                height: root.buttonHeight; width: root.buttonWith;
                textItem.text: "Wheel rear left"
                textItem.font.pixelSize: 10
                textItem.anchors.verticalCenter: rearLeftWheelBtn.verticalCenter
                textItem.anchors.right: rearLeftWheelBtn.right
                onClicked: { carView.camera.eye = carView.camera.cameraVectorLeftRear; carView.car.blinkWheel(2);
                             carView.light.position = carView.light.lightVectorLeftRear; dashView.dash.swingDisplay(1)}
            }

            Button {
                id: rearRightWheelBtn
                height: root.buttonHeight; width: root.buttonWith;
                textItem.text: "Wheel rear right"
                textItem.font.pixelSize: 10
                textItem.anchors.verticalCenter: rearRightWheelBtn.verticalCenter
                textItem.anchors.right: rearRightWheelBtn.right
                onClicked: { carView.camera.eye = carView.camera.cameraVectorRightRear; carView.car.blinkWheel(3);
                             carView.light.position = carView.light.lightVectorRightRear; dashView.dash.swingDisplay(1)}
            }

            Button {
                id: frontLeftDoorBtn
                height: root.buttonHeight; width: root.buttonWith;
                textItem.text: "Door front left"
                textItem.font.pixelSize: 10
                textItem.anchors.verticalCenter: frontLeftDoorBtn.verticalCenter
                textItem.anchors.right: frontLeftDoorBtn.right
                onClicked: { carView.camera.eye = carView.camera.cameraVectorLeftFront; carView.car.swingDoor(0);
                    carView.light.position = carView.light.lightVectorLeftFront; dashView.dash.swingDisplay(1)}
            }

            Button {
                id: frontRightDoorBtn
                height: root.buttonHeight; width: root.buttonWith;
                textItem.text: "Door front right"
                textItem.font.pixelSize: 10
                textItem.anchors.verticalCenter: frontRightDoorBtn.verticalCenter
                textItem.anchors.right: frontRightDoorBtn.right
                onClicked: { carView.camera.eye = carView.camera.cameraVectorRightFront; carView.car.swingDoor(1);
                    carView.light.position = carView.light.lightVectorRightFront; dashView.dash.swingDisplay(1)}

            }

            Button {
                id: rearLeftDoorBtn
                height: root.buttonHeight; width: root.buttonWith;
                textItem.text: "Door rear left"
                textItem.font.pixelSize: 10
                textItem.anchors.verticalCenter: rearLeftDoorBtn.verticalCenter
                textItem.anchors.right: rearLeftDoorBtn.right
                onClicked: { carView.camera.eye = carView.camera.cameraVectorLeftRear; carView.car.swingDoor(2);
                    carView.light.position = carView.light.lightVectorLeftRear; dashView.dash.swingDisplay(1)}
            }

            Button {
                id: rearRightDoorBtn
                height: root.buttonHeight; width: root.buttonWith;
                textItem.text: "Door rear right"
                textItem.font.pixelSize: 10
                textItem.anchors.verticalCenter: rearRightDoorBtn.verticalCenter
                textItem.anchors.right: rearRightDoorBtn.right
                onClicked: { carView.camera.eye = carView.camera.cameraVectorRightRear; carView.car.swingDoor(3);
                    carView.light.position = carView.light.lightVectorRightRear; dashView.dash.swingDisplay(1);}
            }

        }

        SimpleSlider { id: speedSlider ;x: 0;y: 50}
        SimpleSlider { id: tachoSlider ;x: 1180;y: 50}

    }
}
