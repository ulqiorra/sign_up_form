QT += quick

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        src/controllers/account/account_controller.cpp \
        src/controllers/application/application_controller.cpp \
        src/controllers/settings/settings_controller.cpp \
        src/controllers/theme/theme_controller.cpp \
        src/main.cpp \
        src/models/types/types_registrar.cpp \
        src/models/user/user.cpp

RESOURCES += src/qml.qrc \
    res/res.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

extracopy.files += $$PWD/res/countries.xml
extracopy.path = $$OUT_PWD

COPIES += extracopy

HEADERS += \
    src/controllers/account/account_controller.h \
    src/controllers/application/application_controller.h \
    src/controllers/settings/settings_controller.h \
    src/controllers/theme/theme_controller.h \
    src/models/types/types_registrar.h \
    src/models/user/user.h

RC_ICONS = res/app_icon.ico
