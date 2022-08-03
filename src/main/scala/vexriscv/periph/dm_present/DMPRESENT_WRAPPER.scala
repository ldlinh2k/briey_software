package vexriscv.periph.dm_present

import spinal.core._
import spinal.lib._
class DMPRESENT_WRAPPER() extends BlackBox {
   val io = new Bundle {
  
     val clk = in Bool()
     val iReset = in Bool()

     val iChipselect_n = in Bool()
     val iWrite_n = in Bool()
     val iRead_n = in Bool()
     val iAddress = in UInt (3 bits)
     val idat = in UInt (32 bits)
     val odat = out Bits (32 bits)
   }

   mapCurrentClockDomain(clock=io.clk, reset = io.iReset)
   // Remove io_ prefix
   noIoPrefix()
 }