import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12

import FurUI 1.0 as FurUI

T.MenuItem
{
    id: control

    property color hoveredColor: FurUI.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.2)
                                                       : Qt.rgba(0, 0, 0, 0.1)
    property color pressedColor: FurUI.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.1)
                                                       : Qt.rgba(0, 0, 0, 0.2)

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    verticalPadding: FurUI.Units.smallSpacing
    hoverEnabled: true
    topPadding: FurUI.Units.smallSpacing
    bottomPadding: FurUI.Units.smallSpacing

    icon.width: FurUI.Units.iconSizes.medium
    icon.height: FurUI.Units.iconSizes.medium

    icon.color: control.enabled ? (control.highlighted ? control.FurUI.Theme.highlightColor : control.FurUI.Theme.textColor) :
                             control.FurUI.Theme.disabledTextColor

    contentItem: IconLabel {
        readonly property real arrowPadding: control.subMenu && control.arrow ? control.arrow.width + control.spacing : 0
        readonly property real indicatorPadding: control.checkable && control.indicator ? control.indicator.width + control.spacing : 0
        leftPadding: !control.mirrored ? indicatorPadding + FurUI.Units.smallSpacing * 2 : arrowPadding
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding + FurUI.Units.smallSpacing * 2

        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: control.enabled ? control.pressed || control.hovered ? control.FurUI.Theme.textColor : 
               FurUI.Theme.textColor : control.FurUI.Theme.disabledTextColor
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: control.visible ? FurUI.Units.gridUnit + FurUI.Units.largeSpacing : 0
        radius: FurUI.Theme.mediumRadius
        opacity: 1

        anchors {
            fill: parent
            leftMargin: FurUI.Units.smallSpacing
            rightMargin: FurUI.Units.smallSpacing
        }

        color: control.pressed || highlighted ? control.pressedColor : control.hovered ? control.hoveredColor : "transparent"
    }
}
