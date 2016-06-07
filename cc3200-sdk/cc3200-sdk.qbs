import qbs

Product {
    name: "cc3200-sdk"
    property var mcuflags: ["-mcpu=cortex-m4", "-mthumb", "-msoft-float", "-mfloat-abi=soft"]

    Export {
        Depends {name: "cpp"}
        cpp.positionIndependentCode: false
        cpp.commonCompilerFlags: ["-ffunction-sections", "-fdata-sections",
            "-fno-common", "-fno-strict-aliasing",
            "-Wno-unused-parameter", "-Wno-unused-variable"].concat(product.mcuflags)
        cpp.linkerFlags: ["-static", "--specs=nosys.specs",
            "-Wl,--gc-sections"].concat(product.mcuflags)
        cpp.includePaths: [".", "inc"]
        cpp.defines: ["SYS_CLK=80000000", "gcc"]
        cpp.entryPoint: "ResetISR"
    }

    files: [
        "inc/*.h",
    ]
}
