    val apbDecoder = Apb3Decoder(
      master = apbBridge.io.apb,
      slaves = List(
        gpioACtrl.io.apb        -> (0x00000, 4 kB),
        gpioBCtrl.io.apb        -> (0x01000, 4 kB),
        apbPrinceBridge.io.apb  -> (0x02000, 1 kB),        
        uartCtrl.io.apb         -> (0x10000, 4 kB),
        timerCtrl.io.apb        -> (0x20000, 4 kB),
        vgaCtrl.io.apb          -> (0x30000, 4 kB)
      )
    )
