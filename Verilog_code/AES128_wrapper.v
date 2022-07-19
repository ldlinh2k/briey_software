/*****************************************************************************
 * Thesis     :     AES-128            
 * Made by      :     Le Nguyen To Quynh
 * Instructed by  :       Ph.D Le Duc Hung
                M.S  Cao Tran Bao Thuong
 * Supported by   :
 * Module     :     aes_core (module main)
 * Staged     :     Top     
 *****************************************************************************/
module AES128_wrapper(
  input iClk,
  input iReset,
  input iChipselect,
  input iWrite,
  input iRead,
  input [4:0] iAddress,
  input [31:0]  iData,
  output  reg [31:0]  oData
);

// iAddress[4:0] :
//iAddress[4:2]: select register
//iAddress[1:0]: select byte to read/write
/*
  address:
  000xx: iStart [from 0x00-0x03]
  001xx: iEn_or_de [from 0x04 to 0x07]
  010xx: iKey      [from 0x08 to 0xB] 
  011xx: iPlain_text [from 0x0C to 0x0F]
  100xx: oCipher_text [from 0x10 to 0x13]
  101xx: oCipher_text_ready [from 0x14 to 0x17]
  110xx: iReset_external [from 0x18 to 0x1f]
*/

reg           iStart;
reg           iEn_or_de;
reg           iReset_external;
reg[127:0]    iKey;
reg[127:0]    iPlain_text;
reg[127:0]    oCipher_text;
reg           oCipher_text_ready;

wire[127:0]   oCipher_text_w;
wire          oCipher_text_ready_w;
wire          iReset_n_w;

assign iReset_n_w = ~iReset;
always@(posedge iClk,negedge iReset_n_w)
begin
  if(~iReset_n_w)
    begin
      iKey <= 128'b0;
      iPlain_text <= 128'b0;
      iEn_or_de <=0;
      oData <=32'b0;
      iReset_external <=1;
      iStart <=0;
    end
  else 
    begin
      iReset_external<=0;
      if(iChipselect )
      begin
        if(iWrite)
        begin
          begin
          case(iAddress[4:2])
            3'b000: iStart<=iData[0];
            3'b001: iEn_or_de <= iData[0];
            3'b010: 
            begin
              case(iAddress[1:0])
                2'b00: iKey[127:96]   <= iData;
                2'b01: iKey[95:64]    <= iData;
                2'b10: iKey[63:32]    <= iData;
                2'b11: iKey[31:0]     <= iData;
              endcase
            end
            3'b011:
            begin
              case(iAddress[1:0])
                2'b00: iPlain_text[127:96]    <= iData;
                2'b01: iPlain_text[95:64]     <= iData;
                2'b10: iPlain_text[63:32]     <= iData;
                2'b11: iPlain_text[31:0]      <= iData;
              endcase
            end
            3'b110: iReset_external<=iData;
            default:
            begin
            end
          endcase
          end
        end   
        else if(iRead)
        begin
          case(iAddress[4:2])
            3'b100:   
            begin
              case(iAddress[1:0])
                2'b00: oData  <= oCipher_text[127:96];
                2'b01: oData  <= oCipher_text[95:64];
                2'b10: oData  <= oCipher_text[63:32];
                2'b11: oData  <= oCipher_text[31:0];
              endcase
            end
            3'b101: oData     <=oCipher_text_ready; 
            default:
            begin
            end
          endcase
        end 
        else iStart<=0;
      end
      else iStart<=0;
    end
end
always@(posedge oCipher_text_ready_w,posedge iReset_external)
  if(iReset_external)
  begin
   oCipher_text_ready  <=0;
   oCipher_text<=0;
  end
  else 
  begin
    oCipher_text    <= oCipher_text_w;
  end

  aes_core AES128(
    .iClk(iClk),
    .iReset_n(~iReset_external), 
    .iStart(iStart),
    .iEn_or_de(iEn_or_de),
    .iKey(iKey),
    .iPlain_text(iPlain_text),
    .oCipher_text(oCipher_text_w),
    .oCipher_text_ready(oCipher_text_ready_w)
  );
endmodule // AES_128_wrapper

