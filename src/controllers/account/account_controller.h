#pragma once

#include <QObject>

#include <src/models/user/user.h>

class AccountController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(User* current_user READ get_current_user NOTIFY userChanged)

    using UserUniquePtr = std::unique_ptr<User>;

public:
    explicit AccountController() = default;

    Q_INVOKABLE void sign_up(const QString& first_name, const QString& last_name,
                             const QString& country, const QString& email,
                             const QString& pass) noexcept;
    Q_INVOKABLE void log_out() noexcept;

    User* get_current_user() noexcept;

signals:
    void userChanged();

private:
    UserUniquePtr _current_user;
};

