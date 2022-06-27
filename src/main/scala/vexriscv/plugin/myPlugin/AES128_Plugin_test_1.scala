package vexriscv.plugin

import spinal.core._
import spinal.lib._
import vexriscv.{DecoderService, Stageable, VexRiscv}

/**
  * The AesPlugin allow to reduce the instruction count of each AES round by providing the following instruction :
  * 1) aes_enc_round(rs1, rs2, sel).      rd = rs1 ^ quad_mul(sel, sbox(byte_sel(rs2, sel)))
  * 2) aes_enc_round_last(rs1, rs2, sel). rd = rs1 ^ quad_sbox(byte_sel(rs2, sel))
  * 3) aes_dec_round(rs1, rs2, sel).      rd = rs1 ^ quad_inv_sbox(quad_mul(sel,byte_sel(rs2, sel)))
  * 4) aes_dec_round_last(rs1, rs2, sel). rd = rs1 ^ quad_inv_sbox(byte_sel(rs2, sel))
  *
  * Here is what those inner functions mean:
  * - sbox apply the sbox transformation on the 'sel' byte of the 32 bits word
  * - quad_mul multiply (Galois field) each byte of 32 bits word by a constant (which depend of sel)
  * - quad_inv_sbox apply the inverse sbox transformation on each byte of 32 bits word
  *
  * This plugin implement the processing using a single 32_bits * 512_words rom to fetch the sbox/inv_sbox/multiplication
  * results already combined. This rom is formated as following :
  *
  * From word 0x000 to 0x0FF, it is formatted as follow :  (note multiplication are in Galois field)
  * [ 7 :  0] : SBox[word_address & 0xFF] * 1
  * [15 :  8] : SBox[word_address & 0xFF] * 2
  * [23 : 16] : SBox[word_address & 0xFF] * 3
  * [31 : 24] : inverse SBox[word_address & 0xFF] * 1 (Used for the last round of the decryption)
  *
  * From word 0x100 to 0x1FF, it is formatted as follow :
  * [ 7 :  0] : inverse SBox[word_address & 0xFF * 14]
  * [15 :  8] : inverse SBox[word_address & 0xFF *  9]
  * [23 : 16] : inverse SBox[word_address & 0xFF * 13]
  * [31 : 24] : inverse SBox[word_address & 0xFF * 11]
  *
  * So, on each instruction, the following is done (in order)
  * 1) Select the 'sel' byte of RS2
  * 2) Read the rom at a address which depend of the RS2 selected byte and the instruction
  * 3) Permute the rom read data depending the instruction and the 'sel' argument
  * 4) Xor the result with RS1 and return that as instruction result
  *
  * The instructions are encoded by default as following :
  * -----F-XXXXXYYYYY000ZZZZZ0001100
  *
  * Where :
  * - XXXXX is the register file source 2 (RS2)
  * - YYYYY is the register file source 1 (RS1)
  * - ZZZZZ is the register file destination
  * - F=1 mean first round, F=0 mean full round
  */

case class AES128_Plugin_test_1(encoding : MaskedLiteral = M"-----------------010-----0101011") extends Plugin[VexRiscv]{ // Fixed
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
      
      val AES = new AES128_wrapper
        AES.io.iChipselect_n := False
        AES.io.iWrite_n := !operation
        AES.io.iRead_n  := operation
        AES.io.iAddress := avalonAddr.resized
        AES.io.iData := dataIn
      val output = AES.io.oData
      insert(AES_CALC) := output.asBits
    }


    writeBack plug new Area {
      import writeBack._
      
      when(input(IS_AES)) {
        output(REGFILE_WRITE_DATA) := input(AES_CALC)
      }
    }
  }
}

