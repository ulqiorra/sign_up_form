#include "application_controller.h"

#include <QDebug>

#include <src/controllers/theme/theme_controller.h>

ApplicationControllerShared application_controller;

ApplicationController::ApplicationController()
    : _theme_controller(std::make_shared<ThemeController>())
{

}

void ApplicationController::initialize() noexcept
{
    _theme_controller->initialize();
}

ThemeControllerShared ApplicationController::get_theme_controller() const noexcept
{
    return _theme_controller;
}
