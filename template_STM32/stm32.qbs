import qbs

Project {
    property string driversDir: "embedded-drivers"
    property string device: "STM32F429ZIT6"
    property bool cmsis_dsp: false

    references: [
        driversDir + "/CMSIS/cmsis.qbs",
    ]

    Product {
        type: "application"
        Depends {name: "cpp"}
        Depends {name: "CMSIS"}
        cpp.includePaths: ["."]
        cpp.linkerFlags: ["-nostartfiles"]
        //cpp.linkerFlags: ["-nostdlib"]
        cpp.assemblerName: "gcc"
        cpp.assemblerFlags: ["-c"]

        Properties {
            condition: qbs.buildVariant == "release"
            cpp.optimization: "small"
        }

        files: [
            "*.h",
            "*.c",
            "*.s",
        ]

        Group {
            name: "Linker script"
            files: ["STM32F429ZI_FLASH.ld"]
            fileTags: ["linkerscript"]
        }
    }
}
