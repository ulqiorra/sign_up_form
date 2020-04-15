#include "types_registrar.h"

#include <QQmlApplicationEngine>

#include <src/models/user/user.h>
#include <src/controllers/settings/settings_controller.h>
#include <src/controllers/account/account_controller.h>

void TypesRegistrar::register_types() noexcept
{
    qmlRegisterType<User>("SignUpForm.Model", 1, 0, "User");
    qmlRegisterType<SettingsController>("SignUpForm.Model", 1, 0, "SettingsController");
    qmlRegisterType<AccountController>("SignUpForm.Model", 1, 0, "AccountController");

    qmlRegisterSingletonType(QUrl("qrc:/models/properties/ViewsProperties.qml"), "SignUpForm.View", 1, 0, "ViewsProperties");
    qmlRegisterSingletonType(QUrl("qrc:/controllers/theme/Theme.qml"), "SignUpForm.View", 1, 0, "Theme");
}
