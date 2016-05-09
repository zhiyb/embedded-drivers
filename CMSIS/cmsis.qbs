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
        name: "CMSIS-FLAGS"
        Export {
            Depends {name: "cpp"}

            cpp.positionIndependentCode: false
            cpp.commonCompilerFlags: ["-ffunction-sections", "-fdata-sections",
                "-fno-common", "-fno-strict-aliasing",
            ]
            cpp.linkerFlags: [/*"-nostartfiles", "-nostdlib",*/
                "--specs=nosys.specs",
                "-static", /*"-lc",*/ /*"-lm",*/ /*"-lgcc",*/
                "-Wl,--gc-sections",
            ]
            cpp.includePaths: [
                "Include"
            ]
            cpp.defines: [
                "__weak=__attribute__((weak))", "__packed=__attribute__((__packed__))"
            ]
        }
    }

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
