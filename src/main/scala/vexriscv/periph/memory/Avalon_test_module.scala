package vexriscv.periph.memory

import spinal.core._
import spinal.lib._
class Avalon_test_module() extends BlackBox {
   val io = new Bundle {
  
     val iClk = in Bool()
     val iReset = in Bool()

     val iChipselect = in Bool()
     val iWrite_n = in Bool()
     val iRead_n = in Bool()
     val iAddress = in UInt (2 bits)
     val iData = in UInt (32 bits)
     val oData = out Bits (32 bits)
   }

   mapCurrentClockDomain(clock=io.iClk, reset = io.iReset)
   // Remove io_ prefix
   noIoPrefix()
 }