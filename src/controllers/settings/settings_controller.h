#pragma once

#include <QObject>
#include <QStringList>
#include <QXmlStreamReader>

class SettingsController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList countries READ get_available_countries NOTIFY countriesChanged)

public:
    explicit SettingsController() = default;
    void initialize() noexcept;

    const QStringList& get_available_countries() const noexcept;

signals:
    void countriesChanged();

private:
    QXmlStreamReader _xml_reader;
    QStringList _available_countries;
};

