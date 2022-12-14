import QtQuick

Item {
    id: campo

    property alias colorInput: rectanguloCampo.color
    property alias labelInput: rectanguloCampoLabel.text
    property alias inputText: rectanguloCampoInput.text
    signal textInputCambio(text: string)

    height: rectanguloCampo.height

    Rectangle {
        id: rectanguloCampo

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: 5

        height: 65

        radius: 5

        color: "#EC826C"


        Text {
            id: rectanguloCampoLabel

            text: ""

            height: 20

            anchors.top: parent.top
            anchors.left: parent.left
            verticalAlignment: TextInput.AlignVCenter

            anchors.margins: 5
        }

        Rectangle {
            width: parent.width
            height: 30

            anchors.top: rectanguloCampoLabel.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 5
            radius: 5

            TextInput {
                id: rectanguloCampoInput
                persistentSelection: true

                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter

                anchors.leftMargin: 5

                onTextChanged: {
                    campo.textInputCambio(rectanguloCampoInput.text)

                }


            }
        }
    }

}
