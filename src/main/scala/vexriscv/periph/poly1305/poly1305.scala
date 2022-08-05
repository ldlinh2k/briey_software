package vexriscv.periph.poly1305

import spinal.core._
import spinal.lib._
class poly1305() extends BlackBox {
   val io = new Bundle {
  
     val clk = in Bool()
     val reset = in Bool()

     val cs = in Bool()
     val we = in Bool()
     val address = in UInt (8 bits)
     val write_data = in UInt (32 bits)
     val read_data = out Bits (32 bits)
   }

   mapCurrentClockDomain(clock=io.clk, reset = io.reset)
   // Remove io_ prefix
   noIoPrefix()
 }