#pragma once

#include <QObject>

class TypesRegistrar
{
public:
    explicit TypesRegistrar() = default;

    void register_types() noexcept;
};

