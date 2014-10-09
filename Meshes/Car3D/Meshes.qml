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

Item {
    id: root

    property variant leftFrontDoorMountingVector3D:  Qt.vector3d( 0.64, 0,  1.70)
    property variant leftBackDoorMountingVector3D:   Qt.vector3d( 0.64, 0, -0.17)
    property variant rightFrontDoorMountingVector3D: Qt.vector3d(-2.09, 0,  1.70)
    property variant rightRearDoorMountingVector3D:  Qt.vector3d(-2.09, 0, -0.20)

    property variant leftFrontWheelCenter:  Qt.vector3d( 0.654, 0.536,  2.587)
    property variant leftRearWheelCenter:   Qt.vector3d( 0.654, 0.536, -2.110)
    property variant rightFrontWheelCenter: Qt.vector3d(-2.120, 0.536,  2.587)
    property variant rightRearWheelCenter:  Qt.vector3d(-2.120, 0.536, -2.110)

    property alias carCoreMesh: carCoreMesh

    property alias door_left_front: door_left_front
    property alias door_left_rear: door_left_rear
    property alias door_right_front: door_right_front
    property alias door_right_rear: door_right_rear

    property alias glass_back: glass_back
    property alias glass_front: glass_front
    property alias glass_left_front: glass_left_front
    property alias glass_left_rear_big: glass_left_rear_big
    property alias glass_left_rear_small: glass_left_rear_small
    property alias glass_right_front: glass_right_front
    property alias glass_right_rear_big: glass_right_rear_big
    property alias glass_right_rear_small: glass_right_rear_small

    property alias headlight_glass_left_back: headlight_glass_left_back
    property alias headlight_glass_left_front: headlight_glass_left_front
    property alias headlight_glass_right_back: headlight_glass_right_back
    property alias headlight_glass_right_front: headlight_glass_right_front
    property alias headlight_left_back: headlight_left_back
    property alias headlight_left_front: headlight_left_front
    property alias headlight_right_back: headlight_right_back
    property alias headlight_right_front: headlight_right_front

    property alias wheel_left_back: wheel_left_back
    property alias wheel_left_front: wheel_left_front
    property alias wheel_right_back: wheel_right_back
    property alias wheel_right_front: wheel_right_front

    Mesh { id: carCoreMesh;                 source: "car-missing__4door-4wheels-2glass-4headlights.3ds" }

    Mesh { id: door_left_front;             source: "door-left-front.3ds" }
    Mesh { id: door_left_rear;              source: "door-left-rear.3ds" }
    Mesh { id: door_right_front;            source: "door-right-front.3ds" }
    Mesh { id: door_right_rear;             source: "door-right-rear.3ds" }

    Mesh { id: glass_back;                  source: "glass-back.3ds" }
    Mesh { id: glass_front;                 source: "glass-front.3ds" }
    Mesh { id: glass_left_front;            source: "glass-left-front.3ds" }
    Mesh { id: glass_left_rear_big;         source: "glass-left-rear-big.3ds" }
    Mesh { id: glass_left_rear_small;       source: "glass-left-rear-small.3ds" }
    Mesh { id: glass_right_front;           source: "glass-right-front.3ds" }
    Mesh { id: glass_right_rear_big;        source: "glass-right-rear-big.3ds" }
    Mesh { id: glass_right_rear_small;      source: "glass-right-rear-small.3ds" }

    Mesh { id: headlight_glass_left_back;   source: "headlight_glass-left-back.3ds" }
    Mesh { id: headlight_glass_left_front;  source: "headlight_glass-left-front.3ds" }
    Mesh { id: headlight_glass_right_back;  source: "headlight_glass-right-back.3ds" }
    Mesh { id: headlight_glass_right_front; source: "headlight_glass-right-front.3ds" }
    Mesh { id: headlight_left_back;         source: "headlight-left-back.3ds" }
    Mesh { id: headlight_left_front;        source: "headlight-left-front.3ds" }
    Mesh { id: headlight_right_back;        source: "headlight-right-back.3ds" }
    Mesh { id: headlight_right_front;       source: "headlight-right-front.3ds" }

    Mesh { id: wheel_left_back;             source: "wheel-left-back.3ds" }
    Mesh { id: wheel_left_front;            source: "wheel-left-front.3ds" }
    Mesh { id: wheel_right_back;            source: "wheel-right-back.3ds" }
    Mesh { id: wheel_right_front;           source: "wheel-right-front.3ds" }
}