module aes_core(
  iClk,
  iReset_n, 
  iStart,
  iEn_or_de,
  iKey,
  iPlain_text,
  oCipher_text,
  oCipher_text_ready
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input       iClk;
input       iReset_n;
input       iStart;
input       iEn_or_de;
input [127:0]   iKey;
input [127:0]   iPlain_text;
output[127:0]   oCipher_text;
output      oCipher_text_ready;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
reg [127:0]   rCipher_text_out;
reg       rCipher_text_ready_out;
reg [3:0]     rRound;
reg [127:0]   rKey_in;
reg [127:0]   rPlain_text_in;

reg [127:0]   rmKey_in_de [0:11];
reg [127:0]   rKey_in_de;
reg [3:0]     rCounter_de;

reg [3:0]     rCounter_round;
reg           rStart_key_expand;
reg [127:0]   rCipher_in_de;
reg           rDe_cipher_text_ready_out;
reg [127:0]   rDe_cipher_text_out;

wire      wStart_key_expand;
wire      wKey_expansion_ready_out;
wire [127:0]  wKey_expansion_out;
wire [127:0]  wCipher_text_out;
wire      wCipher_text_ready_out;
wire      wStart_encryption;

wire        wStart_decryption;
wire [127:0]  wDe_cipher_text_out;
wire      wDe_cipher_text_ready_out;


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign wStart_key_expand = iStart | wKey_expansion_ready_out;
assign wStart_encryption = iStart | wKey_expansion_ready_out;
assign wStart_decryption = rCipher_text_ready_out | wDe_cipher_text_ready_out;

assign oCipher_text = (iEn_or_de == 1'b1) ? rCipher_text_out : rDe_cipher_text_out;
assign oCipher_text_ready = (iEn_or_de == 1'b1) ? rCipher_text_ready_out : rDe_cipher_text_ready_out;

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
always @(posedge iClk or negedge iReset_n)
begin
  if (!iReset_n )
  begin
  rStart_key_expand <=0;
  end
else 
  rStart_key_expand <= wStart_key_expand;
end

always @(posedge iClk or negedge iReset_n)
begin
  if (!iReset_n )
  begin
  rCounter_de <= 0;
  end
else if (rStart_key_expand)
  begin
  rmKey_in_de[rCounter_de] <= rKey_in;
  rCounter_de <= rCounter_de+1;
  end
end

always @(posedge iClk or negedge iReset_n)
begin
  if (!iReset_n )
  begin
  rCounter_round = 10;
  rCipher_in_de <= 0;
  rDe_cipher_text_ready_out <= 0;
  rDe_cipher_text_out <= 0;
  end
else if (rCounter_round == 0 && wDe_cipher_text_ready_out)
begin 
  rDe_cipher_text_out <= wDe_cipher_text_out;
  rDe_cipher_text_ready_out <= wDe_cipher_text_ready_out;
end
  
else if (rCipher_text_ready_out)    
    begin
      rCounter_round = 10;
      rCipher_in_de <= iPlain_text;
      rKey_in_de <= rmKey_in_de[rCounter_round];
      rDe_cipher_text_out <= 1'b0;
      rDe_cipher_text_ready_out <= 1'b0;
    end
else if (wDe_cipher_text_ready_out && rCounter_round > 0)
  begin
    rCounter_round = rCounter_round - 1;
    rKey_in_de <= rmKey_in_de[rCounter_round];
    rCipher_in_de <= wDe_cipher_text_out;
    
    rDe_cipher_text_ready_out <= 0;
  end
  else
    rDe_cipher_text_ready_out <= 0;
end
   
/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
aes_decryption  aes_de (
.iClk(iClk),
.iReset_n(iReset_n), 
.iStart(wStart_decryption),
.iRound(rCounter_round),
.iKey(rKey_in_de),
.iPlain_text(rCipher_in_de),
.oCipher_text(wDe_cipher_text_out),
.oCipher_text_ready(wDe_cipher_text_ready_out)
);

aes_encryption aes_en (
.iClk(iClk),
  .iReset_n(iReset_n), 
.iStart(wStart_encryption),
.iRound(rRound),
  .iKey(rKey_in),
.iPlain_text(rPlain_text_in),
  .oCipher_text(wCipher_text_out),
.oCipher_text_ready(wCipher_text_ready_out)
);

aes_key_expansion key_expander (
.iClk(iClk),
  .iReset_n(iReset_n), 
.iStart(wStart_key_expand),
.iRcon(rRound),
  .iKey(rKey_in),
  .oKey_expansion(wKey_expansion_out),
.oKey_expansion_ready(wKey_expansion_ready_out)
);

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
always @(posedge iClk or negedge iReset_n)
begin
  if (!iReset_n )
    begin
  rRound <= 4'h0;
      rCipher_text_out <= 128'h0;
      rCipher_text_ready_out <= 1'b0;
    end
else if(iStart)
  begin
    rCipher_text_out <= 128'h0;
    rCipher_text_ready_out <= 1'b0;
    rKey_in <= iKey;
    rPlain_text_in <= iPlain_text;
    rRound <= 4'h0; 
  end
 else if(rRound == 10 && wCipher_text_ready_out)
  begin
    rCipher_text_out <= wCipher_text_out;
    rCipher_text_ready_out <= wCipher_text_ready_out;
  end
else if(wKey_expansion_ready_out && rRound < 10)
  begin
    rKey_in <= wKey_expansion_out;
    rPlain_text_in <= wCipher_text_out;
    rRound <= rRound + 1 ;
    rCipher_text_ready_out <=0;
  end
else
    rCipher_text_ready_out <=0;
end

endmodule

/*****************************************************************************
 * Thesis           :           AES-128            
 * Made by          :           Le Nguyen To Quynh
 * Instructed by    :           Ph.D Le Duc Hung
                                M.S  Cao Tran Bao Thuong
 * Supported by     :
 * Module           :           aes_decryption
 * Staged           :           Stage 1   
 *****************************************************************************/

module aes_decryption(
    iClk,
    iReset_n, 
    iStart,
    iKey,
    iRound,
    iPlain_text,
    oCipher_text,
    oCipher_text_ready
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
parameter STEP_IDLE     = 3'd0;
parameter STEP_INIT       = 3'd1;
parameter STEP_ADD_ROUND_KEY_INITIAL  = 3'd2;
parameter STEP_SUB_SHIFT    = 3'd3;
parameter STEP_MIX_COLUMN   = 3'd4;
parameter STEP_ADD_ROUND_KEY    = 3'd5;
parameter STEP_DONE   =3'd6;

input     iClk;
input     iReset_n;
input     iStart;
input    [127:0]  iKey;
input    [127:0]  iPlain_text;
input    [3:0]  iRound;

output   [127:0]  oCipher_text;
output    oCipher_text_ready;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
reg      [127:0]  rCipher_text;
reg      [31:0]   rCipher_column_0_temp,rCipher_column_1_temp,rCipher_column_2_temp,rCipher_column_3_temp;
reg      [2:0]  rState_step;
reg         rCipher_text_done;

wire [7:0] w0[0:3];
wire [7:0] w1[0:3];
wire [7:0] w2[0:3];
wire [7:0] w3[0:3];

wire [31:0] wMixcolum_0;
wire [31:0] wMixcolum_1;
wire [31:0] wMixcolum_2;
wire [31:0] wMixcolum_3;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oCipher_text = rCipher_text;
assign oCipher_text_ready = rCipher_text_done;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
sbox sbox_w10 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_0_temp[7:0]),
  .oSbox(w0[0])
);

sbox sbox_w11 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_0_temp[15:8]),
  .oSbox(w0[1])
);

