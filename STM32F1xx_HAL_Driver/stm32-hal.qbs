import qbs

Product {
    name: "STM32-HAL"
    type: "staticlibrary"
    Depends {name: "cpp"}
    Depends {name: "configurations"}
    Depends {name: "CMSIS"}

    cpp.optimization: "small"
    cpp.commonCompilerFlags: ["-Wno-unused-parameter"]
    cpp.defines: ["USE_HAL_DRIVER"]
    cpp.includePaths: ["Inc"]

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: ["Inc"]
        cpp.defines: ["USE_HAL_DRIVER"]
    }

    files: [
        "Inc/Legacy/stm32_hal_legacy.h",
        "Inc/stm32f1xx_hal.h",
        "Inc/stm32f1xx_hal_adc.h",
        "Inc/stm32f1xx_hal_adc_ex.h",
        "Inc/stm32f1xx_hal_can.h",
        "Inc/stm32f1xx_hal_can_ex.h",
        "Inc/stm32f1xx_hal_cec.h",
        "Inc/stm32f1xx_hal_conf_template.h",
        "Inc/stm32f1xx_hal_cortex.h",
        "Inc/stm32f1xx_hal_crc.h",
        "Inc/stm32f1xx_hal_dac.h",
        "Inc/stm32f1xx_hal_dac_ex.h",
        "Inc/stm32f1xx_hal_def.h",
        "Inc/stm32f1xx_hal_dma.h",
        "Inc/stm32f1xx_hal_dma_ex.h",
        "Inc/stm32f1xx_hal_eth.h",
        "Inc/stm32f1xx_hal_flash.h",
        "Inc/stm32f1xx_hal_flash_ex.h",
        "Inc/stm32f1xx_hal_gpio.h",
        "Inc/stm32f1xx_hal_gpio_ex.h",
        "Inc/stm32f1xx_hal_hcd.h",
        "Inc/stm32f1xx_hal_i2c.h",
        "Inc/stm32f1xx_hal_i2s.h",
        "Inc/stm32f1xx_hal_irda.h",
        "Inc/stm32f1xx_hal_iwdg.h",
        "Inc/stm32f1xx_hal_nand.h",
        "Inc/stm32f1xx_hal_nor.h",
        "Inc/stm32f1xx_hal_pccard.h",
        "Inc/stm32f1xx_hal_pcd.h",
        "Inc/stm32f1xx_hal_pcd_ex.h",
        "Inc/stm32f1xx_hal_pwr.h",
        "Inc/stm32f1xx_hal_rcc.h",
        "Inc/stm32f1xx_hal_rcc_ex.h",
        "Inc/stm32f1xx_hal_rtc.h",
        "Inc/stm32f1xx_hal_rtc_ex.h",
        "Inc/stm32f1xx_hal_sd.h",
        "Inc/stm32f1xx_hal_smartcard.h",
        "Inc/stm32f1xx_hal_spi.h",
        "Inc/stm32f1xx_hal_sram.h",
        "Inc/stm32f1xx_hal_tim.h",
        "Inc/stm32f1xx_hal_tim_ex.h",
        "Inc/stm32f1xx_hal_uart.h",
        "Inc/stm32f1xx_hal_usart.h",
        "Inc/stm32f1xx_hal_wwdg.h",
        "Inc/stm32f1xx_ll_fsmc.h",
        "Inc/stm32f1xx_ll_sdmmc.h",
        "Inc/stm32f1xx_ll_usb.h",
        "Src/stm32f1xx_hal.c",
        "Src/stm32f1xx_hal_adc.c",
        "Src/stm32f1xx_hal_adc_ex.c",
        "Src/stm32f1xx_hal_can.c",
        "Src/stm32f1xx_hal_cec.c",
        "Src/stm32f1xx_hal_cortex.c",
        "Src/stm32f1xx_hal_crc.c",
        "Src/stm32f1xx_hal_dac.c",
        "Src/stm32f1xx_hal_dac_ex.c",
        "Src/stm32f1xx_hal_dma.c",
        "Src/stm32f1xx_hal_eth.c",
        "Src/stm32f1xx_hal_flash.c",
        "Src/stm32f1xx_hal_flash_ex.c",
        "Src/stm32f1xx_hal_gpio.c",
        "Src/stm32f1xx_hal_gpio_ex.c",
        "Src/stm32f1xx_hal_hcd.c",
        "Src/stm32f1xx_hal_i2c.c",
        "Src/stm32f1xx_hal_i2s.c",
        "Src/stm32f1xx_hal_irda.c",
        "Src/stm32f1xx_hal_iwdg.c",
        "Src/stm32f1xx_hal_msp_template.c",
        "Src/stm32f1xx_hal_nand.c",
        "Src/stm32f1xx_hal_nor.c",
        "Src/stm32f1xx_hal_pccard.c",
        "Src/stm32f1xx_hal_pcd.c",
        "Src/stm32f1xx_hal_pcd_ex.c",
        "Src/stm32f1xx_hal_pwr.c",
        "Src/stm32f1xx_hal_rcc.c",
        "Src/stm32f1xx_hal_rcc_ex.c",
        "Src/stm32f1xx_hal_rtc.c",
        "Src/stm32f1xx_hal_rtc_ex.c",
        "Src/stm32f1xx_hal_sd.c",
        "Src/stm32f1xx_hal_smartcard.c",
        "Src/stm32f1xx_hal_spi.c",
        "Src/stm32f1xx_hal_spi_ex.c",
        "Src/stm32f1xx_hal_sram.c",
        "Src/stm32f1xx_hal_tim.c",
        "Src/stm32f1xx_hal_tim_ex.c",
        "Src/stm32f1xx_hal_uart.c",
        "Src/stm32f1xx_hal_usart.c",
        "Src/stm32f1xx_hal_wwdg.c",
        "Src/stm32f1xx_ll_fsmc.c",
        "Src/stm32f1xx_ll_sdmmc.c",
        "Src/stm32f1xx_ll_usb.c",
    ]
}
