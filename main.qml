import QtQuick 2.9
import QtQuick.Controls 1.4
import Calc 1.0

ApplicationWindow {
    Calc{
     id: caa
    }


    id: bigWindow
    visible: true
    width: 640
    height: 480

    Rectangle {
        id: calc
        visible: true
        width: 100
        height: width * 0.5
        x: 50
        y: 330
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

    ComboBox {
        id: box1
        visible: true
        model: ListModel {
            id: cbItem1
            ListElement {text: "vater cleared"; color: "black"}
            ListElement {text: "vater salt"; color: "black"}
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
        x: 30
        y: 30
        onCurrentIndexChanged: console.debug(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).color)
    }


    Rectangle {
    id: fortext
    visible: true
    width: 100
    height: width * 0.7
    x: 350
    y: 350
    color: "light gray"
    Text {
    text: caa.result.toFixed(3)
    }
    }

    TextField {
        id: vol1
        placeholderText: qsTr("Enter volume of liquid")
        x: 30
        y: 80
    }



    TextField {
        id: bigvol
        x: 30
        y: 270
        placeholderText: qsTr("Enter volume of sum liquids")
    }

    Text {
        text: qsTr("litres")
        x: 200
        y: 85
    }

    Text {
        text: qsTr("litres")
        x: 200
        y: 275
    }
    Rectangle {
        width: 100
        height: width * 0.5
        x: 50
        y: 130
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
    Rectangle {
        width: 200
        height: 300
        x: 350
        y: 30
        visible: true
        color: "light gray"
        ListView {
            anchors.fill: parent
            spacing: 5
            model: caa.spis
            delegate: Text {
                text: modelData.name + " " + modelData.volume
            }
        }
    }
}
