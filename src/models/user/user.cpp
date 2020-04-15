#include "user.h"

User::User(const QString& first_name, const QString& last_name,
           const QString& country, const QString& email,
           const QString& pass)
    : _first_name(first_name)
    , _last_name(last_name)
    , _country(country)
    , _email(email)
    , _password(pass)
{

}

const QString& User::get_first_name() const noexcept
{
    return _first_name;
}

const QString& User::get_last_name() const noexcept
{
    return _last_name;
}

const QString& User::get_country() const noexcept
{
    return _country;
}

const QString& User::get_email() const noexcept
{
    return _email;
}

const QString& User::get_password() const noexcept
{
    return _password;
}
