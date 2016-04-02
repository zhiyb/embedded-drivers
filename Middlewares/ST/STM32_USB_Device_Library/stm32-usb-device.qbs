import qbs

Product {
    name: "STM32-USB-DEVICE"
    type: "staticlibrary"
    Depends {name: "cpp"}
    Depends {name: "configurations"}
    Depends {name: "CMSIS"}
    Depends {name: "STM32-HAL"}

    property var includePaths: [
        "Core/Inc",
        "Class/HID/Inc",
    ]
    cpp.commonCompilerFlags: ["-Wno-unused-parameter"]
    cpp.includePaths: includePaths

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: product.includePaths
    }

    Group {
        name: "HID"
        files: ["Class/HID/**",]
    }

    files: [
        "Core/Inc/usbd_core.h",
        "Core/Inc/usbd_ctlreq.h",
        "Core/Inc/usbd_def.h",
        "Core/Inc/usbd_ioreq.h",
        "Core/Src/usbd_core.c",
        "Core/Src/usbd_ctlreq.c",
        "Core/Src/usbd_ioreq.c",
    ]
}
