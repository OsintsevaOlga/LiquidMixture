#include "calc.h"
#include <QDebug>

Calc::Calc(QObject*)
{
    Table.insert("milk", 1.03);
    Table.insert("vater cleared", 1.0);
    Table.insert("vater salt", 1.03);
    Table.insert("honey", 1.35);
    Table.insert("oil sunflower", 0.93);
    Table.insert("alcohol", 0.8);
    Table.insert("ice", 0.9);
    Table.insert("sugar", 1.6);
    Table.insert("beer", 1.04);
    Table.insert("egg white", 1.038);
    Table.insert("oil olive", 0.91);
}

void Calc::add(QString name, float volume)
{
    QVariantMap temp;
    temp["name"] = QVariant::fromValue(name);
    temp["volume"] = QVariant::fromValue(volume);
    spis.push_back(QVariant::fromValue(temp));
    spisChanged();
}

void Calc::calcu(float genV)
{

    float tmp = 0;
    for (int i = 0; i < spis.size(); ++i){
        tmp += spis[i].toMap()["volume"].toFloat() * Table[spis[i].toMap()["name"].toString()];
    }

    result = ((tmp / genV) * 100) / 100;


    resultChanged();
}

