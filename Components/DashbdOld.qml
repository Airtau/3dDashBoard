import QtQuick 2.3
import Qt3D 2.0
import "."

Viewport {
    id: viewport
    width: parent.width; height: parent.height
    fillColor: "#222222"

    property color lightColor: Qt.hsla(hue, saturation, lightness, 1.0)
    property real hue: 0
    property real saturation: 1.0
    property real lightness: 1.0
    property real rotateAngle: 45.0
    property bool lightEnable: true

    property real actionSpeed: 1000

    property vector3d speedDisplayPosition:  Qt.vector3d(0, -3, 0)
    property vector3d speedDisplayAxis:  Qt.vector3d(-5, 5, 0)

    property vector3d tachoDisplayPosition:  Qt.vector3d(0, -3, 0)
    property vector3d tachoDisplayAxis:  Qt.vector3d(5, 5, 0)


    // ------------------ Functions
    Item { id: animationContainer
        property variant currentAnimation: null
    }

    function stopAnimation() {
        if (animationContainer.currentAnimation != null)
            animationContainer.currentAnimation.stop();

        animationContainer.currentAnimation = null;
    }

    function swingDisplay() {
        stopAnimation()
        animationContainer.currentAnimation = leftFrontDoorRotationAnimation

        if (animationContainer.currentAnimation != null)
            animationContainer.currentAnimation.start()
    }


    light: Light {
        id: mazeLight
        position: lightProxy.localToWorld()
        specularColor: viewport.lightColor
        diffuseColor: viewport.lightColor
        ambientColor: "#FFFFFF"
        constantAttenuation: 1
        linearAttenuation: 0.0
        quadraticAttenuation: 0

    }


    // ------------------ Transform + Animations ------------------
    Rotation3D {id: rotateSpeedDisplayFront
        angle: 0
        axis: Qt.vector3d(-1, 5, 0)
        origin: speedDisplayPosition
    }
    SequentialAnimation { id: rotateSpeedDisplayRotationAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        //NumberAnimation {target: rotateSpeedDisplayFront; property: "angle"; to: 0.0; duration: 2000; easing.type: Easing.Linear}
}



        Item3D {
            id: speedDisplay
            scale: 1 / 60
            x: -3
            mesh:speedMesh
            property bool spin: true
            light: mazeLight
            transform: [
                Rotation3D {
                    id: rotateSpeedDisplayStart
                    angle: -90
                    axis: Qt.vector3d(1, 0, 0)
                    origin: speedDisplayPosition
                },
                Rotation3D {
                    id: rotateSpeedDisplay
                    angle: 0
                    axis: speedDisplayAxis
                },
                Translation3D {
                    translate: Qt.vector3d(3, 0, 0)
                    SequentialAnimation on progress {
                        running: true
                        NumberAnimation { to : 1; duration: actionSpeed }
                        NumberAnimation { to : 0.0; duration: actionSpeed }
                    }
                }
            ]

            SequentialAnimation {
                running: speedDisplay.spin
                NumberAnimation {
                    target: rotateSpeedDisplayStart
                    property: "angle"
                    to: 0.0
                    duration: actionSpeed
                    easing.type: Easing.Linear
                }
                NumberAnimation {
                    target: rotateSpeedDisplay
                    property: "angle"
                    to: rotateAngle
                    duration: actionSpeed
                    easing.type: Easing.Linear
                }
                onStopped: {
                    needleSpeed.spin = true
                }
            }
        }

        Item3D {
            id: needleSpeed
            scale: 1 / 60
            mesh: needleMesh

            property bool spin: false

            transform: [
                Rotation3D {
                    id: needleSpeedRotate
                    angle: 0
                    //axis: Qt.vector3d(0, 90, 0)
                    //origin: Qt.vector3d(0.1, 5, 0)
                }
            ]
//                SequentialAnimation {
//                        id: needleSpeedRotationAnimation;
//                        running: needleSpeed.spin
//                        NumberAnimation {
//                            target: needleSpeedRotate
//                            property: "angle"
//                            to: -220.0
//                            duration: 500
//                            easing.type: Easing.InCubic
//                        }
////                        NumberAnimation {
////                            target: needleSpeedRotate
////                            property: "angle"
////                            to: 0
////                            duration: actionSpeed
////                            easing.type: Easing.InCubic
////                        }

//                        onStopped: {
//                            needleSpeed.spin = true
//                        }
//                    }

        }


//        Item3D {
//            id: tachoDisplay
//            scale: 1 / 60
//            x: 3
//            mesh:tachoMesh
//            property bool spin: true
//            light: mazeLight
//            transform: [
//                Rotation3D {
//                    id: rotateTachoDisplayStart
//                    angle: -90
//                    axis: Qt.vector3d(1, 0, 0)
//                    origin: tachoDisplayPosition
//                },
//                Rotation3D {
//                    id: rotateTachoDisplay
//                    angle: 0
//                    axis: tachoDisplayAxis
//                },
//                Translation3D {
//                    translate: Qt.vector3d(-3, 0, 0)
//                    SequentialAnimation on progress {
//                        running: true
//                        NumberAnimation { to : 1.0; duration: 1000 }
//                        NumberAnimation { to : 0.0; duration: 1000 }
//                    }
//                }
//            ]

//            SequentialAnimation {
//                running: tachoDisplay.spin
//                NumberAnimation {
//                    target: rotateTachoDisplayStart
//                    property: "angle"
//                    to: 0.0
//                    duration: actionSpeed
//                    easing.type: Easing.Linear
//                }
//                NumberAnimation {
//                    target: rotateTachoDisplay
//                    property: "angle"
//                    to: -rotateAngle
//                    duration: actionSpeed
//                    easing.type: Easing.Linear
//                }
//                onStopped: {
//                    needleTacho.spin = true
//                }
//            }
//            Item3D {
//                id: needleTacho
//                mesh: tachoMesh
//                meshNode: "needle"
//                property bool spin: false
//                inheritEvents: true
//                transform: [
//                    Rotation3D {
//                        id: needleTachoRotate
//     glass                   angle: 0
//                        axis: Qt.vector3d(0, 0, 1)
//                        //origin: Qt.vector3d(0, 0, 1)
//                    }
//                ]


//                onClicked: {
//                    needleTacho.spin = true
//                }

//                SequentialAnimation {
//                    running: needleTacho.spin
//                    NumberAnimation {
//                        target: needleTachoRotate
//                        property: "angle"
//                        to: -220.0
//                        duration: 500
//                        easing.type: Easing.InCubic
//                    }
//                    NumberAnimation {
//                        target: needleTachoRotate
//                        property: "angle"
//                        to: 0
//                        duration: actionSpeed
//                        easing.type: Easing.InCubic
//                    }

//                    onStopped: {
//                        needleTacho.spin = true
//                    }
//                }
//            }
//        }


        Item3D {
            id: lightProxy
            scale: 0.5
            y: 2.5
            x: 0
            z: 0.5
            enabled: lightEnable
            onPositionChanged: mazeLight.position = localToWorld();
            Sphere {
                effect: Effect {
                    color: viewport.lightColor
                    useLighting: true
                }
            }

        }


        Material {
            id: bz
            ambientColor: "#EEEEEE"
            diffuseColor : "#505050"
            //emittedLight: "#EEEEEE"
            shininess: 50
            specularColor:  "#FFFFFF"
        }
}

