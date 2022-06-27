package vexriscv.plugin

import spinal.core._
import spinal.lib._
import vexriscv.{DecoderService, Stageable, VexRiscv}


/**
 *  This is a "memory_16x32" (4 bits address - 16 addresses x 32 bits data) 
 *  test plugin attach to Briey SoC, instancing a Verilog using Avalon bus
 * 
 */


class Memory16x32Plugin extends Plugin[VexRiscv]{

  //Define the concept of IS_MEMORY_16x32 signals, which specify if the current instruction is destined for ths plugin
  object IS_MEMORY_16x32 extends Stageable(Bool)
  object MEMORY_16x32_CALC extends Stageable(Bits(32 bits))

  val mapping = new {
    def WRITE_READ = 25     // 1 write - 0 read
  }


  override def setup(pipeline: VexRiscv): Unit = { 
    import pipeline.config._

    val decoderService = pipeline.service(classOf[DecoderService])

    decoderService.addDefault(IS_MEMORY_16x32, False)
    decoderService.add(
      key = M"000000-----------010-----0001011",  //Bit pattern of the instruction
      /**           ^
       *            |
       *       "WRITE_READ" bit
       */

      //Decoding specification when the 'key' pattern is recognized in the instruction
      List(                                       
        IS_MEMORY_16x32          -> True,
        REGFILE_WRITE_VALID      -> True, //Enable the register file write
        BYPASSABLE_EXECUTE_STAGE -> False, //Notify the hazard management unit that the instruction result is already accessible in the EXECUTE stage (Bypass ready)
        BYPASSABLE_MEMORY_STAGE  -> False, //Same as above but for the memory stage
        RS1_USE                  -> True, //Notify the hazard management unit that this instruction use the RS1 value
        RS2_USE                  -> True  //Same than above but for RS2.
      )
    )

  }

  override def build(pipeline: VexRiscv): Unit = {
    import pipeline._
    import pipeline.config._




    // #################### Start of EXECUTE STAGE
    val onExecute =execute plug new Area {
      import execute._
      
      val dataIn    = execute.input(RS1).asUInt   //32 bits UInt value of the regfile[RS1]
      val addressIn = execute.input(RS2).asUInt   //32 bits UInt value of the regfile[RS2]


      val MEMORY_16x32_INST = new Area {
        val MEMORY_16x32_module = new MEMORY_16x32

        MEMORY_16x32_module.io.iChipSelect  := input(IS_MEMORY_16x32)

        MEMORY_16x32_module.io.iWrite       := input(INSTRUCTION)(mapping.WRITE_READ)
        MEMORY_16x32_module.io.iRead        := !input(INSTRUCTION)(mapping.WRITE_READ)
      
        MEMORY_16x32_module.io.iAddress     := addressIn.resized
        MEMORY_16x32_module.io.iData        := dataIn
        
        val output = MEMORY_16x32_module.io.oData
      }


    } // #################### End of EXECUTE STAGE





    // #################### Start of WRITEBACK STAGE
    writeBack plug new Area {
      import writeBack._
      
      when(input(IS_MEMORY_16x32)) {
        output(REGFILE_WRITE_DATA) := onExecute.MEMORY_16x32_INST.output.asBits
      }
    } // #################### End of WRITEBACK STAGE




  }   // end of build
}     // end of Memory16x32Plugin class




class MEMORY_16x32 extends BlackBox {
  val io = new Bundle {
    val iClk          = in Bool()
    val iReset        = in Bool()

    val iChipSelect   = in Bool()
    val iRead         = in Bool()
    val iWrite        = in Bool()

    val iAddress      = in UInt(4 bits)
    val iData         = in UInt(32 bits)

    val oData         = out UInt(32 bits)
  }

  mapCurrentClockDomain(clock = io.iClk, reset = io.iReset) 

  // Remove io_ prefix
  noIoPrefix()

  addRTLPath("/home/linh/KLTN/Library/MEMORY_16x32.v")
}
