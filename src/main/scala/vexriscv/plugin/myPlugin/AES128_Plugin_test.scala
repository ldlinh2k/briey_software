package vexriscv.plugin

import spinal.core._
import spinal.lib._
import vexriscv.{DecoderService, Stageable, VexRiscv}

/*
	Ket qua: 
	- file aes_custom.h viet chinh xac, truyen` duoc rs1,rs2 vao dung plugin
	- su dung bit 25 de quyet dinh ma hoa, giai ma thanh cong
	- stages write_back xuat ket qua thanh cong ra rd
*/

case class AES128_Plugin_test(encoding : MaskedLiteral = M"-----------------010-----0101011") extends Plugin[VexRiscv]{ // Fixed
  /* The instructions are encoded by default as following :
  * ------RXXXXXYYYYY000ZZZZZ0001100
  *0000001 01110 01111 000 01111 0101011
  * Where :
  * - XXXXX is the register file source 2 (RS2)
  * - YYYYY is the register file source 1 (RS1)
  * - ZZZZZ is the register file destination
  * - R=0 mean read, R=1 mean write*/

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
      val operation = input(INSTRUCTION)(mapping.BUS_READ_WRITEn)
      val rd = UInt(32 bits)
      when(operation) //mean write
      {
      	rd:=dataIn
      }otherwise	//mean read
      {
      	rd:=avalonAddr
      }
      
      insert(AES_CALC):=rd.asBits
    }

	writeBack plug new Area 
   {
      	import writeBack._

      	 when(input(IS_AES)) 
      	 {
        	output(REGFILE_WRITE_DATA) := input(AES_CALC)
     	 }
    }
  }
}

