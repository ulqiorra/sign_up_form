#include "application_controller.h"

#include <src/controllers/theme/theme_controller.h>
#include <src/controllers/settings/settings_controller.h>
#include <src/controllers/account/account_controller.h>

ApplicationControllerShared application_controller;

ApplicationController::ApplicationController()
    : _theme_controller(std::make_shared<ThemeController>())
    , _settings_controller(std::make_shared<SettingsController>())
    , _account_controller(std::make_shared<AccountController>())
{

}

void ApplicationController::initialize() noexcept
{
    _theme_controller->initialize();
    _settings_controller->initialize();
}

ThemeControllerShared ApplicationController::get_theme_controller() const noexcept
{
    return _theme_controller;
}

SettingsController* ApplicationController::get_settings_controller_raw() noexcept
{
    return _settings_controller.get();
}

AccountController* ApplicationController::get_account_controller_raw() noexcept
{
    return _account_controller.get();
}
