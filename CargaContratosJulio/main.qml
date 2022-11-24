import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Dialogs
import cargacontratosjulio.abridor







ApplicationWindow {
    id: ventana
    width: 640
    height: 480
    visible: true
    color: "#9994AB"
    title: "Carga contratos"
    menuBar: MenuBar{
        Menu{
            title: "&Archivo"
            MenuItem{
                id:abrir
                text: "&Abrir plantilla"
            }
            MenuItem{
                id:guardar
                text: "&Guardar plantilla"
            }

            MenuSeparator{

            }
            MenuItem{
                text: "&Salir"
                onTriggered:{
                    Qt.quit();
                }
            }
        }
    }
    Rectangle{
        id: visualizadorTexto
        height:parent.height
        width:parent.width
        anchors.top: parent.top
        anchors.bottom: botonAbrir.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        color: "white"
        radius: 10
        TextField {
            id: textoContrato            
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 20
            //anchors.verticalCenter: parent.verticalCenter

        }


    }


    FileDialog{
        id: fileDialog
        title:"seleccione"
        nameFilters: ["All files (*)"]
        onAccepted: {

            textoContrato.text = fileDialog.selectedFile;


            archivador.abrirPlantilla(textoContrato.text);



            //leerArchivo();



        }
        onRejected:{
            textoContrato.text = "CANCELADO"

        }
        Component.onCompleted: visible = false
    }



    Boton {
        id: botonAbrir
        texto: "ABRIR"
        anchors.right: botonGuardar.left
        anchors.bottom: parent.bottom
        anchors.margins: 5
        onClicked:{

            fileDialog.open();
            //mostrarTexto();

            //abrirArchivo();
            //leerArchivo();
            //archivador.escribir();


        }

    }
    Boton {
        id: botonGuardar
        texto: "GUARDAR"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
        onClicked:{

            fileDialog.fileMode = FileDialog.SaveFile;
            fileDialog.open();





        }
    }
    /*function abrirArchivo() {
        fileDialog.open();
        archivador.abrirPlantilla(fileDialog.selectedFile);

        //textoContrato.text = lFile.text;



    }
    function leerArchivo() {
        abrirPlantilla(fileDialog.selectedFile, Labels , QVectorListIndices);


    }*/



    /*CampoInput {
        id: nombre

        width: parent.width

        label: "Nombre"

        color: Qt.lighter(ventana.color)
    }
    Text {
        id:textoPlantilla
        text:""
    }*/
    ManejadorArchivos{
        id: archivador
    }




}
