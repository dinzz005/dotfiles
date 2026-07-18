pragma Singleton

import QtQuick

import "."

QtObject {

    id: root

    property bool dark: true

    readonly property var colors: dark ? Dark : Light

    signal themeChanged()

    function toggle() {

        dark = !dark

        themeChanged()
    }

    function setDark() {

        if (!dark) {

            dark = true

            themeChanged()

        }
    }

    function setLight() {

        if (dark) {

            dark = false

            themeChanged()

        }
    }
}
