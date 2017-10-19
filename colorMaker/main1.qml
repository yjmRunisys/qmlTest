import QtQuick 2.5
import QtQuick.Window 2.2
//import an.qt.ColorMaker 1.0
import QtQuick.Controls 1.4
//使用C++注册的对象例子
/*
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

    Component.onCompleted: {
        colorMaker.color = Qt.rgba(0,180,120,255);
        colorMaker.setAlgorithm(ColorMaker.LinearIncrease);
        changeAlgorithm(colorAlgorithm,colorMaker.algorithm());
    }

    Rectangle{
        width:360;
        width:360;

        ColorMaker{
            id:colorMaker;
            color:Qt.green;
        }
    }
}*/

Rectangle{
    width:360;
    height:360;
    color:"red"

    Text{
        id:timeLabel;
        anchors.left:parent.left;
        anchors.leftMargin: 4;
        anchors.top:parent.top;
        anchors.topMargin: 4;
        font.pixelSize: 26;
    }

//    ColorMaker{
//        id:colorMaker;
//        color:Qt.rgba(0,255,0,0)/*Qt.green*/;
//    }


    Rectangle{
        id:colorRect;
        anchors.centerIn: parent;
        width:200;
        height:200;
        color:"blue";
    }

    Button{
        id:start;
        text:"start";
        anchors.left:parent.left;
        anchors.leftMargin: 4;
        anchors.bottom:parent.bottom;
        anchors.topMargin: 4;
        onClicked:{
            colorMaker.start();
        }

    }

    Button{
        id:stop;
        text:"stop";
        anchors.left:start.right;
        anchors.leftMargin: 4;
        anchors.bottom:parent.bottom;
        anchors.topMargin: 4;
        onClicked:{
            colorMaker.stop();
        }
    }

    function changeAlgorithm(button,algorithm)
    {
        switch(algorithm)
        {
        case 0:
            button.text = "RandomRGB";
            break;
        case 1:
            button.text = "RandomRed";
            break;
        case 2:
            button.text = "RandomGreen";
            break;
        case 3:
            button.text = "RandomBlue";
            break;
        case 4:
            button.text = "LinearIncrease";
            break;

        }
    }

    Button{
        id:colorAlgorithm;
        text:"RandomRGB";
        anchors.left:stop.right;
        anchors.leftMargin: 4;
        anchors.bottom:start.bottom;
        onClicked:{
            var algorithm = (colorMaker.algorithm() + 1)%5;
            changeAlgorithm(colorAlgorithm,algorithm);
            colorMaker.setAlgorithm(algorithm);
        }
    }

    Button{
        id:quit;
        text:"quit";
        anchors.left:colorAlgorithm.right;
        anchors.leftMargin: 4;
        anchors.bottom:start.bottom;
        onClicked:{
           Qt.quit();

        }
    }

    Component.onCompleted: {
        colorMaker.color = Qt.rgba(0,180,120,255);
//        colorMaker.setAlgorithm(ColorMaker.LinearIncrease);
        colorMaker.setAlgorithm(2);
        changeAlgorithm(colorAlgorithm,colorMaker.algorithm());
    }

    Connections{
        target:colorMaker;
        onCurrentTime:{
            timeLabel.text = strTime;
            timeLabel.color = colorMaker.timeColor;
        }
    }

    Connections{
        target:colorMaker;
        onColorChanged:{
            colorRect.color = color;
        }
    }
}
