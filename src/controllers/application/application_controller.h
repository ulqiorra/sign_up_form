#pragma once

#include <QObject>

class ThemeController;
using ThemeControllerShared = std::shared_ptr<ThemeController>;

class ApplicationController : public QObject
{
    Q_OBJECT
public:
    explicit ApplicationController();
    void initialize() noexcept;

    ThemeControllerShared get_theme_controller() const noexcept;

signals:
    void changed();

private:
    ThemeControllerShared _theme_controller;
};

using ApplicationControllerShared = std::shared_ptr<ApplicationController>;
extern ApplicationControllerShared application_controller;
