package vexriscv.plugin

import spinal.core._
import spinal.lib._
import vexriscv.{DecoderService, Stageable, VexRiscv}

/*
	Add duoc file verilog vao` Briey.scala
*/
case class Con_Cate_Bits_With_Clock_Plugin(encoding : MaskedLiteral = M"0001001----------001-----0101011") extends Plugin[VexRiscv]{ // Fixed

  object IS_CON_CATE_WITH_CLOCK extends Stageable(Bool)
  object CON_CATE_WITH_CLOCK_CALC extends Stageable(Bits(32 bits))


  //Callback to setup the plugin and ask for different services
  override def setup(pipeline: VexRiscv): Unit = {
    import pipeline.config._

    val decoderService = pipeline.service(classOf[DecoderService])

//FIX - Name
    decoderService.addDefault(IS_CON_CATE_WITH_CLOCK, False)
    decoderService.add(
      key = encoding,
      List(
        IS_CON_CATE_WITH_CLOCK                   -> True,   //FIX - NAME
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
      val numberA = input(RS1).asUInt
      val numberB = input(RS2).asUInt
    }
    memory plug new Area{
      import memory._
      val Con_Cate_Area = new Area {
        val Con_Cate_DUT = new Con_Cate_Bits_With_Clock_Module
        Con_Cate_DUT.io.numA := onExecute.numberA
        Con_Cate_DUT.io.numB := onExecute.numberB
        val output = Con_Cate_DUT.io.res
      }
      insert(CON_CATE_WITH_CLOCK_CALC) := Con_Cate_Area.output.asBits
    }



    writeBack plug new Area {
      import writeBack._

      when(input(IS_CON_CATE_WITH_CLOCK)) {
        output(REGFILE_WRITE_DATA) := input(CON_CATE_WITH_CLOCK_CALC)
      }
    }
  }
}

class Con_Cate_Bits_With_Clock_Module extends BlackBox {
  val io = new Bundle {
  
    val iClk = in Bool()
    val iReset = in Bool()
    val numA =in UInt(32 bits)
    val numB = in UInt(32 bits)
    val res = out Bits (32 bits)
  }

  mapCurrentClockDomain(clock=io.iClk, reset = io.iReset)
  // Remove io_ prefix
  noIoPrefix()

  addRTLPath("/home/linh/KLTN/Library/Con_Cate_Bits_With_Clock_Module.v")
}

// 
