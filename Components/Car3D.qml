/****************************************************************************

This file is part of the Car3D project on http://www.gitorious.org.

Copyright (c) 2009 Nokia Corporation and/or its subsidiary(-ies).*
All rights reserved.

Contact:  Nokia Corporation (qt-info@nokia.com)**

You may use this file under the terms of the BSD license as follows:

"Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of Nokia Corporation and its Subsidiary(-ies) nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."

****************************************************************************/

import QtQuick 2.3
import Qt3D 2.0
import "../Meshes/Car3D"

// NOTE
// try to avoid doing translate (and rotate only around 0,0,0) on this item! .. it might break other animations


Item3D {
    id: rootCar
    pretransform: Translation3D{ translate: Qt.vector3d(0.76, -1.44, -0.02) } // move center of car (between driver and shotgun) to center of world (0,0,0)


    property real leftFrontGlassOpeningDegree:  0.0
    property real rightFrontGlassOpeningDegree: 0.0
    property real leftRearGlassOpeningDegree:   0.0
    property real rightRearGlassOpeningDegree:  0.0


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

    Item3D { mesh: meshes.carCoreMesh; }

    Item3D { mesh: meshes.door_left_front;                                      transform: leftFrontDoorRotation  }
    Item3D { mesh: meshes.door_left_rear;                                       transform: leftRearDoorRotation   }
    Item3D { mesh: meshes.door_right_front;                                     transform: rightFrontDoorRotation }
    Item3D { mesh: meshes.door_right_rear;                                      transform: rightRearDoorRotation  }

    Item3D { mesh: meshes.glass_back;                   effect: glass; }
    Item3D { mesh: meshes.glass_front;                  effect: glass; }
    Item3D { mesh: meshes.glass_left_front;             effect: glass;          transform: [leftFrontDoorRotation, leftFrontGlassOpeningTranslation]  }
    Item3D { mesh: meshes.glass_left_rear_big;          effect: glass;          transform: [leftRearDoorRotation, leftRearGlassOpeningTranslation]   }
    Item3D { mesh: meshes.glass_left_rear_small;        effect: glass;          transform: leftRearDoorRotation   }
    Item3D { mesh: meshes.glass_right_front;            effect: glass;          transform: [rightFrontDoorRotation, rightFrontGlassOpeningTranslation] }
    Item3D { mesh: meshes.glass_right_rear_big;         effect: glass;          transform: [rightRearDoorRotation, rightRearGlassOpeningTranslation]  }
    Item3D { mesh: meshes.glass_right_rear_small;       effect: glass;          transform: rightRearDoorRotation  }


    Item3D { mesh: meshes.headlight_left_back; }
    Item3D { mesh: meshes.headlight_left_front; }
    Item3D { mesh: meshes.headlight_right_back; }
    Item3D { mesh: meshes.headlight_right_front; }
    Item3D { mesh: meshes.headlight_glass_left_back;    effect: glass; }
    Item3D { mesh: meshes.headlight_glass_left_front;   effect: glass; }
    Item3D { mesh: meshes.headlight_glass_right_back;   effect: glass; }
    Item3D { mesh: meshes.headlight_glass_right_front;  effect: glass; }

    Item3D { mesh: meshes.wheel_left_back; Item3D {id: wlr; meshNode: "Mesh1_whee";} transform: leftRearWheelPulse}
    Item3D { mesh: meshes.wheel_left_front; Item3D {id: wlf; meshNode: "Mesh9_whee";} transform: leftFrontWheelPulse}
    Item3D { mesh: meshes.wheel_right_back; Item3D {id: wrr; meshNode: "Mesh5_whee";} transform: rightRearWheelPulse}
    Item3D { mesh: meshes.wheel_right_front; Item3D {id: wrf; meshNode: "Mesh13";} transform: rightFrontWheelPulse}


    // ------------------ Effects ------------------
    Effect {
        id: glass
        blending: true;
        color: Qt.rgba(0.1, 0.1, 0.4, 0.3)
    }


    Effect {
        id: none
        blending: false;
        color: Qt.rgba(0.5, 0.5, 0.5, 1.0)
    }

    Effect {
        id: warming
        blending: false;
        color: Qt.rgba(255, 0.1, 0.1, 0.8)
    }

    // ------------------ Transform + Animations ------------------
    Rotation3D {
        id: leftFrontDoorRotation
        angle: 0
        axis: Qt.vector3d(0, 1, 0)
        origin: meshes.leftFrontDoorMountingVector3D
    }
    SequentialAnimation { id: leftFrontDoorRotationAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: leftFrontDoorRotation; property: "angle"; from: 0; to : -30.0; duration: 1000; easing.type: Easing.OutBounce}
        NumberAnimation { target: leftFrontDoorRotation; property: "angle"; from: -30; to : 0.0; duration: 500; easing.type: Easing.OutCubic}    }

    Rotation3D {
        id: leftRearDoorRotation
        angle: 0
        axis: Qt.vector3d(0, 1, 0)
        origin: meshes.leftBackDoorMountingVector3D
    }
    SequentialAnimation { id: leftRearDoorRotationAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: leftRearDoorRotation; property: "angle"; from: 0; to : -30.0; duration: 1000; easing.type: Easing.OutBounce}
        NumberAnimation { target: leftRearDoorRotation; property: "angle"; from: -30; to : 0.0; duration: 500; easing.type: Easing.OutCubic}     }

    Rotation3D {
        id: rightFrontDoorRotation
        angle: 0
        axis: Qt.vector3d(0, 1, 0)
        origin: meshes.rightFrontDoorMountingVector3D
    }
    SequentialAnimation { id: rightFrontDoorRotationAnimation; loops: Animation.Infinite; alwaysRunToEnd: true
        NumberAnimation { target: rightFrontDoorRotation; property: "angle"; from: 0; to : 30.0; duration: 1000; easing.type: Easing.OutBounce}
        NumberAnimation { target: rightFrontDoorRotation; property: "angle"; from: 30; to : 0.0; duration: 500; easing.type: Easing.OutCubic}    }

    Rotation3D {
        id: rightRearDoorRotation
        angle: 0
        axis: Qt.vector3d(0, 1, 0)
        origin: meshes.rightRearDoorMountingVector3D
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


    Translation3D {id: leftFrontGlassOpeningTranslation;  translate: Qt.vector3d(0, -1*leftFrontGlassOpeningDegree, 0) }
    Translation3D {id: rightFrontGlassOpeningTranslation; translate: Qt.vector3d(0, -1*rightFrontGlassOpeningDegree, 0) }
    Translation3D {id: leftRearGlassOpeningTranslation;   translate: Qt.vector3d(0, -1*leftRearGlassOpeningDegree, 0) }
    Translation3D {id: rightRearGlassOpeningTranslation;  translate: Qt.vector3d(0, -1*rightRearGlassOpeningDegree, 0) }
}
