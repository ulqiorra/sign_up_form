#pragma once

#include <QObject>

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString first_name READ get_first_name NOTIFY changed)
    Q_PROPERTY(QString last_name  READ get_last_name  NOTIFY changed)
    Q_PROPERTY(QString country    READ get_country    NOTIFY changed)
    Q_PROPERTY(QString email      READ get_email      NOTIFY changed)
    Q_PROPERTY(QString password   READ get_password   NOTIFY changed)

public:
    explicit User() = default;
    explicit User(const QString& first_name, const QString& last_name,
                  const QString& country, const QString& email,
                  const QString& pass);

    const QString& get_first_name() const noexcept;
    const QString& get_last_name() const noexcept;
    const QString& get_country() const noexcept;
    const QString& get_email() const noexcept;
    const QString& get_password() const noexcept;

signals:
    void changed();

private:
    QString _first_name;
    QString _last_name;
    QString _country;
    QString _email;
    QString _password;
};

