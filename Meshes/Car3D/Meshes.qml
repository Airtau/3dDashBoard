import QtQuick 2.3
import Qt3D 2.0

Item {

    property variant setToBodyAxis: Rotation3D {angle: 90; axis: Qt.vector3d(-180, 0, 0)}

    property vector3d lFDoorRotationVector:  Qt.vector3d(  1.35, 0,  1.10)
    property vector3d rFDoorRotationVector:  Qt.vector3d( -1.35, 0,  1.10)
    property vector3d lRDoorRotationVector:  Qt.vector3d(  1.35, 0,  -0.80)
    property vector3d rRDoorRotationVector:  Qt.vector3d( -1.35, 0, -0.80)

    property vector3d leftFrontWheelCenter:  Qt.vector3d( 1.35, -0.655,  1.95)
    property vector3d rightFrontWheelCenter: Qt.vector3d(-1.35, -0.655,  1.95)
    property vector3d leftRearWheelCenter:   Qt.vector3d( 1.35, -0.655, -2.75)
    property vector3d rightRearWheelCenter:  Qt.vector3d(-1.35, -0.655, -2.75)

    property vector3d leftWheelAxis: Qt.vector3d(0, -1, 0)
    property vector3d rightWheelAxis: Qt.vector3d(0, 1, 0)

    property alias carBodyMesh: carBodyMesh
    property alias carPartsMesh: carPartsMesh
    property alias wheelLF: wheelLF
    property alias wheelRF: wheelRF
    property alias wheelLR: wheelLR
    property alias wheelRR: wheelRR

    Mesh { id: carBodyMesh;                 source: "carBody.3ds"}
    Mesh { id: carPartsMesh;                source: "carParts.3ds"}
    Mesh { id: wheelLF;                     source: "carWhell.3ds"}
    Mesh { id: wheelRF;                     source: "carWhell.3ds"}
    Mesh { id: wheelLR;                     source: "carWhell.3ds"}
    Mesh { id: wheelRR;                     source: "carWhell.3ds"}

}
