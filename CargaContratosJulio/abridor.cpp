#include "abridor.h"
Abridor::Abridor(QObject *parent)
    : QObject{parent}
{
    /*
    QFile file;                                         // atributos privados

    file.setFileName("texto.txt");                      // abrirArchivo
    file.open(QIODevice::WriteOnly | QIODevice::Text);  // abrirArchivo


    QTextStream out;                                    // atributos privados
    out.setDevice(&file);                               // abrirArchivo

    out << "The magic number is: " << 49 << "\n";       // escribir

    file.close();                                       // cerrarArchivo
    */
}

void Abridor::escribir(int x, int y)
{
    texto << x << ", " << y << Qt::endl;
}

void Abridor::abrirArchivo(QString nombre)
{
    manejador.setFileName(nombre);

    manejador.open(QFile::WriteOnly | QFile::Text);

    texto.setDevice(&manejador);
}

void Abridor::cerrarArchivo()
{
    manejador.close();
}

bool Abridor::archivoAbierto()
{
    return manejador.isOpen();
}




void Abridor::abrirPlantilla(QString pURL,QStringList &partesPlantilla,QVector< QVector<int> > &indicesCampos)
{
    QFile plantilla;


    plantilla.setFileName(pURL);

    if ( plantilla.open(QIODevice::ReadOnly) ) {
        QString texto( plantilla.readAll() );

        plantilla.close();


        partesPlantilla = texto.split("###");

        int campoParaCompletar = 1;

        if (texto.startsWith("###")) {
            campoParaCompletar = 0;
        }

        for (; campoParaCompletar < partesPlantilla.size(); campoParaCompletar += 2) {
            int indiceCampo = encontrar(partesPlantilla[campoParaCompletar]);

            if (indiceCampo >= 0) {
                indicesCampos[indiceCampo].append(campoParaCompletar);
            }
            else {
                //campos->agregarCampo(partesPlantilla[campoParaCompletar]);

                QVector<int> nuevoVector;
                nuevoVector.append(campoParaCompletar);

                indicesCampos.append(nuevoVector);
            }
        }

        //ui->statusbar->showMessage("Plantilla cargada correctamente.", 3000);
    }

    else {
        //ui->statusbar->showMessage("Plantilla no especificada.", 3000);
    }
}

int Abridor::encontrar(QString label)
{

    /*int indice = -1;

    for (int i = 0; i < campos.size(); i++) {
        if (campos[i]->getLabelText() == label) {
            indice = i;
        }
    }

    return indice;*/
}
void Abridor::agregarCampo(QString label)
{
    //QFile campo;




    /*campos.append(new Campo(this));

    campos[campos.size() - 1]->setLabelText(label);

    layout->addWidget(campos[campos.size() - 1]);*/
}


