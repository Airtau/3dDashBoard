import QtQuick 2.3
import Qt3D 2.0
import "../Meshes/Gauges"

Item3D {
    id: rootGauges
    pretransform: Translation3D{ translate: Qt.vector3d(0, -5, 50.0) }

    property real displayAngle: 55.0

    property real rotateSpeedAngle: 0.0
    property real rotateTachoAngle: 0.0

    property real actionSpeed: 1000

    property vector3d speedDisplayAxis:  Qt.vector3d(20, 50, 0)
    property vector3d tachoDisplayAxis:  Qt.vector3d(20, -50, 0)

    // ------------------ Functions
    function swingDisplay(swingId) {

        if (swingId == 0) {
            speedDisplayRotationAnimationClose.start();
            tachoDisplayRotationAnimationClose.start();}
        else if (swingId == 1) {
            speedDisplayRotationAnimationOpen.start();
            tachoDisplayRotationAnimationOpen.start();}
    }

    function speedRotateNeedle(angleValue) {
        rotateSpeedAngle = angleValue;
        needleSpeedRotationAnimation.start();
    }


    // ------------------ Meshes ------------------
    Meshes { id: meshes }

    Item3D {id: speedDisplay; mesh: meshes.speegMesh; position: meshes.speedDisplayPosition;
        Item3D {meshNode: "bezel"; effect: allum;}
        transform: rotateSpeedDisplay;
        light: spLight
    }

//    Item3D {id: needleSpeed; mesh: meshes.needleMesh;
//        position: meshes.speedDisplayPosition;
//        transform: [needleSpeedRotate, rotateSpeedDisplay]
//    }

    Item3D {mesh: meshes.tachoMesh; position: meshes.tachoDisplayPosition;
        Item3D {meshNode: "bezel"; effect: allum}
        transform: rotateTachoDisplay
        light: thLight
    }

//    Item3D {id: needleTacho; mesh: meshes.needleMesh;
//        position: meshes.tachoDisplayPosition;
//        transform: [needleTachoRotate, rotateTachoDisplay]
//    }

    //--------------------Lights -------------------
    Light {id: spLight; position: Qt.vector3d( -300.0, 100.0, 150.0);
        //spotDirection: Qt.vector3d( -250.0, 50.0, -50.0);
        //spotAngle: 90;
    }
    Light {id: thLight; position: Qt.vector3d( 300.0, 100.0, 150.0);
        //onPositionChanged: lightPrxy.position = position;
        //spotDirection: Qt.vector3d( 250.0, 50.0, -50.0);
        //spotAngle: 90;
    }

    // ------------------ Effects ------------------
    Effect {
        id: allum
        material: bz;         decal: true
        //texture: "qrc:/Meshes/Gauges/chrome-texture.jpg"
        useLighting: true
    }

    Effect {
        id: titane
        material: dsk
        decal: true
        //texture: "qrc:/Meshes/Gauges/chrome-texture.jpg"
        useLighting: true
    }

    Material {
        id: bz
        ambientColor: "#333333"
        diffuseColor : "#DDDDDD"
        emittedLight: "#555555"
        shininess: 128
        specularColor:  "#FFFFFF"
    }

    Material {
        id: dsk
        ambientColor: "#333333"
        //diffuseColor : "#AAFFAA"
        //emittedLight: "#AADDDDDD"
        shininess: 128
        //specularColor:  "#DCDCFF"

    }

    // ------------------ Transform + Animations ------------------
    Rotation3D {
        id: rotateSpeedDisplay
        angle: 0
        axis: speedDisplayAxis
        origin: meshes.speedDisplayPosition
    }
    SequentialAnimation { id: speedDisplayRotationAnimationOpen; alwaysRunToEnd: true
        NumberAnimation { target: rotateSpeedDisplay; property: "angle"; to : displayAngle; duration: actionSpeed; easing.type: Easing.Linear}}

    SequentialAnimation { id: speedDisplayRotationAnimationClose; alwaysRunToEnd: true
        NumberAnimation { target: rotateSpeedDisplay; property: "angle"; to : 0; duration: actionSpeed; easing.type: Easing.Linear}}

    Rotation3D {
        id: rotateTachoDisplay
        angle: 0
        axis: tachoDisplayAxis
        origin: meshes.tachoDisplayPosition
    }
    SequentialAnimation { id: tachoDisplayRotationAnimationOpen; alwaysRunToEnd: true
        NumberAnimation { target: rotateTachoDisplay; property: "angle"; to : displayAngle; duration: actionSpeed; easing.type: Easing.Linear}}

    SequentialAnimation { id: tachoDisplayRotationAnimationClose; alwaysRunToEnd: true
        NumberAnimation { target: rotateTachoDisplay; property: "angle"; to : 0; duration: actionSpeed; easing.type: Easing.Linear}}

    Rotation3D {id: needleSpeedRotate; angle: rotateSpeedAngle;  axis: Qt.vector3d(0, 0, -90)
        Behavior on angle {SpringAnimation { spring: 5; damping: 0.2; modulus: 360 }}}

    Rotation3D {id: needleTachoRotate; angle: rotateTachoAngle;  axis: Qt.vector3d(0, 0, -90)
        Behavior on angle {SpringAnimation { spring: 5; damping: 0.2; modulus: 360 }}}

}
