import QtQuick 2.3
import Qt3D 2.0
import "../Meshes/Car3D"

Item3D {
    id: rootCar

    property real lF_GlassOpening:  0.0
    property real rF_GlassOpening: 0.0
    property real lR_GlassOpening:   0.0
    property real rR_GlassOpening:  0.0


    // ------------------ Functions
    Item { id: animationContainer
        property variant currentAnimation: null
    }

    function stopAnimation() {

        wlf.effect = none;
        wlr.effect = none;
        wrf.effect = none;
        wrr.effect = none;
        if (animationContainer.currentAnimation != null)
            animationContainer.currentAnimation.stop();

        animationContainer.currentAnimation = null;
    }

    function blinkWheel(wheelId) {
        stopAnimation()

        if (wheelId == 0) {
            animationContainer.currentAnimation = leftFrontWheelPulseAnimation;
            wlf.effect = warming;}
        else if (wheelId == 1){
            animationContainer.currentAnimation = rightFrontWheelPulseAnimation;
            wrf.effect = warming;}
        else if (wheelId == 2){
            animationContainer.currentAnimation = leftRearWheelPulseAnimation;
            wlr.effect = warming;}

        else if (wheelId == 3){
            animationContainer.currentAnimation = rightRearWheelPulseAnimation
            wrr.effect = warming;}

        if (animationContainer.currentAnimation != null)
            animationContainer.currentAnimation.start()
    }

    function swingDoor(doorId) {
        stopAnimation()

        if (doorId == 0)
            animationContainer.currentAnimation = leftFrontDoorRotationAnimation
        else if (doorId == 1)
            animationContainer.currentAnimation = rightFrontDoorRotationAnimation
        else if (doorId == 2)
            animationContainer.currentAnimation = leftRearDoorRotationAnimation
        else if (doorId == 3)
            animationContainer.currentAnimation = rightRearDoorRotationAnimation

        if (animationContainer.currentAnimation != null)
            animationContainer.currentAnimation.start()
    }



    // ------------------ Meshes ------------------
    Meshes { id: meshes }



    Item3D { mesh: meshes.carBodyMesh;}

    Item3D {
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_LF::reflect";}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_LF::vehiclelight";}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_LF::orange";}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_Glass_LF::HLFglass"; effect: hL_glass;}

        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_RF::reflect";}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_RF::vehiclelight";}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_RF::orange";}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_Glass_RF::HLFglass"; effect: hL_glass;}

        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_LRB::red";}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_LRB::white";}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_Glass_LRB::HLRglass"; effect: hL_glass;}


        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_RRB::red"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_RRB::white"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_Glass_RRB::HLRglass"; effect: hL_glass;}
        pretransform: [meshes.setToBodyAxis]
    }



    Item3D { mesh: meshes.carPartsMesh; meshNode: "Interior::interior"; pretransform: [meshes.setToBodyAxis];}
    Item3D { mesh: meshes.carPartsMesh; meshNode: "Cowl::body"; pretransform: [meshes.setToBodyAxis];}
    Item3D { mesh: meshes.carPartsMesh; meshNode: "Glass_F::WinGlass"; pretransform: [meshes.setToBodyAxis]; effect: glass;}
    Item3D { mesh: meshes.carPartsMesh; meshNode: "Glass_R::WinGlass"; pretransform: [meshes.setToBodyAxis]; effect: glass;}


    Item3D { Item3D { mesh: meshes.carPartsMesh; meshNode: "Trunk::body"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Trunk::red"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Trunk::white"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_Glass_LRT::HLRglass"; effect: hL_glass}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "HL_Glass_RRT::HLRglass"; effect: hL_glass}
        pretransform: [meshes.setToBodyAxis]}



    Item3D { Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_LF::body"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_LF::interior"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_LF::door_bezel"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Glass_LF::WinGlass";
            transform: [lF_GlassOpeningTranslation]; effect: glass;}
        transform: [leftFrontDoorRotation]; pretransform: [meshes.setToBodyAxis]}


    Item3D { Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_RF::body"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_RF::interior"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_RF::door_bezel"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Glass_RF::WinGlass";
            transform: [rF_GlassOpeningTranslation]; effect: glass;}
        transform: [rightFrontDoorRotation]; pretransform: [meshes.setToBodyAxis]}

    Item3D { Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_LR::body"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_LR::interior"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_LR::door_bezel"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Glass_LRS::WinGlass"; effect: glass}
        Item3D {mesh: meshes.carPartsMesh; meshNode: "Glass_LRB::WinGlass";
            transform: [lR_GlassOpeningTranslation]; effect: glass;}
        transform: [leftRearDoorRotation]; pretransform: [meshes.setToBodyAxis]}

    Item3D { Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_RR::body"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_RR::interior"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Door_RR::door_bezel"}
        Item3D { mesh: meshes.carPartsMesh; meshNode: "Glass_RRS::WinGlass"; effect: glass}
        Item3D {mesh: meshes.carPartsMesh; meshNode: "Glass_RRB::WinGlass";
            transform: [rR_GlassOpeningTranslation]; effect: glass;}
        transform: [rightRearDoorRotation]; pretransform: [meshes.setToBodyAxis]}

    Item3D {mesh: meshes.wheelLF; meshNode: "Wheel::disk";
        pretransform: [Rotation3D { angle: 90; axis: meshes.leftWheelAxis}, Translation3D{translate: meshes.leftFrontWheelCenter}]
        transform: leftFrontWheelPulse
        Item3D {id: wlf; mesh: meshes.wheelLF; meshNode: "Wheel::ture"}
        }

    Item3D {mesh: meshes.wheelRF; meshNode: "Wheel::disk";
        pretransform: [Rotation3D { angle: 90; axis: meshes.rightWheelAxis}, Translation3D{translate: meshes.rightFrontWheelCenter}]
        transform: rightFrontWheelPulse
        Item3D {id: wrf; mesh: meshes.wheelRF; meshNode: "Wheel::ture"}
        }

    Item3D {mesh: meshes.wheelLR; meshNode: "Wheel::disk";
        pretransform: [Rotation3D { angle: 90; axis: meshes.leftWheelAxis}, Translation3D{translate: meshes.leftRearWheelCenter}]
        transform: leftRearWheelPulse
        Item3D {id: wlr; mesh: meshes.wheelLR; meshNode: "Wheel::ture"}
        }

    Item3D {mesh: meshes.wheelRR; meshNode: "Wheel::disk";
        pretransform: [Rotation3D { angle: 90; axis: meshes.rightWheelAxis}, Translation3D{translate: meshes.rightRearWheelCenter}]
        transform: rightRearWheelPulse
        Item3D {id: wrr; mesh: meshes.wheelRR; meshNode: "Wheel::ture"}
        }

    // ------------------ Effects ------------------
    Effect {
        id: glass
        blending: true;
        color: Qt.rgba(0.0, 155, 200, 0.3)
    }

    Effect {
        id: hL_glass
        blending: true;
        color: Qt.rgba(0.0, 0.01, 0.02, 0.1)
    }

    Effect {
        id: none
        color: Qt.rgba(0.5, 0.5, 0.5, 1.0)
    }

    Effect {
        id: warming
        color: Qt.rgba(255, 0.1, 0.1, 0.8)
    }

    // ------------------ Transform + Animations ------------------
    Rotation3D {
        id: leftFrontDoorRotation
        angle: 0
        axis: Qt.vector3d(0, 1, 0)
        origin: meshes.lFDoorRotationVector
    }
    SequentialAnimation { id: leftFrontDoorRotationAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: leftFrontDoorRotation; property: "angle"; from: 0; to : -30.0; duration: 1000; easing.type: Easing.OutBounce}
        NumberAnimation { target: leftFrontDoorRotation; property: "angle"; from: -30; to : 0.0; duration: 500; easing.type: Easing.OutCubic}    }

    Rotation3D {
        id: leftRearDoorRotation
        angle: 0
        axis: Qt.vector3d(0, 1, 0)
        origin: meshes.lRDoorRotationVector
    }
    SequentialAnimation { id: leftRearDoorRotationAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: leftRearDoorRotation; property: "angle"; from: 0; to : -30.0; duration: 1000; easing.type: Easing.OutBounce}
        NumberAnimation { target: leftRearDoorRotation; property: "angle"; from: -30; to : 0.0; duration: 500; easing.type: Easing.OutCubic}     }

    Rotation3D {
        id: rightFrontDoorRotation
        angle: 0
        axis: Qt.vector3d(0, 1, 0)
        origin: meshes.rFDoorRotationVector
    }
    SequentialAnimation { id: rightFrontDoorRotationAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: rightFrontDoorRotation; property: "angle"; from: 0; to : 30.0; duration: 1000; easing.type: Easing.OutBounce}
        NumberAnimation { target: rightFrontDoorRotation; property: "angle"; from: 30; to : 0.0; duration: 500; easing.type: Easing.OutCubic}    }

    Rotation3D {
        id: rightRearDoorRotation
        angle: 0
        axis: Qt.vector3d(0, 1, 0)
        origin: meshes.rRDoorRotationVector
    }
    SequentialAnimation { id: rightRearDoorRotationAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: rightRearDoorRotation; property: "angle"; from: 0; to : 30.0; duration: 1000; easing.type: Easing.OutBounce}
        NumberAnimation { target: rightRearDoorRotation; property: "angle"; from: 30; to : 0.0; duration: 500; easing.type: Easing.OutCubic}    }


    Scale3D {
        id: leftFrontWheelPulse
        scale: 1.0
        origin: meshes.leftFrontWheelCenter
    }
    SequentialAnimation { id: leftFrontWheelPulseAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: leftFrontWheelPulse; property: "scale"; from: 1.0;  to: 1.05; duration: 200;}
        NumberAnimation { target: leftFrontWheelPulse; property: "scale"; from: 1.05; to: 0.9;  duration: 200;}
        NumberAnimation { target: leftFrontWheelPulse; property: "scale"; from: 0.9;  to: 1.0;  duration: 200;}    }

    Scale3D {
        id: rightFrontWheelPulse
        scale: 1.0
        origin: meshes.rightFrontWheelCenter
    }
    SequentialAnimation { id: rightFrontWheelPulseAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: rightFrontWheelPulse; property: "scale"; from: 1.0;  to: 1.05; duration: 200;}
        NumberAnimation { target: rightFrontWheelPulse; property: "scale"; from: 1.05; to: 0.9;  duration: 200;}
        NumberAnimation { target: rightFrontWheelPulse; property: "scale"; from: 0.9;  to: 1.0;  duration: 200;}    }

    Scale3D {
        id: leftRearWheelPulse
        scale: 1.0
        origin: meshes.leftRearWheelCenter
    }
    SequentialAnimation { id: leftRearWheelPulseAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: leftRearWheelPulse; property: "scale"; from: 1.0;  to: 1.05; duration: 200;}
        NumberAnimation { target: leftRearWheelPulse; property: "scale"; from: 1.05; to: 0.9;  duration: 200;}
        NumberAnimation { target: leftRearWheelPulse; property: "scale"; from: 0.9;  to: 1.0;  duration: 200;}    }

    Scale3D {
        id: rightRearWheelPulse
        scale: 1.0
        origin: meshes.rightRearWheelCenter
    }
    SequentialAnimation { id: rightRearWheelPulseAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: rightRearWheelPulse; property: "scale"; from: 1.0;  to: 1.05; duration: 200;}
        NumberAnimation { target: rightRearWheelPulse; property: "scale"; from: 1.05; to: 0.9;  duration: 200;}
        NumberAnimation { target: rightRearWheelPulse; property: "scale"; from: 0.9;  to: 1.0;  duration: 200;}    }


    Translation3D {id: lF_GlassOpeningTranslation; progress: 0.5 ; translate: Qt.vector3d(0, -1*lF_GlassOpening, 0)}
    Translation3D {id: rF_GlassOpeningTranslation; progress: 0.5 ; translate: Qt.vector3d(0, -1*rF_GlassOpening, 0)}
    Translation3D {id: lR_GlassOpeningTranslation; progress: 0.5 ; translate: Qt.vector3d(0, -1*lR_GlassOpening, 0)}
    Translation3D {id: rR_GlassOpeningTranslation; progress: 0.5 ; translate: Qt.vector3d(0, -1*rR_GlassOpening, 0)}
}
