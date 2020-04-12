pragma Singleton
import QtQuick 2.12

Item
{
    id: root
    property Item theme: theme_loader.item
    property Item background: theme.background
    property Item fonts: theme.fonts

    onThemeChanged: ThemeController.set_theme_qml_object(root)
    Loader
    {
        id: theme_loader
        source: ThemeController.theme_url
    }
}
