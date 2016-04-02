import qbs

Product {
    name: "cc3200-sdk"
    property var mcuflags: ["-mcpu=cortex-m4", "-mthumb", "-msoft-float", "-mfloat-abi=soft"]

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: [".", "inc"]
        cpp.commonCompilerFlags: ["-ffunction-sections", "-fdata-sections",
            "--specs=nosys.specs",
            "-Wno-unused-parameter", "-Wno-unused-variable"].concat(product.mcuflags)
        cpp.linkerFlags: ["-nostartfiles", "-nostdlib", "-static", "-lc", "-lm", "-lgcc",
            "--specs=nosys.specs",
            "-Wl,--gc-sections"].concat(product.mcuflags)
        cpp.defines: ["SYS_CLK=80000000", "gcc"]
        cpp.entryPoint: "ResetISR"
    }

    files: [
        "inc/*.h",
    ]
}
