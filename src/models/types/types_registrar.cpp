#include "types_registrar.h"

#include <QQmlApplicationEngine>

#include <src/models/user/user.h>

void TypesRegistrar::register_types() noexcept
{
    qmlRegisterType<User>("SignUpForm.Model", 1, 0, "User");

    qmlRegisterSingletonType(QUrl("qrc:/models/properties/ViewsProperties.qml"), "SignUpForm.View", 1, 0, "ViewsProperties");
    qmlRegisterSingletonType(QUrl("qrc:/controllers/theme/Theme.qml"), "SignUpForm.View", 1, 0, "Theme");
}
