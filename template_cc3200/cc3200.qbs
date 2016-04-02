import qbs

Project {
    property string cc3200sdk: "../Drivers/cc3200-sdk/"

    property string target: "NONOS"

    references: [
        cc3200sdk,
        cc3200sdk + "driverlib",
        cc3200sdk + "simplelink",
    ]

    CppApplication {
        Depends {name: "cc3200-sdk"}
        Depends {name: "cc3200-sdk-driverlib"}
        Depends {name: "cc3200-sdk-simplelink"}

        cpp.optimization: "small"
        cpp.commonCompilerFlags: ["-Wno-char-subscripts"]
        cpp.linkerScripts: ["cc3200.ld"]

        files: [
            "cc3200.ld",
            "main.c",
            "startup_gcc.c",
        ]
    }
}
