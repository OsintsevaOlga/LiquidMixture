#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <calc.h>
int main(int argc, char *argv[])
{
    qmlRegisterType<Calc>("Calc", 1, 0, "Calc");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}


