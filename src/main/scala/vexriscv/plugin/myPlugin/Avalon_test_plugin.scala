package vexriscv.plugin

import spinal.core._
import spinal.lib._
import vexriscv.{DecoderService, Stageable, VexRiscv}

/*
	Add duoc file verilog vao` Briey.scala
*/
case class Avalon_test_plugin(encoding : MaskedLiteral = M"000101-----------001-----0101011") extends Plugin[VexRiscv]{ // Fixed

  object IS_AVALON_TEST extends Stageable(Bool)
  object AVALON_TEST_CALC extends Stageable(Bits(32 bits))

  val mapping = new {
    def BUS_READ_WRITEn = 25 // Write or read?
  }
  //Callback to setup the plugin and ask for different services
  override def setup(pipeline: VexRiscv): Unit = {
    import pipeline.config._

    val decoderService = pipeline.service(classOf[DecoderService])

//FIX - Name
    decoderService.addDefault(IS_AVALON_TEST, False)
    decoderService.add(
      key = encoding,
      List(
        IS_AVALON_TEST           -> True,   //FIX - NAME
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
      val operation = input(INSTRUCTION)(mapping.BUS_READ_WRITEn)
      
     //module
        val Avalon_test_area = new Area {
          val Avalon_obj = new Avalon_test_module
            Avalon_obj.io.iChipselect := input(IS_AVALON_TEST)
            Avalon_obj.io.iWrite_n := !operation
            Avalon_obj.io.iRead_n  := operation
            Avalon_obj.io.iAddress := avalonAddr.resized
            Avalon_obj.io.iData := dataIn
      	  val output = Avalon_obj.io.oData
        }
        
      
     insert(AVALON_TEST_CALC) := Avalon_test_area.output.asBits  
    }
     /* memory plug new Area {
      import memory._
      val Avalon_test_area = new Area {
        val Avalon_obj = new Avalon_test_module
          Avalon_obj.io.iChipselect_n := False
          Avalon_obj.io.iWrite_n := !onExecute.operation
          Avalon_obj.io.iRead_n  := onExecute.operation
          Avalon_obj.io.iAddress := onExecute.avalonAddr.resized
          Avalon_obj.io.iData := onExecute.dataIn
      	val output = Avalon_obj.io.oData
      }
      insert(AVALON_TEST_CALC) := Avalon_test_area.output.asBits
    }*/
    

    writeBack plug new Area {
      import writeBack._

      when(input(IS_AVALON_TEST)) {
        output(REGFILE_WRITE_DATA) := input(AVALON_TEST_CALC)
      }
    }
  }
}

class Avalon_test_module extends BlackBox {
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

  addRTLPath("/home/linh/KLTN/Library/Avalon_test_module.v")
}

// 
