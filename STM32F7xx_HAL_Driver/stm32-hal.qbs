import qbs

Product {
    name: "STM32-HAL"
    type: "staticlibrary"
    Depends {name: "cpp"}
    Depends {name: "configurations"}
    Depends {name: "CMSIS"}

    cpp.optimization: "small"
    cpp.commonCompilerFlags: ["-Wno-unused-parameter"]
    cpp.includePaths: ["Inc"]

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: ["Inc"]
    }

    files: [
        "Inc/**",
        "Src/**",
    ]
}
