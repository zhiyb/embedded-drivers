import qbs

Project {
    name: "CMSIS"

    references: [
        "devices.qbs",
        "DSP_Lib"
    ]

    Product {
        name: "CMSIS"
        type: "staticlibrary"
        Depends {name: "cpp"}
        Depends {name: "CMSIS-DEVICE"}
        cpp.optimization: "small"
        cpp.includePaths: ["Include"]

        Export {
            Depends {name: "cpp"}
            Depends {name: "CMSIS-DEVICE"}
            cpp.includePaths: ["Include"]
        }

        Group {
            name: "stm32f4"
            condition: project.device.startsWith("stm32f4")
            files: [
                "Include/core_cm4.h",
                /*"Device/ST/STM32F4xx/Include/stm32f401xc.h",
                "Device/ST/STM32F4xx/Include/stm32f401xe.h",
                "Device/ST/STM32F4xx/Include/stm32f405xx.h",
                "Device/ST/STM32F4xx/Include/stm32f407xx.h",
                "Device/ST/STM32F4xx/Include/stm32f410cx.h",
                "Device/ST/STM32F4xx/Include/stm32f410rx.h",
                "Device/ST/STM32F4xx/Include/stm32f410tx.h",
                "Device/ST/STM32F4xx/Include/stm32f411xe.h",
                "Device/ST/STM32F4xx/Include/stm32f415xx.h",
                "Device/ST/STM32F4xx/Include/stm32f417xx.h",
                "Device/ST/STM32F4xx/Include/stm32f427xx.h",
                "Device/ST/STM32F4xx/Include/stm32f437xx.h",
                "Device/ST/STM32F4xx/Include/stm32f439xx.h",
                "Device/ST/STM32F4xx/Include/stm32f446xx.h",
                "Device/ST/STM32F4xx/Include/stm32f469xx.h",
                "Device/ST/STM32F4xx/Include/stm32f479xx.h",*/
                "Device/ST/STM32F4xx/Include/stm32f4xx.h",
                "Device/ST/STM32F4xx/Include/system_stm32f4xx.h",
                /*"Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xc.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xe.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f405xx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f407xx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f410cx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f410rx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f410tx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f411xe.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f415xx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f417xx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f427xx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f437xx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f439xx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f446xx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f469xx.s",
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f479xx.s",*/
                "Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c",
            ]
        }

        Group {
            name: "stm32f429"
            condition: project.device.startsWith("stm32f429")
            files: [
                "Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f429xx.s",
                "Device/ST/STM32F4xx/Include/stm32f429xx.h",
            ]
        }

        Group {
            name: "stm32f7"
            condition: project.device.startsWith("stm32f7")
            files: [
                "Include/core_cm7.h",
                "Device/ST/STM32F7xx/Include/stm32f7xx.h",
                "Device/ST/STM32F7xx/Include/system_stm32f7xx.h",
                "Device/ST/STM32F7xx/Source/Templates/system_stm32f7xx.c",
            ]
        }

        Group {
            name: "stm32f745"
            condition: project.device.startsWith("stm32f745")
            files: [
                "Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f745xx.s",
                "Device/ST/STM32F7xx/Include/stm32f745xx.h",
            ]
        }
        Group {
            name: "stm32f746"
            condition: project.device.startsWith("stm32f746")
            files: [
                "Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.s",
                "Device/ST/STM32F7xx/Include/stm32f746xx.h",
            ]
        }
        Group {
            name: "stm32f756"
            condition: project.device.startsWith("stm32f756")
            files: [
                "Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f756xx.s",
                "Device/ST/STM32F7xx/Include/stm32f756xx.h",
            ]
        }

        files: [
            /*"Include/cmsis_armcc.h",
            "Include/cmsis_armcc_V6.h",*/
            "Include/cmsis_gcc.h",
            "Include/core_cmFunc.h",
            "Include/core_cmInstr.h",
            "Include/core_cmSimd.h",
            /*"Include/core_sc000.h",
            "Include/core_sc300.h",*/
        ]
    }
}
