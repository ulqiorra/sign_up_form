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
    qDebug() << "initializing app controller";
}
