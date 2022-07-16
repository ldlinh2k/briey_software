package vexriscv.plugin

import spinal.core._
import spinal.lib._
import vexriscv.{DecoderService, Stageable, VexRiscv}


case class AES128_Plugin(encoding : MaskedLiteral = M"-----------------010-----0101011") extends Plugin[VexRiscv]{ // Fixed
  // - R=0 mean read, R=1 mean write*/

//FIX- name
  object IS_AES extends Stageable(Bool)
  object AES_CALC extends Stageable(Bits(32 bits))

//FIXXXXXXXX
  val mapping = new {
    def BUS_READ_WRITEn = 25 // Write or read?
  }

  //Callback to setup the plugin and ask for different services
  override def setup(pipeline: VexRiscv): Unit = {
    import pipeline.config._

    val decoderService = pipeline.service(classOf[DecoderService])

//FIX - Name
    decoderService.addDefault(IS_AES, False)
    decoderService.add(
      key = encoding,
      List(
        IS_AES                   -> True,   //FIX - NAME
        REGFILE_WRITE_VALID      -> True,
        BYPASSABLE_EXECUTE_STAGE -> False,
        BYPASSABLE_MEMORY_STAGE  -> False, //Late result
        RS1_USE                  -> True,
        RS2_USE                  -> True
      )
    )
  }

  override def build(pipeline: VexRiscv): Unit = {
    import pipeline._
    import pipeline.config._

    val onExecute = execute plug new Area{
      import execute._
    //FIX - New variable 
      val avalonAddr = input(RS2).asUInt
      val dataIn = input(RS1).asUInt
      val operation = input(INSTRUCTION)(mapping.BUS_READ_WRITEn)\
      val AES = new AES128_wrapper
      val AES_Accelerator = new Area {
        AES.io.iChipselect_n := !input(IS_AES)
        AES.io.iWrite_n := !onExecute.operation
        AES.io.iRead_n  := onExecute.operation
        AES.io.iAddress := onExecute.avalonAddr.resized
        AES.io.iData := onExecute.dataIn

        val output = AES.io.oData
      }

      insert(AES_CALC) := AES_Accelerator.output.asBits
    }
    writeBack plug new Area {
      import writeBack._

      when(input(IS_AES)) {
        output(REGFILE_WRITE_DATA) := input(AES_CALC)
      }
    }
  }
}

class AES128_wrapper extends BlackBox {
  val io = new Bundle {
    val iClk = in Bool()
    val iReset = in Bool()
    val iChipselect_n = in Bool()
    val iWrite_n = in Bool()
    val iRead_n = in Bool()
    val iAddress = in UInt (5 bits)
    val iData = in UInt (32 bits)
    val oData = out Bits (32 bits)
  }

  mapCurrentClockDomain(clock=io.iClk, reset = io.iReset)

  // Remove io_ prefix
  noIoPrefix()

}

// 
