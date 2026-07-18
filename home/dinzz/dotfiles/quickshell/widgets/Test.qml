import QtQuick

import "../theme"

Rectangle {

    width: 300
    height: 120

    color: Theme.colors.background

    radius: Theme.colors.radius

    Text {

        anchors.centerIn: parent

        text: Theme.dark ? "Dark" : "Light"

        color: Theme.colors.text

    }

    MouseArea {

        anchors.fill: parent

        onClicked: Theme.toggle()

    }

}