sbox sbox_w12 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_0_temp[23:16]),
  .oSbox(w0[2])
);

sbox sbox_w13 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_0_temp[31:24]),
  .oSbox(w0[3])
);

sbox sbox_w20 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_1_temp[7:0]),
  .oSbox(w1[0])
);

sbox sbox_w21 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_1_temp[15:8]),
  .oSbox(w1[1])
);

sbox sbox_w22 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_1_temp[23:16]),
  .oSbox(w1[2])
);

sbox sbox_w23 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_1_temp[31:24]),
  .oSbox(w1[3])
);

sbox sbox_w30 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_2_temp[7:0]),
  .oSbox(w2[0])
);

sbox sbox_w31 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_2_temp[15:8]),
  .oSbox(w2[1])
);

sbox sbox_w32 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_2_temp[23:16]),
  .oSbox(w2[2])
);

sbox sbox_w33 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_2_temp[31:24]),
  .oSbox(w2[3])
);

sbox sbox_w40 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_3_temp[7:0]),
  .oSbox(w3[0])
);

sbox sbox_w41 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_3_temp[15:8]),
  .oSbox(w3[1])
);

sbox sbox_w42 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_3_temp[23:16]),
  .oSbox(w3[2])
);

sbox sbox_w43 (
  .iEn_or_de(1'b0),
  .iSbox(rCipher_column_3_temp[31:24]),
  .oSbox(w3[3])
);

inv_mixcolumn mixcolumn0 (
  .iInv_mixcolumn(rCipher_column_0_temp),
  .oInv_mixcolumn(wMixcolum_0)
);

inv_mixcolumn mixcolumn1 (
  .iInv_mixcolumn(rCipher_column_1_temp),
  .oInv_mixcolumn(wMixcolum_1)
);

inv_mixcolumn mixcolumn2 (
  .iInv_mixcolumn(rCipher_column_2_temp),
  .oInv_mixcolumn(wMixcolum_2)
);

inv_mixcolumn mixcolumn3 (
  .iInv_mixcolumn(rCipher_column_3_temp),
  .oInv_mixcolumn(wMixcolum_3)
);

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
always @(posedge iClk or negedge iReset_n)
begin
    if (!iReset_n )
      begin
      rState_step <= STEP_IDLE; 
      rCipher_text <= 128'h0;
      rCipher_text_done <= 1'b0;
      end
    else
      begin
    case(rState_step)
      STEP_IDLE:
        begin
          rCipher_text_done <= 1'b0;
          if(iStart && (iRound > 0) ||(iStart && iRound == 15))
              rState_step <= STEP_INIT;
            else
              rState_step <= STEP_IDLE;
        end
      STEP_INIT:
        begin
          rCipher_column_0_temp <= iPlain_text[127 : 96];
          rCipher_column_1_temp <= iPlain_text[95 : 64];
          rCipher_column_2_temp <= iPlain_text[63 : 32];
          rCipher_column_3_temp <= iPlain_text[31 : 0];
          if(iRound == 0)
              rState_step <= STEP_ADD_ROUND_KEY_INITIAL;
          else
              rState_step <= STEP_ADD_ROUND_KEY;
        end
      STEP_ADD_ROUND_KEY_INITIAL:
        begin
          rCipher_text[127 : 96] <= rCipher_column_0_temp ^ iKey[127 : 96];
          rCipher_text[95 : 64]  <= rCipher_column_1_temp ^ iKey[95 : 64];
          rCipher_text[63 : 32]  <= rCipher_column_2_temp ^ iKey[63 : 32];
          rCipher_text[31 : 0]   <= rCipher_column_3_temp ^ iKey[31 : 0];
          rCipher_text_done <= 1'b1;
          rState_step <= STEP_IDLE ;
        end
      STEP_SUB_SHIFT:
        begin
          rCipher_text[127 : 96] <= {w0[3],w3[2],w2[1],w1[0]};
          rCipher_text[95 : 64]  <= {w1[3],w0[2],w3[1],w2[0]};
          rCipher_text[63 : 32]  <= {w2[3],w1[2],w0[1],w3[0]};
          rCipher_text[31 : 0]   <= {w3[3],w2[2],w1[1],w0[0]};
          rCipher_text_done <= 1'b1;
          rState_step <= STEP_IDLE;
        end
      STEP_MIX_COLUMN:
        begin
              rCipher_column_0_temp <= wMixcolum_0;
          rCipher_column_1_temp <= wMixcolum_1;
          rCipher_column_2_temp <= wMixcolum_2;
          rCipher_column_3_temp <= wMixcolum_3;     
          rState_step <= STEP_SUB_SHIFT;

        end
      STEP_ADD_ROUND_KEY:
        begin
          rCipher_column_0_temp <= rCipher_column_0_temp ^ iKey[127 : 96];
          rCipher_column_1_temp <= rCipher_column_1_temp ^ iKey[95 : 64];
          rCipher_column_2_temp <= rCipher_column_2_temp ^ iKey[63 : 32];
          rCipher_column_3_temp <= rCipher_column_3_temp ^ iKey[31 : 0];
          if(iRound == 10)
              rState_step <= STEP_SUB_SHIFT;
          else
              rState_step <= STEP_MIX_COLUMN;
        end
      default:
      	begin
      	end
        endcase
        end
end

endmodule

/*****************************************************************************
 * Thesis     :     AES-128            
 * Made by      :     Le Nguyen To Quynh
 * Instructed by  :       Ph.D Le Duc Hung
                M.S  Cao Tran Bao Thuong
 * Supported by   :
 * Module     :     aes_encryption
 * Staged           :           Stage 1         
 *****************************************************************************/

module aes_encryption(
  iClk,
    iReset_n, 
  iStart,
    iKey,
  iRound,
  iPlain_text,
    oCipher_text,
  oCipher_text_ready
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
parameter STEP_IDLE                   = 3'd0;
parameter STEP_INIT                   = 3'd1;
parameter STEP_ADD_ROUND_KEY_INITIAL  = 3'd2;
parameter STEP_SUB_SHIFT              = 3'd3;
parameter STEP_MIX_COULUMN            = 3'd4;
parameter STEP_ADD_ROUND_KEY          = 3'd5;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input            iClk;
input            iReset_n;
input            iStart;
input [127:0]    iKey;
input [127:0]    iPlain_text;
input [3:0]      iRound;

output [127:0]   oCipher_text;
output           oCipher_text_ready;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
reg      [127:0]  rCipher_text;
reg      [31:0]       rCipher_column_0_temp,rCipher_column_1_temp,rCipher_column_2_temp,rCipher_column_3_temp;
reg      [2:0]  rState_step;
reg         rCipher_text_done;

wire [7:0] w0[0:3];
wire [7:0] w1[0:3];
wire [7:0] w2[0:3];
wire [7:0] w3[0:3];

wire [31:0] wMixcolumn_0;
wire [31:0] wMixcolumn_1;
wire [31:0] wMixcolumn_2;
wire [31:0] wMixcolumn_3;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oCipher_text = rCipher_text;
assign oCipher_text_ready = rCipher_text_done;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
sbox sbox_w10 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_0_temp[7:0]),
  .oSbox(w0[0])
);

