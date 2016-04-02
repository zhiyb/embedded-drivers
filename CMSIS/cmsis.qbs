import qbs

Project {
    name: "CMSIS"

    references: [
        "flags.qbs",
        "DSP_Lib",
        "Device/ST/STM32F1xx",
        "Device/ST/STM32F4xx",
        "Device/ST/STM32F7xx",
    ]

    Product {
        name: "CMSIS"
        Export {
            Depends {
                name: "CMSIS-STM32F1"
                condition: project.device.startsWith("STM32F1")
            }
            Depends {
                name: "CMSIS-STM32F4"
                condition: project.device.startsWith("STM32F4")
            }
            Depends {
                name: "CMSIS-STM32F7"
                condition: project.device.startsWith("STM32F7")
            }
        }

        files: [
            "Include/*.h",
        ]
    }
}
