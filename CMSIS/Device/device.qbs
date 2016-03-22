import qbs

Project {
    name: "CMSIS-DEVICE"

    references: [
        "ST/STM32F4xx",
        "ST/STM32F7xx",
    ]

    Product {
        name: "CMSIS-DEVICE"
        Export {
            Depends {
                name: "CMSIS-STM32F7"
                condition: project.device.startsWith("STM32F7")
            }
            Depends {
                name: "CMSIS-STM32F4"
                condition: project.device.startsWith("STM32F4")
            }
        }
    }
}
