#include "account_controller.h"

void AccountController::sign_up(const QString& first_name, const QString& last_name,
                                const QString& country, const QString& email,
                                const QString& pass) noexcept
{
    try
    {
        _current_user = std::make_unique<User>(first_name, last_name, country, email, pass);
        emit userChanged();
    }
    catch (...)
    {
        assert(!"Account controller failed to create user");
    }
}

void AccountController::log_out() noexcept
{
    _current_user.reset();
    emit userChanged();
}

User* AccountController::get_current_user() noexcept
{
    return _current_user.get();
}
