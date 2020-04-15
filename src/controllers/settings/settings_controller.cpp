#include "settings_controller.h"

#include <QFile>
#include <QDebug>

namespace
{
static const QStringList preset_countries = { "Russia", "USA", "China" };
static constexpr auto xml_path = "countries.xml";
static constexpr auto country_key = "country";
static constexpr auto country_name_key = "name";
}

void SettingsController::initialize() noexcept
{
    _available_countries.clear();
    QFile file(xml_path);
    if (file.open(QIODevice::ReadOnly))
    {
        _xml_reader.setDevice(&file);
        _xml_reader.readNext();

        while (!_xml_reader.isEndDocument())
        {
                QString name = _xml_reader.name().toString();

                if (name == country_key)
                {
                    _xml_reader.readNext();
                    name = _xml_reader.name().toString();

                    while (name != country_key)
                    {
                        if (name == country_name_key)
                        {
                            _available_countries.append(_xml_reader.readElementText());
                        }

                        _xml_reader.readNext();
                        name = _xml_reader.name().toString();
                    }
                }

                _xml_reader.readNext();
        }
        if (_xml_reader.hasError())
        {
            assert(!"XML error");
            _available_countries = preset_countries;
        }

        file.close();
    }
    else
    {
        assert(!"Settings controller file open error");
        _available_countries = preset_countries;
    }
}

const QStringList& SettingsController::get_available_countries() const noexcept
{
    return _available_countries;
}
