import QtQuick 2.1
import QtQuick.Window 2.2
import QtQuick.Templates 2.3 as T
import FurUI 1.0 as FurUI

T.Label {
    id: control

    verticalAlignment: lineCount > 1 ? Text.AlignTop : Text.AlignVCenter

    activeFocusOnTab: false
    // Text.NativeRendering is broken on non integer pixel ratios
    // renderType: Window.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering

    renderType: FurUI.Theme.renderType

    font.capitalization: FurUI.Theme.defaultFont.capitalization
    font.family: FurUI.Theme.fontFamily
    font.italic: FurUI.Theme.defaultFont.italic
    font.letterSpacing: FurUI.Theme.defaultFont.letterSpacing
    font.pointSize: FurUI.Theme.fontSize
    font.strikeout: FurUI.Theme.defaultFont.strikeout
    font.underline: FurUI.Theme.defaultFont.underline
    font.weight: FurUI.Theme.defaultFont.weight
    font.wordSpacing: FurUI.Theme.defaultFont.wordSpacing
    color: FurUI.Theme.textColor
    linkColor: FurUI.Theme.linkColor

    opacity: enabled ? 1 : 0.6

    Accessible.role: Accessible.StaticText
    Accessible.name: text
}
