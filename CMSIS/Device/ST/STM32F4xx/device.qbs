import qbs

Product {
    name: "CMSIS-DEVICE"

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: ["Include"]
        cpp.commonCompilerFlags: ["-mthumb", "-mcpu=cortex-m4", "-mfloat-abi=hard", "-mfpu=fpv4-sp-d16"]
        cpp.linkerFlags: ["-mthumb", "-mcpu=cortex-m4", "-mfloat-abi=hard", "-mfpu=fpv4-sp-d16"]
        cpp.defines: {
            var def = ["ARM_MATH_CM4", "__FPU_PRESENT=1U"];
            if (project.device.search("STM32F429") != -1)
                def.push("STM32F429xx");
            return def;
        }
    }

    Group {
        name: "STM32F429xx"
        condition: project.device.search("STM32F429") != -1
        files: ["Include/stm32f429xx.h"]
    }

    files: [
        "Include/stm32f4xx.h",
        "Include/system_stm32f4xx.h",
    ]
}
