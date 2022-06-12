package vexriscv.plugin

import spinal.core._
import spinal.lib._
import vexriscv.{DecoderService, Stageable, VexRiscv}

/*
	Add duoc file verilog vao` Briey.scala
*/
case class Con_Cate_Bits_Plugin(encoding : MaskedLiteral = M"0001000----------001-----0101011") extends Plugin[VexRiscv]{ // Fixed

  object IS_CON_CATE extends Stageable(Bool)
  object CON_CATE_CALC extends Stageable(Bits(32 bits))


  //Callback to setup the plugin and ask for different services
  override def setup(pipeline: VexRiscv): Unit = {
    import pipeline.config._

    val decoderService = pipeline.service(classOf[DecoderService])

//FIX - Name
    decoderService.addDefault(IS_CON_CATE, False)
    decoderService.add(
      key = encoding,
      List(
        IS_CON_CATE                   -> True,   //FIX - NAME
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
      
      val Con_Cate_DUT = new Con_Cate_Bits_Module
	Con_Cate_DUT.io.numA := numberA
	Con_Cate_DUT.io.numB := numberB
      val output = Con_Cate_DUT.io.res

      insert(CON_CATE_CALC) := output.asBits
    }




    writeBack plug new Area {
      import writeBack._

      when(input(IS_CON_CATE)) {
        output(REGFILE_WRITE_DATA) := input(CON_CATE_CALC)
      }
    }
  }
}

class Con_Cate_Bits_Module extends BlackBox {
  val io = new Bundle {
  
    val numA =in UInt(32 bits)
    val numB = in UInt(32 bits)
    val res = out Bits (32 bits)
  }

  // Remove io_ prefix
  noIoPrefix()

  addRTLPath("/home/linh/KLTN/Library/Con_Cate_Bits_Module.v")
}

// 
