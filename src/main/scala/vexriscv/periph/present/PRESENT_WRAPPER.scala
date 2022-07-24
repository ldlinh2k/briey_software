package vexriscv.periph.present

import spinal.core._
import spinal.lib._
class PRESENT_WRAPPER() extends BlackBox {
   val io = new Bundle {
  
     val clk = in Bool()
     val iReset = in Bool()

     val iChipselect_n = in Bool()
     val iWrite_n = in Bool()
     val iRead_n = in Bool()
     val iAddress = in UInt (4 bits)
     val idat = in UInt (32 bits)
     val odat = out Bits (32 bits)
   }

   mapCurrentClockDomain(clock=io.clk, reset = io.iReset)
   // Remove io_ prefix
   noIoPrefix()
 }