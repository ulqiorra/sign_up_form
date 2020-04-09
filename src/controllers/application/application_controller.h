#pragma once

#include <QObject>

class ApplicationController : public QObject
{
    Q_OBJECT
public:
    explicit ApplicationController();

    void initialize() noexcept;

private:

};

using ApplicationControllerShared = std::shared_ptr<ApplicationController>;
extern ApplicationControllerShared application_controller;
