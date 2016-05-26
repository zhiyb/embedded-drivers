import qbs

Product {
    name: "CMSIS-DSP"
    type: "staticlibrary"
    Depends {name: "cpp"}
    Depends {name: "CMSIS"}
    cpp.optimization: "fastest"
    files: ["Source/*/*.c"]
}
