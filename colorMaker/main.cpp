#include <QGuiApplication>
#include<QQuickView>
#include<QtQml>
#include <colormaker.h>


#if 0
//注册类ColorMaker
    int main(int argc, char *argv[])
    {
        QGuiApplication app(argc, argv);
        qmlRegisterType<ColorMaker>("an.qt.ColorMaker",1,0,"ColorMaker");

        QQuickView viewer;
        viewer.setResizeMode(QQuickView::SizeRootObjectToView);
        viewer.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
        viewer.show();

        return app.exec();
    }
#else

//注册为对象colorMaker
    int main(int argc, char *argv[])
    {
       QGuiApplication app(argc, argv);
       QQuickView viewer;
       viewer.setResizeMode(QQuickView::SizeRootObjectToView);
       viewer.rootContext()->setContextProperty("colorMaker",new ColorMaker);
       viewer.setSource(QUrl(QStringLiteral("qrc:/main1.qml")));
       viewer.show();

       return app.exec();
    }

//#include <QQmlApplicationEngine>
//int main(int argc, char *argv[])
//{
//   QGuiApplication app(argc, argv);
//   QQmlApplicationEngine engine;
//   engine.rootContext()->setContextProperty("colorMaker",new ColorMaker);
//   engine.load(QUrl(QStringLiteral("qrc:/main1.qml")));

//    return app.exec();
//}





#endif


//#include <QQmlApplicationEngine>
//#include <colormaker.h>

//int main(int argc, char *argv[])
//{
//    QGuiApplication app(argc, argv);
//    qmlRegisterType<ColorMaker>("an.qt.ColorMaker",1,0,"ColorMaker");

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

//    return app.exec();
//}
