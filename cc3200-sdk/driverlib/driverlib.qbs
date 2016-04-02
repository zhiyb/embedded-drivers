import qbs

Product {
    type: "staticlibrary"
    name: "cc3200-sdk-driverlib"
    cpp.optimization: "small"
    Depends {name: "cc3200-sdk"}

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: ["."]
    }

    files: [
        "*",
    ]
}
