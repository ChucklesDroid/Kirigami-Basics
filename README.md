# Motivation behind creating this Repository

It will allow me to learn how to make kirigami apps which in turn will allow me to contribute more actively to KDE.

## Project Structure of Kirigami Application

**_NOTE_** This block structure is limited to KDE applications but you will have to take this into account while creating CMakeLists.txt and resources.qrc files.

Taking a look at simple helloworld application, The general structure will be quite similar to this.
```
helloworld/
|-- CMakeLists.txt
|-- src/
    |-- CMakeLists.txt
    |-- main.cpp
    |-- resources.qrc
    |-- contents/
        |-- ui/
            |-- main.qml
```

In the folder ui is where we will be creating our main QML files.

## Understanding the main.qml file

```
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
```

---
EXPLANATION

* The first line imports the necessary packages.
* Kirigami.ApplicationWindow() -> This is the window that will contain each of our pages, the main sections of our UI.
* pageStack.initialPage: -> This basically sets the first page of our kirigami application.
* Most Kirigami applications are organised as a set of Pages and pageStack is an initial empty stack of pages provided by Kirigami.ApplicationWindow.

## Understanding the main.cpp file

```
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QUrl>
#include <KLocalizedContext>
#include <KLocalizedString>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    KLocalizedString::setApplicationDomain("helloworld");
    QCoreApplication::setOrganizationName(QStringLiteral("KDE"));
    QCoreApplication::setOrganizationDomain(QStringLiteral("kde.org"));
    QCoreApplication::setApplicationName(QStringLiteral("Hello World"));

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
```
---
EXPLANATION

* The backend of the application is usually written in C++
* QApplication 
* QCoreApplication