/*
 * Copyright (C) 2021 CutefishOS Team.
 *
 * Author:     Reion Wong <reion@cutefishos.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import FurUI 1.0 as FurUI
import QtQuick.Controls.impl 2.12

T.Button {
    id: control
    implicitWidth: Math.max(background.implicitWidth, contentItem.implicitWidth + FurUI.Units.largeSpacing)
    implicitHeight: background.implicitHeight
    hoverEnabled: true

    icon.width: FurUI.Units.iconSizes.small
    icon.height: FurUI.Units.iconSizes.small

    icon.color: control.enabled ? (control.highlighted ? control.FurUI.Theme.highlightColor : control.FurUI.Theme.textColor) : control.FurUI.Theme.disabledTextColor
    spacing: FurUI.Units.smallSpacing

    property color hoveredColor: FurUI.Theme.darkMode ? Qt.lighter(FurUI.Theme.alternateBackgroundColor, 1.2)
                                                       : Qt.darker(FurUI.Theme.alternateBackgroundColor, 1.1)

    property color pressedColor: FurUI.Theme.darkMode ? Qt.lighter(FurUI.Theme.alternateBackgroundColor, 1.1)
                                                       : Qt.darker(FurUI.Theme.alternateBackgroundColor, 1.2)

    property color borderColor: Qt.rgba(FurUI.Theme.highlightColor.r,
                                        FurUI.Theme.highlightColor.g,
                                        FurUI.Theme.highlightColor.b, 0.5)

    property color flatHoveredColor: Qt.rgba(FurUI.Theme.highlightColor.r,
                                             FurUI.Theme.highlightColor.g,
                                             FurUI.Theme.highlightColor.b, 0.2)
    property color flatPressedColor: Qt.rgba(FurUI.Theme.highlightColor.r,
                                             FurUI.Theme.highlightColor.g,
                                             FurUI.Theme.highlightColor.b, 0.25)

    contentItem: IconLabel {
        text: control.text
        font: control.font
        icon: control.icon
        color: !control.enabled ? control.FurUI.Theme.disabledTextColor : control.flat ? FurUI.Theme.highlightColor : FurUI.Theme.textColor
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignCenter
    }

    background: Item {
        implicitWidth: (FurUI.Units.iconSizes.medium * 3) + FurUI.Units.largeSpacing
        implicitHeight: FurUI.Units.iconSizes.medium + FurUI.Units.smallSpacing

        Rectangle {
            id: _flatBackground
            anchors.fill: parent
            radius: FurUI.Theme.mediumRadius
            border.width: 1
            border.color: control.enabled ? control.activeFocus ? FurUI.Theme.highlightColor : "transparent"
                                          : "transparent"
            visible: control.flat

            color: {
                if (!control.enabled)
                    return FurUI.Theme.alternateBackgroundColor

                if (control.pressed)
                    return control.flatPressedColor

                if (control.hovered)
                    return control.flatHoveredColor

                return Qt.rgba(FurUI.Theme.highlightColor.r,
                               FurUI.Theme.highlightColor.g,
                               FurUI.Theme.highlightColor.b, 0.1)
            }
        }

        Rectangle {
            id: _background
            anchors.fill: parent
            radius: FurUI.Theme.mediumRadius
            border.width: 1
            visible: !control.flat
            border.color: control.enabled ? control.activeFocus ? FurUI.Theme.highlightColor : "transparent"
                                          : "transparent"

            color: {
                if (!control.enabled)
                    return FurUI.Theme.alternateBackgroundColor

                if (control.pressed)
                    return control.pressedColor

                if (control.hovered)
                    return control.hoveredColor

                return FurUI.Theme.alternateBackgroundColor
            }
        }
    }
}
