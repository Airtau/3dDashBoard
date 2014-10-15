import QtQuick 2.3
import Qt3D 2.0
import Qt3D.Shapes 2.0
import "."


Viewport {
    id: viewCar
    anchors.fill: parent
    blending: true
    navigation: true

    property alias car: car

    camera: Camera {
        id: carCamera
        eye: cameraVectorTop

        property variant cameraVectorOut:             Qt.vector3d(1000,1000,1000)
        property variant cameraVectorTop:             Qt.vector3d(0,50,-5)
        property variant cameraVectorLeftRear:   Qt.vector3d( 10.0, 1.5, -10.0)
        property variant cameraVectorLeftFront:  Qt.vector3d( 10.0, 1.5,  10.0)
        property variant cameraVectorRightFront: Qt.vector3d(-10.0, 1.5,  10.0)
        property variant cameraVectorRightRear:  Qt.vector3d(-10.0, 1.5, -10.0)


        property variant cameraVectorRightFrontHeadlight: Qt.vector3d(-2.5, 0.5, 8.0)
        property variant cameraVectorLeftFrontHeadlight:  Qt.vector3d( 2.5, 0.5, 8.0)

        Behavior on eye {
            SequentialAnimation {
                Vector3dAnimation { duration:  300; easing.type:   "OutQuad"; to: carCamera.cameraVectorTop }
                Vector3dAnimation { duration: 1000; easing.type: "InOutQuad" }
            }
        }
    }

    Car3D {
        id: car
    }

    light: Light {
        id: carLight

        property variant lightVectorLeftRear:   Qt.vector3d( 3.0, -0.5, -2.0)
        property variant lightVectorLeftFront:  Qt.vector3d( 3.0, -0.5,  2.5)
        property variant lightVectorRightFront: Qt.vector3d(-3.0, -0.5,  2.5)
        property variant lightVectorRightRear:  Qt.vector3d(-3.0, -0.5, -2.0)

        specularColor: "#FFFFFF";
        diffuseColor: "#999999";
        ambientColor: "#F0F0F0";
        constantAttenuation: 1;
        linearAttenuation: 0.0;
        quadraticAttenuation: 0;
        onPositionChanged: lightProxy.position = position;
    }

    Item3D {
        id: lightProxy
        scale: 0.5
        enabled: false
        Sphere {
            effect: Effect {
                color: carLight.diffuseColor
                useLighting: true
            }
        }
    }
}
