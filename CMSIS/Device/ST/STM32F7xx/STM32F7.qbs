import qbs

Product {
    name: "CMSIS-STM32F7"
    type: "staticlibrary"
    condition: project.device.startsWith("STM32F7")
    Depends {name: "cpp"}
    Depends {name: "CMSIS-FLAGS"}
    property var mcuFlags: ["-mthumb", "-mcpu=cortex-m7", "-mfloat-abi=hard", "-mfpu=fpv5-sp-d16"]
    property var defines
    cpp.includePaths: ["Include"]
    cpp.commonCompilerFlags: product.mcuFlags
    cpp.linkerFlags: product.mcuFlags
    cpp.defines: ["STM32", "STM32F7", "ARM_MATH_CM7", "__FPU_PRESENT=1"].concat(product.defines)

    Properties {
        condition: project.device.startsWith("STM32F745")
        defines: ["STM32F745xx"]
    }
    Properties {
        condition: project.device.startsWith("STM32F746")
        defines: ["STM32F746xx"]
    }
    Properties {
        condition: project.device.startsWith("STM32F756")
        defines: ["STM32F756xx"]
    }

    Export {
        Depends {name: "cpp"}
        Depends {name: "CMSIS-FLAGS"}
        cpp.includePaths: ["Include"]
        cpp.commonCompilerFlags: product.mcuFlags
        cpp.linkerFlags: product.mcuFlags
        cpp.defines: ["STM32", "STM32F7", "ARM_MATH_CM7", "__FPU_PRESENT=1"].concat(product.defines)
    }

    Group {
        name: "STM32F745"
        condition: project.device.startsWith("STM32F745")
        files: [
            "Include/stm32f745xx.h",
            "Source/Templates/gcc/startup_stm32f745xx.s",
        ]
    }
    Group {
        name: "STM32F746"
        condition: project.device.startsWith("STM32F746")
        files: [
            "Include/stm32f746xx.h",
            "Source/Templates/gcc/startup_stm32f746xx.s",
        ]
    }
    Group {
        name: "STM32F756"
        condition: project.device.startsWith("STM32F756")
        files: [
            "Include/stm32f756xx.h",
            "Source/Templates/gcc/startup_stm32f756xx.s",
        ]
    }

    files: [
        "Include/stm32f7xx.h",
        "Include/system_stm32f7xx.h",
        "Source/Templates/system_stm32f7xx.c",
    ]
}
