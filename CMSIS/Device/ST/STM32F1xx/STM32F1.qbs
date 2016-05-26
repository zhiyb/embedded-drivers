import qbs

Product {
    name: "CMSIS-STM32F1"
    condition: project.device.search("STM32F1") != -1

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: ["Include"]
        cpp.commonCompilerFlags: ["-mthumb", "-mcpu=cortex-m3", "-mfloat-abi=soft", "-msoft-float"]
        cpp.linkerFlags: ["-mthumb", "-mcpu=cortex-m3", "-mfloat-abi=soft", "-msoft-float"]
        cpp.defines: {
            var def = ["ARM_MATH_CM3"];
            if ((project.device.search("STM32F103.8") != -1) ||
                (project.device.search("STM32F103.B") != -1))
                def.push("STM32F103xB");
            return def;
        }
    }

    Group {
        name: "STM32F103x8 STM32F103xB"
        condition: (project.device.search("STM32F103.8") != -1) ||
                   (project.device.search("STM32F103.B") != -1)
        files: ["Include/stm32f103xb.h"]
    }

    files: [
        "Include/stm32f1xx.h",
        "Include/system_stm32f1xx.h",
    ]
}
