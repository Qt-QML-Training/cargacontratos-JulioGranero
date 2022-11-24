import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Dialogs
import templatehandler.interface





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
                onClicked: {
                    loadFileDialog.open();
                }
            }
            MenuItem{
                id:guardar
                text: "&Guardar plantilla"
                onClicked: {
                    for(var i = 0; i< listModel.count; i++){
                        //console.log("Holaktal, " + JSON.stringify(listModel.get(i)));
                        templateHandler.completarCampo(listModel.get(i).labelModel, listModel.get(i).inputText);
                    }
                    templateHandler.guardarPDF(saveFileDialog.url);

                }


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
    ListModel {
        id: listModel
    }

    Rectangle {
          anchors.fill: parent

          ListView{
              id:listView
              visible: false
              anchors.fill: parent
              anchors.centerIn: parent
              anchors.leftMargin: 10
              spacing: 10
              anchors.rightMargin: 10

              delegate: CampoInput {
                  labelInput: labelModel
                  inputText: model.inputText

                  width: ventana.width-20
                  onTextInputCambio: (texto)=>{
                                         console.log(texto);
                                         model.inputText = texto;
                                     }
              }
          }
          TemplateHandler{
              id: templateHandler
          }

          FileDialog{
              id: loadFileDialog

              onAccepted: {

                  var url = loadFileDialog.selectedFile.toString();

                  url = url.split("///")[1];

                  templateHandler.cargarTemplate(url);


                  var labels = templateHandler.obtenerCampos();
                  listView.visible = true;


                  for(var i=0; i< labels.length; i++) {
                      listModel.append({labelModel: labels[i], inputText: ""});

                  }
                  listView.model = listModel;
                  console.log(listModel.count);
              }
              Component.onCompleted: visible = false
          }
          FileDialog{
              id: saveFileDialog
              nameFilters: ["*.pdf"]
              fileMode: FileDialog.SaveFile

              property var url
              onAccepted: {
                  url = saveFileDialog.selectedFile();
                  }
              }
            Boton {
                id: botonAbrir
                texto: "ABRIR"
                anchors.right: botonGuardar.left
                anchors.bottom: parent.bottom
                anchors.margins: 5
                color: "#76EC6C"
                onClicked:{
                    loadFileDialog.open();
                }
            }
            Boton {
                id: botonGuardar
                texto: "GUARDAR"
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 5
                color: "#6CE8EC"
                MouseArea{
                    anchors.fill:parent
                    onClicked:{
                        for(var i = 0; i< listModel.count; i++){
                            //console.log("Holaktal, " + JSON.stringify(listModel.get(i)));
                            templateHandler.completarCampo(listModel.get(i).labelModel, listModel.get(i).inputText);
                        }
                        templateHandler.guardarPDF(saveFileDialog.url);
                    }
                }
            }

    }
}
