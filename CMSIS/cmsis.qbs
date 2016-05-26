import qbs

Project {
    name: "CMSIS"

    references: [
        "DSP_Lib",
        "Device/ST/STM32F1xx",
        "Device/ST/STM32F4xx",
        "Device/ST/STM32F7xx",
    ]

    Product {
        name: "CMSIS"

        Export {
            Depends {name: "CMSIS-STM32F1"
                condition: project.device.startsWith("STM32F1")
                required: false}
            Depends {name: "CMSIS-STM32F4"
                condition: project.device.startsWith("STM32F4")
                required: false}
            Depends {name: "CMSIS-STM32F7"
                condition: project.device.startsWith("STM32F7")
                required: false}

            Depends {name: "cpp"}
            cpp.positionIndependentCode: false
            cpp.commonCompilerFlags: [
                "-ffunction-sections", "-fdata-sections",
                "-fno-common", "-fno-strict-aliasing",
            ]
            cpp.linkerFlags: [
                /*"-nostartfiles", "-nostdlib",*/
                "--specs=nosys.specs",
                "-static", /*"-lc",*/ /*"-lm",*/ /*"-lgcc",*/
                "-Wl,--gc-sections",
            ]
            cpp.includePaths: ["Include"]
        }

        files: ["Include/*.h"]
    }
}
