#include "theme_controller.h"

#include <array>

namespace
{
static constexpr auto light_theme_name = QStringViewLiteral("light");
static constexpr auto dark_theme_name = QStringViewLiteral("dark");

static constexpr std::array<Theme, 2> global_themes =
{
    Theme{light_theme_name, QStringViewLiteral("qrc:/views/themes/LightTheme.qml")},
    Theme{dark_theme_name,  QStringViewLiteral("qrc:/views/themes/DarkTheme.qml")}
};
}

ThemeController::ThemeController()
{
    register_themes();
}

void ThemeController::initialize() noexcept
{
    change_theme(get_default_theme_name());
}

void ThemeController::register_theme(const Theme& theme) noexcept
{
    _themes.insert(theme.name.toString(), theme);
}

QString ThemeController::get_current_theme_name() const noexcept
{
    return _current_theme_name;
}

QString ThemeController::get_current_theme_url() const noexcept
{
    return _themes[_current_theme_name].qml_url.toString();
}

void ThemeController::change_theme(const QString& theme_name) noexcept
{
    if (_current_theme_name != theme_name
            && _themes.contains(theme_name))
    {
        _current_theme_name = theme_name;
        themeChanged();
    }
}

QStringList ThemeController::get_available_theme_names() const noexcept
{
    return _themes.keys();
}

void ThemeController::set_theme_qml_object(QObject* theme_qml_object) noexcept
{
    if (!theme_qml_object)
    {
        return;
    }

    _theme_qml_object = theme_qml_object;
    if (!_theme_initialized)
    {
        _theme_initialized = true;
        emit themeInitialized();
    }
    else
    {
        emit themeObjectChanged();
    }
}

void ThemeController::register_themes() noexcept
{
    for (const auto& theme: global_themes)
    {
        register_theme(theme);
    }
}

QString ThemeController::get_default_theme_name() const noexcept
{
    return light_theme_name.toString();
}
