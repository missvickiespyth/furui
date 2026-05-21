import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import FurUI 1.0 as FurUI

T.TabButton {
    id: control

    property int standardHeight: FurUI.Units.iconSizes.medium + FurUI.Units.smallSpacing
    property color pressedColor: Qt.rgba(FurUI.Theme.textColor.r, FurUI.Theme.textColor.g, FurUI.Theme.textColor.b, 0.5)

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             standardHeight)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 0
    spacing: 0

    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight

        text: control.text
        font: control.font
        color: !control.enabled ? FurUI.Theme.disabledTextColor : control.pressed ? pressedColor : control.checked ? FurUI.Theme.textColor : FurUI.Theme.textColor
    }
}
