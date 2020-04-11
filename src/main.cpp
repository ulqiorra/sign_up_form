#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <src/controllers/application/application_controller.h>
#include <src/models/types/types_registrar.h>

namespace
{
constexpr auto app_name = QStringViewLiteral("SignUpForm");
constexpr auto main_qml_path = QStringViewLiteral("qrc:/main.qml");
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setApplicationName(app_name.toString());
    app.setApplicationDisplayName(app_name.toString());

    application_controller = std::make_shared<ApplicationController>();
    application_controller->initialize();

    TypesRegistrar types_registrar;
    types_registrar.register_types();

    QQmlApplicationEngine engine;
    const QUrl url(main_qml_path.toString());
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
