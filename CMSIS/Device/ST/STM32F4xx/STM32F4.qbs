import qbs

Product {
    name: "CMSIS-STM32F4"
    type: "staticlibrary"
    condition: project.device.startsWith("STM32F4")
    Depends {name: "cpp"}
    Depends {name: "CMSIS-FLAGS"}
    property var mcuFlags: ["-mthumb", "-mcpu=cortex-m4", "-mfloat-abi=hard", "-mfpu=fpv4-sp-d16"]
    property var defines
    cpp.includePaths: ["Include"]
    cpp.commonCompilerFlags: product.mcuFlags
    cpp.linkerFlags: product.mcuFlags
    cpp.defines: ["STM32", "STM32F4", "ARM_MATH_CM4", "__FPU_PRESENT=1U"].concat(product.defines)

    Properties {
        condition: project.device.startsWith("STM32F429")
        defines: ["STM32F429xx"]
    }

    Export {
        Depends {name: "cpp"}
        Depends {name: "CMSIS-FLAGS"}
        cpp.includePaths: ["Include"]
        cpp.commonCompilerFlags: product.mcuFlags
        cpp.linkerFlags: product.mcuFlags
        cpp.defines: ["STM32", "STM32F4", "ARM_MATH_CM4", "__FPU_PRESENT=1U"].concat(product.defines)
    }

    Group {
        name: "STM32F429"
        condition: project.device.startsWith("STM32F429")
        files: [
            "Include/stm32f429xx.h",
            "Source/Templates/gcc/startup_stm32f429xx.s",
        ]
    }

    files: [
        /*"Include/stm32f401xc.h",
        "Include/stm32f401xe.h",
        "Include/stm32f405xx.h",
        "Include/stm32f407xx.h",
        "Include/stm32f410cx.h",
        "Include/stm32f410rx.h",
        "Include/stm32f410tx.h",
        "Include/stm32f411xe.h",
        "Include/stm32f415xx.h",
        "Include/stm32f417xx.h",
        "Include/stm32f427xx.h",
        "Include/stm32f437xx.h",
        "Include/stm32f439xx.h",
        "Include/stm32f446xx.h",
        "Include/stm32f469xx.h",
        "Include/stm32f479xx.h",*/
        "Include/stm32f4xx.h",
        "Include/system_stm32f4xx.h",
        /*"Source/Templates/gcc/startup_stm32f401xc.s",
        "Source/Templates/gcc/startup_stm32f401xe.s",
        "Source/Templates/gcc/startup_stm32f405xx.s",
        "Source/Templates/gcc/startup_stm32f407xx.s",
        "Source/Templates/gcc/startup_stm32f410cx.s",
        "Source/Templates/gcc/startup_stm32f410rx.s",
        "Source/Templates/gcc/startup_stm32f410tx.s",
        "Source/Templates/gcc/startup_stm32f411xe.s",
        "Source/Templates/gcc/startup_stm32f415xx.s",
        "Source/Templates/gcc/startup_stm32f417xx.s",
        "Source/Templates/gcc/startup_stm32f427xx.s",
        "Source/Templates/gcc/startup_stm32f437xx.s",
        "Source/Templates/gcc/startup_stm32f439xx.s",
        "Source/Templates/gcc/startup_stm32f446xx.s",
        "Source/Templates/gcc/startup_stm32f469xx.s",
        "Source/Templates/gcc/startup_stm32f479xx.s",*/
        "Source/Templates/system_stm32f4xx.c",
    ]
}
