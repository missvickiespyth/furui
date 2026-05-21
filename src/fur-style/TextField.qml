/*
 * Copyright 2017 Marco Martin <mart@kde.org>
 * Copyright 2017 The Qt Company Ltd.
 *
 * GNU Lesser General Public License Usage
 * Alternatively, this file may be used under the terms of the GNU Lesser
 * General Public License version 3 as published by the Free Software
 * Foundation and appearing in the file LICENSE.LGPLv3 included in the
 * packaging of this file. Please review the following information to
 * ensure the GNU Lesser General Public License version 3 requirements
 * will be met: https://www.gnu.org/licenses/lgpl.html.
 *
 * GNU General Public License Usage
 * Alternatively, this file may be used under the terms of the GNU
 * General Public License version 2.0 or later as published by the Free
 * Software Foundation and appearing in the file LICENSE.GPL included in
 * the packaging of this file. Please review the following information to
 * ensure the GNU General Public License version 2.0 requirements will be
 * met: http://www.gnu.org/licenses/gpl-2.0.html.
 */


import QtQuick 2.6
import QtQuick.Window 2.1
import QtQuick.Controls 2.3 as Controls
import QtQuick.Templates 2.3 as T
import FurUI 1.0 as FurUI

T.TextField {
    id: control

    implicitWidth: Math.max(200,
                            placeholderText ? placeholder.implicitWidth + leftPadding + rightPadding : 0)
                            || contentWidth + leftPadding + rightPadding + FurUI.Units.extendBorderWidth
    implicitHeight: Math.max(contentHeight + topPadding + bottomPadding,
                             background ? background.implicitHeight : 0,
                             placeholder.implicitHeight + topPadding + bottomPadding + FurUI.Units.extendBorderWidth)

    // padding: 6
    leftPadding: FurUI.Units.smallSpacing + FurUI.Units.extendBorderWidth
    rightPadding: FurUI.Units.smallSpacing + FurUI.Units.extendBorderWidth

    //Text.NativeRendering is broken on non integer pixel ratios
    // renderType: Window.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering
    renderType: FurUI.Theme.renderType

    color: control.enabled ? FurUI.Theme.textColor : FurUI.Theme.disabledTextColor
    selectionColor: FurUI.Theme.highlightColor
    selectedTextColor: FurUI.Theme.highlightedTextColor
    selectByMouse: true

    horizontalAlignment: Text.AlignLeft
    verticalAlignment: TextInput.AlignVCenter

    opacity: control.enabled ? 1.0 : 0.5

 	// cursorDelegate: CursorDelegate { }

    Controls.Label {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: FurUI.Theme.textColor
        opacity: 0.4
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        wrapMode: Text.NoWrap
	}

    background: Rectangle {
        implicitWidth: (FurUI.Units.iconSizes.medium * 3) + FurUI.Units.smallSpacing + FurUI.Units.extendBorderWidth
        implicitHeight: FurUI.Units.iconSizes.medium + FurUI.Units.smallSpacing + FurUI.Units.extendBorderWidth
        // color: control.activeFocus ? Qt.lighter(FurUI.Theme.backgroundColor, 1.4) : FurUI.Theme.backgroundColor
        color: FurUI.Theme.alternateBackgroundColor
        radius: FurUI.Theme.smallRadius

        border.width: 1
        border.color: control.activeFocus ? FurUI.Theme.highlightColor : FurUI.Theme.alternateBackgroundColor

        // Rectangle {
        //     id: _border
        //     anchors.fill: parent
        //     color: "transparent"
        //     border.color: control.activeFocus ? Qt.rgba(FurUI.Theme.highlightColor.r,
        //                                                 FurUI.Theme.highlightColor.g,
        //                                                 FurUI.Theme.highlightColor.b, 0.2) : "transparent"
        //     border.width: FurUI.Units.extendBorderWidth
        //     radius: FurUI.Theme.smallRadius + FurUI.Units.extendBorderWidth

        //     Behavior on border.color {
        //         ColorAnimation {
        //             duration: 50
        //         }
        //     }
        // }

        // Rectangle {
        //     anchors.fill: parent
        //     anchors.margins: FurUI.Units.extendBorderWidth
        //     radius: FurUI.Theme.smallRadius
        //     color: FurUI.Theme.backgroundColor
        //     border.color: control.activeFocus ? FurUI.Theme.highlightColor : Qt.tint(FurUI.Theme.textColor, Qt.rgba(FurUI.Theme.backgroundColor.r, FurUI.Theme.backgroundColor.g, FurUI.Theme.backgroundColor.b, 0.7))
        //     border.width: 1
        // }
    }
}
