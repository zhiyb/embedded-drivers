import qbs

Product {
    name: "CMSIS-STM32F1"
    type: "staticlibrary"
    condition: project.device.startsWith("STM32F1")
    Depends {name: "cpp"}
    Depends {name: "CMSIS-FLAGS"}
    property var mcuFlags: ["-mthumb", "-mcpu=cortex-m3"]
    property var defines
    cpp.includePaths: ["Include"]
    cpp.commonCompilerFlags: product.mcuFlags
    cpp.linkerFlags: product.mcuFlags
    cpp.defines: ["ARM_MATH_CM3"].concat(defines)

    Properties {
        condition: (project.device.search("STM32F103.8") != -1) ||
                   (project.device.search("STM32F103.B") != -1)
        defines: ["STM32F103xB"]
    }

    Export {
        Depends {name: "cpp"}
        Depends {name: "CMSIS-FLAGS"}
        cpp.includePaths: ["Include"]
        cpp.commonCompilerFlags: product.mcuFlags
        cpp.linkerFlags: product.mcuFlags
        cpp.defines: ["ARM_MATH_CM3"].concat(product.defines)
    }

    Group {
        name: "STM32F103x8 STM32F103xB"
        condition: (project.device.search("STM32F103.8") != -1) ||
                   (project.device.search("STM32F103.B") != -1)
        files: [
            "Include/stm32f103xb.h",
            "Source/Templates/gcc/startup_stm32f103xb.s",
        ]
    }

    files: [
        "Include/stm32f1xx.h",
        "Include/system_stm32f1xx.h",
        "Source/Templates/system_stm32f1xx.c",
    ]
}
