import qbs

Project {
    name: "CMSIS-DEVICES"

    Product {
        name: "CMSIS-DEVICE"
        Export {
            Depends {name: "cpp"}
            Depends {
                name: "CMSIS-STM32"
                condition: project.device.startsWith("stm32")
            }

            cpp.commonCompilerFlags: ["-ffunction-sections", "-fdata-sections",
                "-fno-common", "-fno-strict-aliasing",
                //"--specs=nosys.specs"
            ]
            cpp.linkerFlags: [/*"-nostartfiles", "-nostdlib",*/
                //"--specs=nosys.specs",
                "-static", /*"-lc",*/ /*"-lm",*/ /*"-lgcc",*/
                "-Wl,--gc-sections"
            ]
            cpp.defines: [
                "__weak=__attribute__((weak))", "__packed=__attribute__((__packed__))"
            ]
        }
    }

    Product {
        name: "CMSIS-STM32"
        condition: project.device.startsWith("stm32")

        Export {
            Depends {name: "cpp"}
            Depends {
                name: "CMSIS-STM32F4"
                condition: project.device.startsWith("stm32f4")
            }
            Depends {
                name: "CMSIS-STM32F7"
                condition: project.device.startsWith("stm32f7")
            }
            cpp.defines: ["STM32"]
        }
    }

    Product {
        name: "CMSIS-STM32F4"
        condition: project.device.startsWith("stm32f4")
        property var mcuFlags: ["-mthumb", "-mcpu=cortex-m4", "-mfloat-abi=hard", "-mfpu=fpv4-sp-d16"]
        property var defines

        Properties {
            condition: project.device.startsWith("stm32f429")
            defines: ["STM32F429xx"]
        }

        Export {
            Depends {name: "cpp"}
            cpp.includePaths: ["Device/ST/STM32F4xx/Include"]
            cpp.commonCompilerFlags: product.mcuFlags
            cpp.linkerFlags: product.mcuFlags
            cpp.defines: ["STM32F4", "ARM_MATH_CM4", "__FPU_PRESENT=1U"].concat(product.defines)
        }
    }

    Product {
        name: "CMSIS-STM32F7"
        condition: project.device.startsWith("stm32f7")
        property var mcuFlags: ["-mthumb", "-mcpu=cortex-m7", "-mfloat-abi=hard", "-mfpu=fpv5-sp-d16"]
        property var defines

        Properties {
            condition: project.device.startsWith("stm32f745")
            defines: ["STM32F745xx"]
        }
        Properties {
            condition: project.device.startsWith("stm32f746")
            defines: ["STM32F746xx"]
        }
        Properties {
            condition: project.device.startsWith("stm32f756")
            defines: ["STM32F756xx"]
        }

        Export {
            Depends {name: "cpp"}
            cpp.includePaths: ["Device/ST/STM32F7xx/Include"]
            cpp.commonCompilerFlags: product.mcuFlags
            cpp.linkerFlags: product.mcuFlags
            cpp.defines: ["STM32F7", "ARM_MATH_CM7", "__FPU_PRESENT=1"].concat(product.defines)
        }
    }
}
