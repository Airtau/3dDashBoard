import QtQuick 2.3
import Qt3D 2.0

Item {


    property vector3d speedDisplayPosition:  Qt.vector3d(-200, 0, 0)
    property vector3d tachoDisplayPosition:  Qt.vector3d(200, 0, 0)

    property alias speegMesh: speedMesh
    property alias tachoMesh: tachoMesh


    Mesh {id: speedMesh; source: "dashboard.3ds"}
    Mesh {id: tachoMesh; source: "dashboard.3ds"}

}
