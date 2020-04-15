#pragma once

#include <QObject>

class ThemeController;
class SettingsController;
class AccountController;
using ThemeControllerShared = std::shared_ptr<ThemeController>;
using SettingsControllerShared = std::shared_ptr<SettingsController>;
using AccountControllerShared = std::shared_ptr<AccountController>;

class ApplicationController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(SettingsController* settings_controller READ get_settings_controller_raw NOTIFY changed)
    Q_PROPERTY(AccountController* account_controller   READ get_account_controller_raw  NOTIFY changed)

public:
    explicit ApplicationController();
    void initialize() noexcept;

    ThemeControllerShared get_theme_controller() const noexcept;
    SettingsController* get_settings_controller_raw() noexcept;
    AccountController* get_account_controller_raw() noexcept;

signals:
    void changed();

private:
    ThemeControllerShared _theme_controller;
    SettingsControllerShared _settings_controller;
    AccountControllerShared _account_controller;
};

using ApplicationControllerShared = std::shared_ptr<ApplicationController>;
extern ApplicationControllerShared application_controller;
