#ifndef ABRIDOR_H
#define ABRIDOR_H

#include <QObject>
#include <QFile>
#include <QTextStream>

class Abridor : public QObject
{
    Q_OBJECT
public:
    explicit Abridor(QObject *parent = nullptr);


    Q_INVOKABLE void escribir(int x, int y);
    Q_INVOKABLE void abrirArchivo(QString nombre);
    Q_INVOKABLE void cerrarArchivo();
    Q_INVOKABLE bool archivoAbierto();
    Q_INVOKABLE void abrirPlantilla(QString pURL,QStringList &partesPlantilla,QVector< QVector<int> > &indicesCampos);
    Q_INVOKABLE int encontrar(QString label);
    void agregarCampo(QString label);



private:
    QFile manejador;

    QTextStream texto;



};

#endif // FILEHANDLER_H
