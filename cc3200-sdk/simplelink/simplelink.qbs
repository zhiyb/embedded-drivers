import qbs

Product {
    type: "staticlibrary"
    name: "cc3200-sdk-simplelink"
    cpp.optimization: "small"
    cpp.includePaths: [".", "include"]
    cpp.defines: ["SL_FULL"]
    cpp.commonCompilerFlags: [
        "-Wno-missing-braces",
        "-Wno-missing-field-initializers",
        "-Wno-strict-aliasing",
    ]

    Depends {name: "cc3200-sdk"}
    Depends {name: "cc3200-sdk-driverlib"}
    Depends {name: "cc3200-sdk-simplelink_extlib-provisioninglib"}

    Properties {
        condition: project.target != "NONOS"
        cpp.defines: outer.concat(["SL_PLATFORM_MULTI_THREADED"])
    }

    Export {
        Depends {name: "cpp"}
        Depends {name: "cc3200-sdk-simplelink_extlib-provisioninglib"}
        cpp.includePaths: ["include"]
        cpp.defines: product.cpp.defines
    }

    files: [
        "cc_pal.c",
        "cc_pal.h",
        "include/*",
        "source/*",
        "user.h",
    ]
}
