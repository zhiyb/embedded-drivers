import qbs

Product {
    type: "staticlibrary"
    name: "cc3200-sdk-simplelink_extlib-provisioninglib"
    Depends {name: "cpp"}
    cpp.optimization: "small"
    cpp.includePaths: ["."]

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: ["."]
    }

    files: [
        "*",
    ]
}
