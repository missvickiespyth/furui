import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import FurUI 1.0 as FurUI

T.MenuSeparator {
    id: control

    implicitHeight: FurUI.Units.largeSpacing + separator.height
    width: parent.width

    background: Rectangle {
        id: separator
        anchors.centerIn: control
        width: control.width - FurUI.Units.largeSpacing * 2
        height: 1
        color: FurUI.Theme.textColor
        opacity: 0.3
    }
}