sbox sbox_w11 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_0_temp[15:8]),
  .oSbox(w0[1])
);

sbox sbox_w12  (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_0_temp[23:16]),
  .oSbox(w0[2])
);

sbox sbox_w13 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_0_temp[31:24]),
  .oSbox(w0[3])
);

sbox sbox_w20 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_1_temp[7:0]),
  .oSbox(w1[0])
);

sbox sbox_w21 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_1_temp[15:8]),
  .oSbox(w1[1])
);

sbox sbox_w22 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_1_temp[23:16]),
  .oSbox(w1[2])
);

sbox sbox_w23 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_1_temp[31:24]),
  .oSbox(w1[3])
);

sbox sbox_w30 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_2_temp[7:0]),
  .oSbox(w2[0])
);

sbox sbox_w31 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_2_temp[15:8]),
  .oSbox(w2[1])
);

sbox sbox_w32 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_2_temp[23:16]),
  .oSbox(w2[2])
);

sbox sbox_w33 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_2_temp[31:24]),
  .oSbox(w2[3])
);

sbox sbox_w40 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_3_temp[7:0]),
  .oSbox(w3[0])
);

sbox sbox_w41 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_3_temp[15:8]),
  .oSbox(w3[1])
);

sbox sbox_w42 (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_3_temp[23:16]),
  .oSbox(w3[2])
);

