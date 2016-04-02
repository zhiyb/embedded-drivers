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
        "Class/AUDIO/Inc",
        "Class/CDC/Inc",
        "Class/CustomHID/Inc",
        "Class/DFU/Inc",
        "Class/HID/Inc",
        "Class/MSC/Inc",
    ]
    cpp.commonCompilerFlags: ["-Wno-unused-parameter"]
    cpp.includePaths: includePaths

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: product.includePaths
    }

    Group {
        name: "HID"
        condition: project.usb_device_class.startsWith(name)
        files: ["Class/" + name + "/**"]
    }

    Group {
        name: "AUDIO"
        condition: project.usb_device_class.startsWith(name)
        files: ["Class/" + name + "/**"]
    }

    Group {
        name: "CDC"
        condition: project.usb_device_class.startsWith(name)
        files: ["Class/" + name + "/**"]
    }

    Group {
        name: "CustomHID"
        condition: project.usb_device_class.startsWith(name)
        files: ["Class/" + name + "/**"]
    }

    Group {
        name: "DFU"
        condition: project.usb_device_class.startsWith(name)
        files: ["Class/" + name + "/**"]
    }

    Group {
        name: "MSC"
        condition: project.usb_device_class.startsWith(name)
        files: ["Class/" + name + "/**"]
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
