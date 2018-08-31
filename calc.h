#ifndef CALC_H
#define CALC_H

#include <QObject>
#include <QMap>
#include <QVector>
#include <QVariant>
#include <math.h>
#include <QDebug>

class Calc : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList spis MEMBER spis NOTIFY spisChanged)
    Q_PROPERTY(float result MEMBER result NOTIFY resultChanged)

QMap<QString, float> Table;

QVariantList spis;
public:
Calc(QObject* = nullptr);
float result = 0;
public slots:
    void add(QString name, float volume);
    void calcu(float genV);
signals:
    void spisChanged();
    void resultChanged();
};


#endif // CALC_H
