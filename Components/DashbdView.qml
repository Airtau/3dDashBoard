import QtQuick 2.3
import Qt3D 2.0
import Qt3D.Shapes 2.0
import "."

Viewport {
    id: viewport
    width: parent.width; height: parent.height
    navigation: false
    blending: true

    fillColor: "#000000"

    property alias dash: gauges

    property color lightColor: Qt.hsla(hue, saturation, lightness, 1.0)
    property real hue: 0
    property real saturation: 1.0
    property real lightness: 1.0
    property bool lightEnable: true

    camera: Camera {id: dbCamera; eye: cameraVectorTop;
        property variant cameraVectorTop: Qt.vector3d(0,0,650)
    }

    Gauges { id: gauges}

    light: Light {
        id: dbLight
        position: Qt.vector3d( 0.0, -100.0, 50.0);
        specularColor: "#FFFFFF";
        diffuseColor: "#909090";
        ambientColor: "#FFFFFF"
        constantAttenuation: 1;
        linearAttenuation: 0.0;
        quadraticAttenuation: 0;
        onPositionChanged: lightPrxy.position = position;
    }



    Item3D {
        id: lightPrxy
        position: dbLight.position
        scale: 50.0
        enabled: false
        Sphere {
            effect: Effect {
                useLighting: true
            }
        }
    }


}

