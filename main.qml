import QtQuick 2.9
import QtQuick.Controls 1.4
import Calc 1.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    Calc{
     id: caa
    }


    id: bigWindow
    visible: true
    width: 640
    height: 480

    Column {
        id: leftColumn

        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        anchors.margins: 30
        spacing: 50

        ComboBox { /// combobox
            id: box1
            visible: true
            model: ListModel {
                id: cbItem1
                ListElement {text: "water cleared"; color: "black"}
                ListElement {text: "water salt"; color: "black"}
                ListElement {text: "milk"; color: "black"}
                ListElement {text: "alcohol"; color: "black"}
                ListElement {text: "honey"; color: "black"}
                ListElement {text: "oil sunflower"; color: "black"}
                ListElement {text: "oil olive"; color: "black"}
                ListElement {text: "ice"; color: "black"}
                ListElement {text: "sugar"; color: "black"}
                ListElement {text: "beer"; color: "black"}
                ListElement {text: "egg white"; color: "black"}
            }
            width: 200
            onCurrentIndexChanged: console.debug(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).color)
        }

        RowLayout {
            id: littleVolume

            width: parent.width
            spacing: 15

            TextField {   // поле для жидкости
                id: vol1
                Layout.fillWidth: true
                placeholderText: qsTr("Enter volume of liquid")
            }

            Label { // подпись к жидкости
                text: qsTr("litres")
            }
        }

        Rectangle {    // кнопка Add
            width: 100
            height: width * 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#488cd5"
            radius: 10
            visible: true
            Text{
                text: "Add"
                color: "black"
                anchors.centerIn: parent
                font.pointSize: 10
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (vol1.text != "")
                        caa.add(box1.currentText, vol1.text)
                }
            }
        }

        RowLayout {
        id: bigVolume

        width: parent.width
        spacing: 15

        TextField {   // поле для суммы жидкостей
            id: bigvol
            Layout.fillWidth: true
            placeholderText: qsTr("Enter volume of sum liquids")
        }

        Label {   // подпись к сумме жидкостей
            text: qsTr("litres")
        }

        }

        Rectangle { // кнопка calculate
            id: calc
            visible: true
            width: 100
            height: width * 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#488cd5"
            radius: 10
            Text {
                id: textAddElem
                text: "Calculate"
                font.pointSize: 10
                anchors.centerIn: parent
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (bigvol.text != "")
                        caa.calcu(bigvol.text)
                }
            }
        }
    }

    Column {
    id: rightColumn

    anchors.left: horizontalCenter
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    anchors.margins: 30
    spacing: 30

    Rectangle {    // список жидкостей
        width: 200
        height: 300
        visible: true
        color: "light gray"
        ListView {
            anchors.fill: parent
            anchors.margins: 6
            spacing: 12
            model: caa.spis
            delegate: Text {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                text: modelData.name + " " + modelData.volume.toFixed(2)
            }
        }
    }

    Rectangle {   // результат
    id: fortext
    visible: true
    width: 100
    height: width * 0.7
    color: "light gray"
    Text {
        text: caa.result.toFixed(3)
    }
    }

    }
}
