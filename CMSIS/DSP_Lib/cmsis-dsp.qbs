import qbs

Product {
    name: "CMSIS-DSP"
    type: "staticlibrary"
    condition: project.build_CMSIS_DSP
    Depends {name: "cpp"}
    Depends {name: "CMSIS"}
    cpp.optimization: "fastest"

    files: [
        "Source/*/*.c",
    ]
}