sbox sbox_w43  (
  .iEn_or_de(1'b1),
  .iSbox(rCipher_column_3_temp[31:24]),
  .oSbox(w3[3])
);

mixcolumn mixcolumn0 (
  .iMixcolumn(rCipher_column_0_temp),
  .oMixcolumn(wMixcolumn_0)
);

mixcolumn mixcolumn1 (
  .iMixcolumn(rCipher_column_1_temp),
  .oMixcolumn(wMixcolumn_1)
);

mixcolumn mixcolumn2 (
  .iMixcolumn(rCipher_column_2_temp),
  .oMixcolumn(wMixcolumn_2)
);

mixcolumn mixcolumn3 (
  .iMixcolumn(rCipher_column_3_temp),
  .oMixcolumn(wMixcolumn_3)
);

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
always @(posedge iClk or negedge iReset_n)
begin
    if (!iReset_n )
      begin
      rState_step <= STEP_IDLE; 
      rCipher_text <= 128'h0;
      rCipher_text_done <= 1'b0;
      end
    else
      begin
    case(rState_step)
      STEP_IDLE:
        begin
          rCipher_text_done <= 1'b0;
          if((iStart && iRound <= 10)||(iStart && iRound == 15))
              rState_step <= STEP_INIT;
            else
              rState_step <= STEP_IDLE;
        end
      STEP_INIT:
        begin
          rCipher_column_0_temp <= iPlain_text[127 : 96];
          rCipher_column_1_temp <= iPlain_text[95 : 64];
          rCipher_column_2_temp <= iPlain_text[63 : 32];
          rCipher_column_3_temp <= iPlain_text[31 : 0];
          if(iRound == 0)
              rState_step <= STEP_ADD_ROUND_KEY_INITIAL;
          else
              rState_step <= STEP_SUB_SHIFT;
        end
      STEP_ADD_ROUND_KEY_INITIAL:
        begin
          rCipher_text[127 : 96] <= rCipher_column_0_temp ^ iKey[127 : 96];
          rCipher_text[95 : 64] <= rCipher_column_1_temp ^ iKey[95 : 64];
          rCipher_text[63 : 32] <= rCipher_column_2_temp ^ iKey[63 : 32];
          rCipher_text[31 : 0] <= rCipher_column_3_temp ^ iKey[31 : 0];
          rCipher_text_done <= 1'b1;
          rState_step <= STEP_IDLE ;
        end
      STEP_SUB_SHIFT:
        begin
          rCipher_column_0_temp <= {w0[3],w1[2],w2[1],w3[0]};
          rCipher_column_1_temp <= {w1[3],w2[2],w3[1],w0[0]};
          rCipher_column_2_temp <= {w2[3],w3[2],w0[1],w1[0]};
          rCipher_column_3_temp <= {w3[3],w0[2],w1[1],w2[0]};
          if(iRound == 10)
              rState_step <= STEP_ADD_ROUND_KEY;
          else
              rState_step <= STEP_MIX_COULUMN;
        end
      STEP_MIX_COULUMN:
        begin
            rCipher_column_0_temp <= wMixcolumn_0;
          rCipher_column_1_temp <= wMixcolumn_1;
          rCipher_column_2_temp <= wMixcolumn_2;
          rCipher_column_3_temp <= wMixcolumn_3;      
          rState_step <= STEP_ADD_ROUND_KEY;

        end
      STEP_ADD_ROUND_KEY:
        begin
          rCipher_text_done <= 1'b1;
          rCipher_text[127 : 96] <= rCipher_column_0_temp ^ iKey[127 : 96];
          rCipher_text[95 : 64] <= rCipher_column_1_temp ^ iKey[95 : 64];
          rCipher_text[63 : 32] <= rCipher_column_2_temp ^ iKey[63 : 32];
          rCipher_text[31 : 0] <= rCipher_column_3_temp ^ iKey[31 : 0];           
          rState_step <= STEP_IDLE;
        end
       default:
      	begin
      	end
        endcase
        end
end

endmodule

/*****************************************************************************
 * Thesis     :     AES-128            
 * Made by      :     Le Nguyen To Quynh
 * Instructed by  :       Ph.D Le Duc Hung
                M.S  Cao Tran Bao Thuong
 * Supported by   :     
 * Module     :       aes_key_expansion
 * Staged           :           Stage 1
 *****************************************************************************/
module aes_key_expansion (
  iClk,
    iReset_n, 
  iStart,
  iRcon,
    iKey,

    oKey_expansion,
  oKey_expansion_ready
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/  
parameter STEP_IDLE     = 4'd0;
parameter STEP_INIT       =   4'd1;
parameter STEP_ROT_SUB_WORD = 4'd2;
parameter STEP_RCON     = 4'd3;
parameter STEP_XOR      = 4'd4;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input       iClk;
input       iReset_n;
input   [3:0]   iRcon;
input       iStart;
input   [127:0] iKey;
output  [127:0] oKey_expansion;
output      oKey_expansion_ready;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
reg     [127:0]   rKey_expansion;
reg     [31:0]  rKey_column_temp;
reg     [2:0]   rState_step;
reg         rKey_expansion_done;

wire [7 : 0] w0,w1,w2,w3; 
wire [7 : 0] wRcon_out;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oKey_expansion = rKey_expansion;
assign oKey_expansion_ready = rKey_expansion_done;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
sbox sbox_wi_0 (
.iEn_or_de(1'b1),
.iSbox(rKey_column_temp[7:0]),
.oSbox(w0)
);

sbox sbox_wi_1 (
.iEn_or_de(1'b1),
.iSbox(rKey_column_temp[15:8]),
.oSbox(w1)
);

sbox sbox_wi_2 (
  .iEn_or_de(1'b1),
  .iSbox(rKey_column_temp[23:16]),
  .oSbox(w2)
);

sbox sbox_wi_3 (
  .iEn_or_de(1'b1),
  .iSbox(rKey_column_temp[31:24]),
  .oSbox(w3)
);

rcon rcon1 (
.iRcon(iRcon + 4'h1),
// .iRcon(iRcon),
.oRcon(wRcon_out)
);

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
always @(posedge iClk or negedge iReset_n)
begin
   if (!iReset_n )
      begin
      rState_step = STEP_IDLE; 
      rKey_expansion = 128'h0;
      end
    else
      begin
    case(rState_step)
      STEP_IDLE:
        begin
          rKey_expansion_done = 1'b0;
          if (iRcon == 0)
            rKey_expansion = iKey;
          if((iStart == 1'b1 && iRcon < 9) || (iStart == 1'b1 && iRcon == 10))
              rState_step = STEP_INIT;
          else
              rState_step = STEP_IDLE;
        end
      STEP_INIT:
      begin
        rKey_column_temp = iKey[31 : 0];      
        rState_step = STEP_ROT_SUB_WORD;
      end
      STEP_ROT_SUB_WORD:
        begin
              rKey_column_temp = {w2,w1,w0,w3};
           rState_step = STEP_RCON;
        end
      STEP_RCON:
        begin
              rKey_column_temp[31:24] = rKey_column_temp[31:24] ^ wRcon_out;
          rState_step = STEP_XOR;
        end
      STEP_XOR:
        begin
            rKey_column_temp        = rKey_column_temp ^ iKey[127 : 96];
            rKey_expansion[127:96]  = rKey_column_temp;
            rKey_column_temp        = rKey_column_temp ^ iKey[95 : 64];
            rKey_expansion[95:64]   = rKey_column_temp;
            rKey_column_temp        = rKey_column_temp ^ iKey[63 : 32];
            rKey_expansion[63:32]   = rKey_column_temp; 
            rKey_column_temp        = rKey_column_temp ^ iKey[31 : 0];    
            rKey_expansion[31:0]    = rKey_column_temp;
            rKey_expansion_done     = 1'b1;
            rState_step = STEP_IDLE;
        end
	default:
	begin
	end

        endcase
      end
end

endmodule

/*****************************************************************************
 * Module     :     Affine Transformation Module
 * Staged     :       Stage 3
 *****************************************************************************/
module aff_tran (
  iA, 
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire w4_5, w6_7, w0_1, w2_3;
wire w01_23, w45_67, w01_67, w23_45;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign w0_1 = iA[0] ^ iA[1];
assign w2_3 = iA[2] ^ iA[3];
assign w4_5 = iA[4] ^ iA[5];
assign w6_7 = iA[6] ^ iA[7];

assign w45_67 = w4_5 ^ w6_7;
assign w01_23 = w0_1 ^ w2_3;
assign w01_67 = w0_1 ^ w6_7;
assign w23_45 = w2_3 ^ w4_5;

assign oB [0] = w45_67^(~iA[0]);
assign oB [1] = w01_67^(~iA[5]);
assign oB [2] = w01_67^iA[2];
assign oB [3] = w01_23^iA[7];
assign oB [4] = w01_23^iA[4];
assign oB [5] = w23_45^(~iA[1]);
assign oB [6] = w23_45^(~iA[6]);
assign oB [7] = w45_67^iA[3];

endmodule
/*****************************************************************************
 * Module     :       Galios x2 Multiplication
 * Staged     :       Stage 3
 *****************************************************************************/
module gm2 (
  iA, 
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oB = {iA[6:0], 1'b0} ^ (8'h1b & {8{iA[7]}});

endmodule
/*****************************************************************************
 * Module     :       Galios x3 Multiplication
 * Staged     :       Stage 3
 *****************************************************************************/
module gm4 (
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0] w1, w2;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oB = w2;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
gm2 inst1 (
  iA,
  w1
);

gm2 inst2 (
  w1,
  w2
);

endmodule
/*****************************************************************************
 * Module     :       Galios x8 Multiplication
 * Staged     :       Stage 3
 *****************************************************************************/
module gm8 (
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0] w1, w2;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oB = w2;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
gm4 inst3 (
  iA,
  w1
);

gm2 inst4 (
  w1,
  w2
);

endmodule
/*****************************************************************************
 * Module     :       Galios x9 Multiplication
 * Staged     :       Stage 3
 *****************************************************************************/
module gm09(
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0] w1;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
gm8 inst5 (
  iA,
  w1
);

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oB = w1 ^ iA;

endmodule
/*****************************************************************************
 * Module     :       Galios xB Multiplication
 * Staged     :       Stage 3
 *****************************************************************************/
module gm11 (
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0] w1, w2;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
gm8 inst6 (
  iA,
  w1
);

gm2 inst7 (
  iA,
  w2
);

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oB = w1 ^ w2 ^ iA;

endmodule
/*****************************************************************************
 * Module     :       Galios xD Multiplication
 * Staged     :       Stage 3
 *****************************************************************************/
module gm13 (
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0] w1, w2;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
gm8 inst8 (
  iA,
  w1
);

gm4 inst9 (
  iA,
  w2
);

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oB = w1 ^ w2 ^ iA;

endmodule
/*****************************************************************************
 * Module     :       Galios xE Multiplication
 * Staged     :       Stage 3
 *****************************************************************************/
module gm14 (
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0] w1, w2, w3;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
gm8 inst10 (
  iA,
  w1
);

gm4 inst11 (
  iA,
  w2
);

gm2 inst12 (
  iA,
  w3  
);

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oB = w1 ^ w2 ^ w3;

endmodule
/*****************************************************************************
 * Module     :     Inverse Affine Transformation Module
 * Staged     :       Stage 3
 *****************************************************************************/
module inv_aff_tran (
  iA, 
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire w0_5, w1_4, w2_7, w3_6;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign w0_5 = iA[0] ^ iA[5];
assign w1_4 = iA[1] ^ iA[4];
assign w2_7 = iA[2] ^ iA[7];
assign w3_6 = iA[3] ^ iA[6];

assign oB[0] = w2_7^(~iA[5]);
assign oB[1] = w3_6^iA[0];
assign oB[2] = w1_4^(~iA[7]);
assign oB[3] = w0_5^iA[2];

assign oB[4] = w3_6^iA[1];
assign oB[5] = w2_7^iA[4];
assign oB[6] = w0_5^iA[3];
assign oB[7] = w1_4^iA[6];

endmodule

/*****************************************************************************
 * Module     :     Inverse Map Operator Module
 * Staged     :       Stage 3
 *****************************************************************************/
module inv_map (
  iA, 
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire w1_2, w4_5;
wire w45_6, w12_3, w1_5_6;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign w1_2 = iA[1] ^ iA[2];
assign w4_5 = iA[4] ^ iA[5];
assign w45_6 = w4_5 ^ iA[6];
assign w12_3 = w1_2 ^ iA[3];
assign w1_5_6 = iA[1] ^ iA[5] ^ iA[6];

assign oB[7] = iA[7]^w1_5_6;
assign oB[6] = iA[6]^iA[2];
assign oB[5] = w1_5_6;
assign oB[4] = w45_6^w1_2;
assign oB[3] = w4_5^w12_3;
assign oB[2] = iA[7]^iA[4]^w12_3;
assign oB[1] = w4_5;
assign oB[0] = w45_6^iA[2]^iA[0];

endmodule

/*****************************************************************************
 * Module     :       Inverse MixColumn Module
 * Staged     :       Stage 2
 *****************************************************************************/
module inv_mixcolumn(
  iInv_mixcolumn,
  oInv_mixcolumn
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input  [31:0] iInv_mixcolumn;
output [31:0] oInv_mixcolumn;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
inv_mixw inv_mixw_0(
  iInv_mixcolumn,
  oInv_mixcolumn
);

endmodule


/*****************************************************************************
 * Module     :       Inverse MixColum One word (32 bit) Module
 * Staged     :       Stage 3
 *****************************************************************************/
module inv_mixw (
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [31:0] iA;
output [31:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0] b0, b1, b2, b3;
wire [7:0] wGm14_b0, wGm09_b0, wGm13_b0, wGm11_b0;
wire [7:0] wGm14_b1, wGm09_b1, wGm13_b1, wGm11_b1;
wire [7:0] wGm14_b2, wGm09_b2, wGm13_b2, wGm11_b2;
wire [7:0] wGm14_b3, wGm09_b3, wGm13_b3, wGm11_b3;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign b0 = iA[31:24];
assign b1 = iA[23:16];
assign b2 = iA[15:8];
assign b3 = iA[7:0];

assign oB[31:24] = wGm14_b0 ^ wGm11_b1 ^ wGm13_b2 ^ wGm09_b3;
assign oB[23:16] = wGm14_b1 ^ wGm11_b2 ^ wGm13_b3 ^ wGm09_b0;
assign oB[15:8]  = wGm14_b2 ^ wGm11_b3 ^ wGm13_b0 ^ wGm09_b1;
assign oB[7:0]   = wGm14_b3 ^ wGm11_b0 ^ wGm13_b1 ^ wGm09_b2;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
gm09 gm09_0 (
  b0,
  wGm09_b0
);

gm09 gm09_1 (
  b1,
  wGm09_b1
);

gm09 gm09_2 (
  b2,
  wGm09_b2
);

gm09 gm09_3 (
  b3,
  wGm09_b3
);

gm11 gm11_0 (
  b0,
  wGm11_b0
);

gm11 gm11_1 (
  b1,
  wGm11_b1
);

gm11 gm11_2 (
  b2,
  wGm11_b2
);

gm11 gm11_3 (
  b3,
  wGm11_b3
);

gm13 gm13_0 (
  b0,
  wGm13_b0
);

gm13 gm13_1 (
  b1,
  wGm13_b1
);

gm13 gm13_2 (
  b2,
  wGm13_b2
);

gm13 gm13_3 (
  b3,
  wGm13_b3
);

gm14 gm14_0 (
  b0,
  wGm14_b0
);

gm14 gm14_1 (
  b1,
  wGm14_b1
);

gm14 gm14_2 (
  b2,
  wGm14_b2
);

gm14 gm14_3 (
  b3,
  wGm14_b3
);

endmodule

/*****************************************************************************
 * Module     :     Map Module  
 * Staged     :       Stage 3
 *****************************************************************************/
module  map (
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire w1_2, w5_7, w4_6;
wire w12_3;
wire w123_7;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign w1_2 = iA[1] ^ iA[2];
assign w5_7 = iA[5] ^ iA[7];
assign w4_6 = iA[4] ^ iA[6];
assign w12_3 = w1_2 ^ iA[3];
assign w123_7 = w12_3 ^ iA[7];

assign oB[7] = w5_7;
assign oB[6] = w123_7^w4_6;
assign oB[5] = w5_7^iA[3]^iA[2];
assign oB[4] = w5_7^w12_3;
assign oB[3] = iA[7]^iA[6]^w1_2;
assign oB[2] = w123_7^iA[4];
assign oB[1] = w4_6^iA[1];
assign oB[0] = iA[6]^iA[1]^iA[0];
    
endmodule

/*****************************************************************************
 * Module     :     MixColumn
 * Staged     :       Stage 3
 *****************************************************************************/
module mixcolumn(
  iMixcolumn,
  oMixcolumn
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input  [31:0] iMixcolumn;
output [31:0] oMixcolumn;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
mixcolumn_8bit mix1 (
  iMixcolumn[31:24],
  iMixcolumn[23:16],
  iMixcolumn[15:8],
  iMixcolumn[7:0],
  oMixcolumn[31:24]
);

mixcolumn_8bit mix2 (
  iMixcolumn[23:16],
  iMixcolumn[15:8],
  iMixcolumn[7:0],
  iMixcolumn[31:24],
  oMixcolumn[23:16]
);

mixcolumn_8bit mix3 (
  iMixcolumn[15:8],
  iMixcolumn[7:0],
  iMixcolumn[31:24],
  iMixcolumn[23:16],
  oMixcolumn[15:8]
);

mixcolumn_8bit mix4 (
  iMixcolumn[7:0],
  iMixcolumn[31:24],
  iMixcolumn[23:16],
  iMixcolumn[15:8],
  oMixcolumn[7:0]
);

endmodule 

/*****************************************************************************
 * Module     :     MixColumn_8bit
 * Staged     :       Stage 3
 *****************************************************************************/
module mixcolumn_8bit(
  iA, iB, iC, iD, oE
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA, iB, iC, iD;
output [7:0] oE;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire wA7xorB7;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign wA7xorB7 = iA[7] ^ iB[7];

assign oE[7] = iA[6] ^ iB[6] ^ iB[7] ^ iC[7] ^ iD[7];
assign oE[6] = iA[5] ^ iB[5] ^ iB[6] ^ iC[6] ^ iD[6];
assign oE[5] = iA[4] ^ iB[4] ^ iB[5] ^ iC[5] ^ iD[5];
assign oE[4] = iA[3] ^ iB[3] ^ iB[4] ^ iC[4] ^ iD[4] ^ wA7xorB7;
assign oE[3] = iA[2] ^ iB[2] ^ iB[3] ^ iC[3] ^ iD[3] ^ wA7xorB7;
assign oE[2] = iA[1] ^ iB[1] ^ iB[2] ^ iC[2] ^ iD[2];
assign oE[1] = iA[0] ^ iB[0] ^ iB[1] ^ iC[1] ^ iD[1] ^ wA7xorB7;
assign oE[0] = iB[0] ^ iC[0] ^ iD[0] ^ wA7xorB7;

endmodule

/*****************************************************************************
 * Module     :     Multiply constant lamda Module
 * Staged     :       Stage 3
 *****************************************************************************/
module mul_cons_lamda (
  iA, 
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [3:0] iA;
output [3:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire w1;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign w1 = iA[2] ^ iA[0];

assign oB[3] = w1;
assign oB[2] = iA[3]^iA[1]^w1;
assign oB[1] = iA[3];
assign oB[0] = iA[2];
  
endmodule

/*****************************************************************************
 * Module     :     Multiply constant phi Module
 * Staged     :     Stage 3
 *****************************************************************************/
module mul_cons_phi (
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [1:0] iA;
output [1:0] oB;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oB[1] = iA[1]^iA[0];
assign oB[0] = iA[1];

endmodule

/*****************************************************************************
 * Module     :   Multi in GF(2^2) Module                       
 * Staged     :   Stage 3
 *****************************************************************************/
module mul_GF2_2 (
  iA,
  iB,
  oC
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [1:0] iA;
input [1:0]iB;
output [1:0] oC;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire wa1_b1;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign wa1_b1 = iA[1] & iB[1];

assign oC [1] = wa1_b1 ^ (iA[0]&iB[1]) ^ (iA[1]&iB[0]);
assign oC [0] = wa1_b1 ^ (iA[0]&iB[0]);

endmodule

/*****************************************************************************
 * Module     :   Multi in GF(2^4) Module
 * Staged     :     Stage 3
 *****************************************************************************/
module mul_GF2_4 (
  iA,
  iB,
  oC
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [3:0] iA;
input [3:0]iB;

output [3:0] oC;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [1:0] d, e, f, g, h, i;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign e = iA[3:2] ^ iA[1:0];
assign f = iB[3:2] ^ iB[1:0];

assign oC[3:2] = g ^ h;
assign oC[1:0] = i ^ h;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
mul_GF2_2 ins7 (
  iA[3:2], 
  iB[3:2], 
  d
);

mul_GF2_2 ins8 (
  e, 
  f, 
  g
);

mul_GF2_2 ins9 (
  iA[1:0], 
  iB[1:0],
  h
);

mul_cons_phi ins10 (
  d, 
  i
);

endmodule 

/*****************************************************************************
 * Module     :     Multiply inverse in GF(2^2) Module                    
 * Staged           :           Stage 3 
 *****************************************************************************/
module mul_inv (
  iA,
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [3:0] iA;
output [3:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire w0and3, w0and2, w1and2;
wire w03and1, w02and3, w12and3;
wire w1xor2;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign w0and3 = iA[0] & iA[3];
assign w0and2 = iA[0] & iA[2];
assign w1and2 = iA[1] & iA[2];
assign w1xor2 = iA[1] ^ iA[2];

assign w03and1 = w0and3 & iA[1];
assign w02and3 = w0and2 & iA[3];
assign w12and3 = w1and2 & iA[3];

assign oB[3] = iA[3] ^ w12and3 ^ w0and3 ^ iA[2];
assign oB[2] = w12and3 ^ w02and3 ^ w0and3 ^ w1and2 ^ iA[2];
assign oB[1] = iA[3] ^ w12and3 ^ w03and1 ^ w0and2 ^ w1xor2;
assign oB[0] = w12and3 ^ w02and3 ^ w03and1 ^ w0and3 ^ iA[3]&iA[1] ^ w1and2 ^ w1and2&iA[0] ^ iA[0] ^ w1xor2;

endmodule 

/*****************************************************************************
 * Module     :     Multiplicative inversion in GF(2^2) Module
 * Staged     :       Stage 3
 *****************************************************************************/
module mul_inv_module (
  iA, 
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [7:0] iA;
output [7:0] oB;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0] q;
wire [3:0] r, s, t, u, v, w;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
map ins3 (
  iA, 
  q
);

square_op ins4 (
  q[7:4], 
  r
);

mul_cons_lamda ins5 (
  r, 
  s
);

mul_GF2_4 ins6 (
  q[7:4]^q[3:0], 
  q[3:0], 
  t
);

mul_inv ins11 (
  {t^s}, 
  u
);

mul_GF2_4 ins12 (
  u, 
  q[7:4], 
  v
);

mul_GF2_4 ins13 (
  u,
  q[7:4]^q[3:0], 
  w
);

inv_map ins14 (
  {v,w}, 
  oB
);

endmodule

/*****************************************************************************
 * Module :               Rcon Module
 * Staged :               Staged 2                
 *****************************************************************************/
module rcon(
  iRcon,
  oRcon
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input  [3:0] iRcon;
output [7:0] oRcon;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0] wRcon [0:15]; 

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oRcon = wRcon[iRcon];

assign wRcon[4'h0] = 8'h00;
assign wRcon[4'h1] = 8'h01;
assign wRcon[4'h2] = 8'h02;
assign wRcon[4'h3] = 8'h04;
assign wRcon[4'h4] = 8'h08;
assign wRcon[4'h5] = 8'h10;
assign wRcon[4'h6] = 8'h20;
assign wRcon[4'h7] = 8'h40;
assign wRcon[4'h8] = 8'h80;
assign wRcon[4'h9] = 8'h1b;
assign wRcon[4'ha] = 8'h36;
assign wRcon[4'hb] = 8'h6c;
assign wRcon[4'hc] = 8'hd8;
assign wRcon[4'hd] = 8'hab;
assign wRcon[4'he] = 8'h4d;
assign wRcon[4'hf] = 8'h9a;

endmodule


/*****************************************************************************
 * Module     :     Sbox Module (SubBytes & InvSubBytes)                  
 * Staged           :           Stage 2   
 *****************************************************************************/
module sbox (
  iEn_or_de,
  iSbox,
  oSbox
);
  
/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input       iEn_or_de;
input  [7:0]  iSbox;
output [7:0]  oSbox;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
wire [7:0]    a, c, d;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
inv_aff_tran ins0 (
  iSbox, 
  a
);

mul_inv_module ins1 (
  iEn_or_de?iSbox:a, 
  c
);

aff_tran ins2 (
  c, 
  d
);

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oSbox = iEn_or_de ? d : c;

endmodule

/*****************************************************************************
 * Module     :     Square Operation Module
 * Staged     :           Stage 3                      
 *****************************************************************************/

module square_op (
  iA, 
  oB
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input [3:0] iA;
output [3:0] oB;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oB[3] = iA[3];
assign oB[2] = iA[3]^iA[2];
assign oB[1] = iA[2]^iA[1];
assign oB[0] = iA[3]^iA[1]^iA[0];

endmodule

