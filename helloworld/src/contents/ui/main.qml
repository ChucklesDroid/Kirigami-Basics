import QtQuick.Controls 2.15 as Controls
import org.kde.kirigami 2.20 as Kirigami

Kirigami.ApplicationWindow {
    id: root

    title: i18nc("@title:window", "Hello World")

    pageStack.initialPage: Kirigami.Page {
        Controls.Label {
            anchors.centerIn: parent
            text: i18n("Hello World")
        }
    }
}