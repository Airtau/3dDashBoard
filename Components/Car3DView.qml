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
import Qt3D.Shapes 2.0
import "."


Viewport {
    id: viewCar
    anchors.fill: parent
    blending: true
    navigation: false

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
