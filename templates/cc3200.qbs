import qbs

Project {
    property string cc3200sdk: "../../Drivers/cc3200-sdk/"
    property string moduleDir: "../modules/"

    property string target: "NONOS"
    property int uart0_baud: 115200

    references: [
        cc3200sdk,
        cc3200sdk + "driverlib",
        cc3200sdk + "simplelink",
        moduleDir + "common",
        moduleDir + "uart0",
    ]

    CppApplication {
        Depends {name: "common"}
        Depends {name: "uart0"}
        Depends {name: "cc3200-sdk"}
        Depends {name: "cc3200-sdk-driverlib"}
        Depends {name: "cc3200-sdk-simplelink"}

        cpp.optimization: "small"
        cpp.commonCompilerFlags: ["-Wno-char-subscripts"]
        cpp.linkerScripts: ["cc3200.ld"]

        files: [
            "cc3200.ld",
            "device.c",
            "device.h",
            "events.c",
            "fs.c",
            "fs.h",
            "global.h",
            "main.c",
            "startup_gcc.c",
            "wlan.c",
            "wlan.h",
        ]
    }
}
