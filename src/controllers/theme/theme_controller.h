#pragma once

#include <QObject>
#include <QMap>

struct Theme
{
    QStringView name;
    QStringView qml_url;
};

class ThemeController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString theme_name READ get_current_theme_name NOTIFY themeChanged)
    Q_PROPERTY(QString theme_url READ get_current_theme_url NOTIFY themeChanged)

public:
    explicit ThemeController();
    void initialize() noexcept;

    void register_theme(const Theme& theme) noexcept;
    QString get_current_theme_name() const noexcept;
    QString get_current_theme_url() const noexcept;
    Q_INVOKABLE void change_theme(const QString& theme_name) noexcept;
    Q_INVOKABLE QStringList get_available_theme_names() const noexcept;
    Q_INVOKABLE void set_theme_qml_object(QObject* theme_qml_object) noexcept;

signals:
    void themeChanged();
    void themeObjectChanged();
    void themeInitialized();

private:
    void register_themes() noexcept;
    QString get_default_theme_name() const noexcept;

private:
    bool _theme_initialized = false;
    QObject* _theme_qml_object = nullptr;
    QMap<QString, Theme> _themes;
    QString _current_theme_name;
};
