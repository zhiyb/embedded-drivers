import qbs

Project {
    name: "CMSIS"

    references: [
        "flags.qbs",
        "Device/device.qbs",
        "DSP_Lib",
    ]

    Product {
        name: "CMSIS"

        Export {
            Depends {name: "CMSIS-DEVICE"}
        }

        files: [
            "Include/*.h",
        ]
    }
}
