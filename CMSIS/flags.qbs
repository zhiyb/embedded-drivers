import qbs

Product {
    name: "CMSIS-FLAGS"
    Export {
        Depends {name: "cpp"}

        cpp.commonCompilerFlags: ["-ffunction-sections", "-fdata-sections",
            "-fno-common", "-fno-strict-aliasing",
            //"--specs=nosys.specs",
        ]
        cpp.linkerFlags: [/*"-nostartfiles", "-nostdlib",*/
            //"--specs=nosys.specs",
            "-static", /*"-lc",*/ /*"-lm",*/ /*"-lgcc",*/
            "-Wl,--gc-sections",
        ]
        cpp.includePaths: [
            "Include"
        ]
        cpp.defines: [
            "__weak=__attribute__((weak))", "__packed=__attribute__((__packed__))"
        ]
    }
}
