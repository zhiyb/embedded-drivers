import qbs

Project {
    property string driversDir: "../Drivers"
    property string device: "STM32F103C8T6"
    property bool build_CMSIS_DSP: false

    references: [
        driversDir + "/CMSIS/cmsis.qbs",
        driversDir + "/STM32F1xx_HAL_Driver",
    ]

    Product {
        name: "configurations"

        Export {
            Depends {name: "cpp"}
            cpp.includePaths: ["Inc"]

            Properties {
                condition: qbs.buildVariant == "release"
                cpp.optimization: "small"
            }
        }

        files: [
            "Inc/stm32f1xx_hal_conf.h",
        ]
    }

    CppApplication {
        Depends {name: "CMSIS"}
        Depends {name: "STM32-HAL"}
        Depends {name: "configurations"}
        cpp.linkerScripts: ["STM32F103C8_FLASH.ld"]
        cpp.includePaths: ["Inc"]

        files: [
            "Src/main.c",
        ]
    }
}
