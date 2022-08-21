

module PRESENT_WRAPPER(

        output	reg	[31:0]	odat,   

		input				clk,

		input				iReset,

        input		[31:0]	idat,   

        input				iChipselect_n,    

        input				iWrite_n,   

        input				iRead_n,    

		input		[3:0]	iAddress

);



/*Address:

	0000:	load: 0x0

	1000:	control: 0x8

	00xx:	iKey:0x3[79:48];0x2[47:16];0x1[15:0];

	010x:	iDat: 0x4;0x5

	001x:	oData:0x6;0x7 (present)

	oData : 0x9 (dm_present)

*/

wire	[63:0]	odreg;

wire    [63:0]  odreg_dmpresent;

reg				reset_n;

reg		[63:0]	data;

reg		[79:0]	iKey;

reg				load;

reg				control;

wire			done;

wire			done_dmpresent;



always@(posedge clk or posedge iReset)

begin

	if(iReset)

	begin

		odat <=32'b0;

		reset_n <= ~iReset;

	end

	else

	begin

		if(~iChipselect_n)

		begin

			reset_n <=1'b1;

		//input

			if(~iWrite_n)

			begin

				odat <=32'b0;

				case(iAddress[3:0])

				//load

					4'd0:	load <=idat[0];

				//KEY

					4'd3:	iKey[79:48] <= idat;

					4'd2:	iKey[47:16]	<= idat;

					4'd1:	iKey[15:0]	<= idat[15:0];

				//iData

					4'd5:	data[63:32] <= idat;

					4'd4:	data[31:0]	<= idat;

				//control encrypt or decrypt

					4'd8:	control <= idat;

					default:

					begin

					end

				endcase

			end

			else

		//ouput

			begin

				load <= 1'b0;

				if(~iRead_n)

					case(iAddress[3:0])

						4'd7:	odat <= odreg[63:32];

						4'd6:	odat <= odreg[31:0];



						4'd10:  odat <= odreg_dmpresent[63:32];

						4'd9:   odat <= odreg_dmpresent[31:0];

						default:

						begin

						end

					endcase	

				else

					odat <= odat;

			end	

		end

		else

			odat <=odat;

	end

end



PRESENT_CORE present_dut(.odat(odreg),.iReset_n(reset_n),.idat(data),.key(iKey),.load(load),.clk(clk),.control(control),.done(done));

DMPRESENT dmpresent_dut(.odat(odreg_dmpresent),.iReset_n(reset_n),.idat(data),.key(iKey),.load(load),.clk(clk),.done(done_dmpresent));

endmodule

module SBOX (
   output reg [3:0] odat,
   input      [3:0] idat
);


always @(idat)
    case (idat)
        4'h0 : odat = 4'hC;
        4'h1 : odat = 4'h5;
        4'h2 : odat = 4'h6;
        4'h3 : odat = 4'hB;
        4'h4 : odat = 4'h9;
        4'h5 : odat = 4'h0;
        4'h6 : odat = 4'hA;
        4'h7 : odat = 4'hD;
        4'h8 : odat = 4'h3;
        4'h9 : odat = 4'hE;
        4'hA : odat = 4'hF;
        4'hB : odat = 4'h8;
        4'hC : odat = 4'h4;
        4'hD : odat = 4'h7;
        4'hE : odat = 4'h1;
        4'hF : odat = 4'h2;
    endcase

endmodule

module PRESENT_ENCRYPT (
        output	reg	[63:0]	odat,   
        input		[63:0]	idat,   
        input		[79:0]	key,    
        input				load,   
        input				clk,  
		input				chip_enable,
		output	reg			done
    );

//---------wires, registers----------
reg  [79:0] kreg;				// key registers             
reg  [63:0] dreg;               // data registers
reg  [4:0]  round;				// round counter
wire [63:0] dat1,dat2,dat3;     // intermediate data
wire [79:0] kdat1,kdat2;        // intermediate subkey data      

// key generation
assign kdat1        = {kreg[18:0], kreg[79:19]}; // rotate key 61 bits to the left
assign kdat2[14:0 ] = kdat1[14:0 ];
assign kdat2[19:15] = kdat1[19:15] ^ round;  // xor key[19:15] data and round counter
assign kdat2[75:20] = kdat1[75:20];
SBOX sBoxKey ( .odat(kdat2[79:76]), .idat(kdat1[79:76]) );

// add round key
assign dat1 = dreg ^ kreg[79:16]; 

// SboxLayer
genvar i;
generate
    for (i=0; i<64; i=i+4) begin: sbox_loop
       SBOX sBox( .odat(dat2[i+3:i]), .idat(dat1[i+3:i]) );
    end
endgenerate

// PboxLayer
PBOX pBox    ( .odat(dat3), .idat(dat2) );

always @(posedge clk)
begin
	if (chip_enable)
	begin
		if (load)
		begin
			dreg <= idat;
			kreg <= key;
			round <= 1;
			done <=1'b0;
			odat <=64'h0;
		end
		else
		begin
			dreg <= dat3;
			kreg <= kdat2;
			round <= round + 1;
		end
		if (round == 0)
		begin
			odat <= dat1;   
			done <=1'b1;
		end	
		else
			done <=1'b0;
	end
	else
	begin
		done <=1'b0;
		odat <=64'h0;
	end
end
endmodule

module PRESENT_DECRYPT (
        output	reg	[63:0]	odat,   
        input		[63:0]	idat,   
        input		[79:0]	key,    
        input				load,  
        input				clk, 
		input				chip_enable,
		output				reg	done
);

//---------wires, registers----------
reg  [79:0] kreg,ikreg;			// key/invKey registers              
reg  [63:0] dreg;               // data registers
reg  [4:0]  round;              // round counter
reg			Dprocess,loadD;		// control decrypt process	
wire [63:0] dat1,dat2,dat3;		// intermediate data  
wire [79:0] kdat1,kdat2;		// intermediate subkey data      
wire [79:0] ikdat1,ikdat2;		// intermediate subinvkey data

// invKey generation
assign ikdat1 = {ikreg[79:20],ikreg[19:15] ^ (5'd32-round),ikreg[14:0]}; // xor key[19:15] round
assign ikdat2[14:0] = ikdat1[75:61];  
assign ikdat2[79:19] = ikdat1[60:0 ];
INV_SBOX sBoxInvKey ( .odat(ikdat2[18:15]), .idat(ikdat1[79:76]) );

// key generation
assign kdat1        = {kreg[18:0], kreg[79:19]}; // rotate key 61 bits to the left
assign kdat2[14:0 ] = kdat1[14:0 ];
assign kdat2[19:15] = kdat1[19:15] ^ round;  // xor key[19:15] data and round counter
assign kdat2[75:20] = kdat1[75:20];
SBOX sBoxKey ( .odat(kdat2[79:76]), .idat(kdat1[79:76]) );

// add round key
assign dat1 = dreg^ikreg[79:16] ; 

//invPboxLayer
INV_PBOX pBox    ( .odat(dat2), .idat(dat1) );
// invSboxLayer
genvar i;
generate
    for (i=0; i<64; i=i+4) begin: sbox_loop
       INV_SBOX sBox( .odat(dat3[i+3:i]), .idat(dat2[i+3:i]) );
    end
endgenerate


always @(posedge clk )
begin
	if (chip_enable)
	begin
	// load/update data
		if (load)
		begin
			dreg <= idat;
			odat <= 64'h0;
		end
		else
		begin
			if (Dprocess & ~loadD)
					dreg <= dat3;	
			else 
				dreg <= dreg;
		end	
	// load/update KEY in creating invKey process
		if (load)
		    kreg <= key; 
	    else
		begin
			if (~Dprocess & ~(round==0))	
				kreg <= kdat2;
			else
				kreg <=kreg;
		end
	// load/update invKEY
		if (Dprocess)
		begin 
		   if (loadD)
			  ikreg[79:0] <= kreg[79:0];
		   else 
			  ikreg <= ikdat2;
		end
		else
			ikreg <= 80'b0;
		
	// set control variables to start decrypting process 
		if (round == 31)
		begin
			Dprocess <= ~Dprocess;
			loadD <= 1'b1;
		end
		else 
			loadD <= 1'b0;	
	// creat the control variables of decrypting process	
		if (load)
		begin
			round <= 5'd1;
			Dprocess <=1'b0;
			loadD <= 1'b0;
		end
		else 
			round <= round + 1;	
	// output 
		if (round==0 & ~Dprocess)
		begin
			odat <= dat1;
			done = 1'b1;
		end
		else
			done = 1'b0;	
	end
	else
	begin
		done = 1'b0;	
		odat <= 64'h0;
	end
end
endmodule

module PRESENT_CORE (
        output	reg	[63:0]	odat,   
		input				iReset_n,
        input		[63:0]	idat,  
        input		[79:0]	key,    
        input				load,   
        input				clk,    
		input				control, //=0=>encrypt; =1=>decrypt
		output	reg			done
);

wire [63:0]		odreg_en,odreg_de;
reg [63:0]		idreg;
reg [79:0]		kdreg;
reg		chip_enable_en,chip_enable_de;
reg				load_reg;
wire		already_en,already_de;


always @(posedge clk or negedge iReset_n)	
begin
	if(~iReset_n)
	begin
		chip_enable_en <=1'b0;
		chip_enable_de <=1'b0;
		idreg <= 64'h0;
		kdreg <= 80'h0;
		load_reg <= 1'b0;
		odat <= 64'h0;
	end
	else
	begin
		if (load)
		begin 
			idreg <= idat;
			kdreg <= key;
			load_reg <= load;
			odat <= odat;
			if(~control)
			begin
				chip_enable_en <= 1'b1;
				chip_enable_de <=1'b0;
			end
			else
			begin
				chip_enable_en <= 1'b0;
				chip_enable_de <=1'b1;
			end
		end
		else
		begin
			load_reg <= 1'b0;
			idreg <= idreg;
			kdreg <= kdreg;
			chip_enable_en <= chip_enable_en;
			chip_enable_de <= chip_enable_de;
		end
		if(chip_enable_en)
			odat <= odreg_en;
		else if (chip_enable_de )
				odat <= odreg_de;
		else
			odat <=odat;
		if (already_de)
			chip_enable_de <=1'b0;
		if (already_en)
			chip_enable_en <=1'b0;
	end	
	done <= already_de | already_en;
end
	PRESENT_ENCRYPT en(odreg_en, idreg, kdreg, load_reg, clk, chip_enable_en,already_en);	
	PRESENT_DECRYPT de(odreg_de, idreg, kdreg, load_reg, clk, chip_enable_de,already_de);	
endmodule 

module PBOX(
   output [63:0] odat,
   input  [63:0] idat
);

assign odat[0 ] = idat[0 ];
assign odat[16] = idat[1 ];
assign odat[32] = idat[2 ];
assign odat[48] = idat[3 ];
assign odat[1 ] = idat[4 ];
assign odat[17] = idat[5 ];
assign odat[33] = idat[6 ];
assign odat[49] = idat[7 ];
assign odat[2 ] = idat[8 ];
assign odat[18] = idat[9 ];
assign odat[34] = idat[10];
assign odat[50] = idat[11];
assign odat[3 ] = idat[12];
assign odat[19] = idat[13];
assign odat[35] = idat[14];
assign odat[51] = idat[15];

assign odat[4 ] = idat[16];
assign odat[20] = idat[17];
assign odat[36] = idat[18];
assign odat[52] = idat[19];
assign odat[5 ] = idat[20];
assign odat[21] = idat[21];
assign odat[37] = idat[22];
assign odat[53] = idat[23];
assign odat[6 ] = idat[24];
assign odat[22] = idat[25];
assign odat[38] = idat[26];
assign odat[54] = idat[27];
assign odat[7 ] = idat[28];
assign odat[23] = idat[29];
assign odat[39] = idat[30];
assign odat[55] = idat[31];

assign odat[8 ] = idat[32];
assign odat[24] = idat[33];
assign odat[40] = idat[34];
assign odat[56] = idat[35];
assign odat[9 ] = idat[36];
assign odat[25] = idat[37];
assign odat[41] = idat[38];
assign odat[57] = idat[39];
assign odat[10] = idat[40];
assign odat[26] = idat[41];
assign odat[42] = idat[42];
assign odat[58] = idat[43];
assign odat[11] = idat[44];
assign odat[27] = idat[45];
assign odat[43] = idat[46];
assign odat[59] = idat[47];

assign odat[12] = idat[48];
assign odat[28] = idat[49];
assign odat[44] = idat[50];
assign odat[60] = idat[51];
assign odat[13] = idat[52];
assign odat[29] = idat[53];
assign odat[45] = idat[54];
assign odat[61] = idat[55];
assign odat[14] = idat[56];
assign odat[30] = idat[57];
assign odat[46] = idat[58];
assign odat[62] = idat[59];
assign odat[15] = idat[60];
assign odat[31] = idat[61];
assign odat[47] = idat[62];
assign odat[63] = idat[63];

endmodule

module INV_SBOX (
   output reg [3:0] odat,
   input      [3:0] idat
);

always @(idat)
    case (idat)
        4'h0 : odat = 4'h5;
        4'h1 : odat = 4'hE;
        4'h2 : odat = 4'hF;
        4'h3 : odat = 4'h8;
        4'h4 : odat = 4'hC;
        4'h5 : odat = 4'h1;
        4'h6 : odat = 4'h2;
        4'h7 : odat = 4'hD;
        4'h8 : odat = 4'hB;
        4'h9 : odat = 4'h4;
        4'hA : odat = 4'h6;
        4'hB : odat = 4'h3;
        4'hC : odat = 4'h0;
        4'hD : odat = 4'h7;
        4'hE : odat = 4'h9;
        4'hF : odat = 4'hA;
    endcase

endmodule

module INV_PBOX(
   output [63:0] odat,
   input  [63:0] idat
);                    
                    
assign odat[0 ] = idat[0 ];
assign odat[4] = idat[1 ];
assign odat[8] = idat[2 ];
assign odat[12] = idat[3 ];
assign odat[16] = idat[4 ];
assign odat[20] = idat[5 ];
assign odat[24] = idat[6 ];
assign odat[28] = idat[7 ];
assign odat[32] = idat[8 ];
assign odat[36] = idat[9 ];
assign odat[40] = idat[10];
assign odat[44] = idat[11];
assign odat[48] = idat[12];
assign odat[52] = idat[13];
assign odat[56] = idat[14];
assign odat[60] = idat[15];

assign odat[1 ] = idat[16];
assign odat[5 ] = idat[17];
assign odat[9 ] = idat[18];
assign odat[13] = idat[19];
assign odat[17] = idat[20];
assign odat[21] = idat[21];
assign odat[25] = idat[22];
assign odat[29] = idat[23];
assign odat[33] = idat[24];
assign odat[37] = idat[25];
assign odat[41] = idat[26];
assign odat[45] = idat[27];
assign odat[49] = idat[28];
assign odat[53] = idat[29];
assign odat[57] = idat[30];
assign odat[61] = idat[31];

assign odat[2 ] = idat[32];
assign odat[6 ] = idat[33];
assign odat[10] = idat[34];
assign odat[14] = idat[35];
assign odat[18] = idat[36];
assign odat[22] = idat[37];
assign odat[26] = idat[38];
assign odat[30] = idat[39];
assign odat[34] = idat[40];
assign odat[38] = idat[41];
assign odat[42] = idat[42];
assign odat[46] = idat[43];
assign odat[50] = idat[44];
assign odat[54] = idat[45];
assign odat[58] = idat[46];
assign odat[62] = idat[47];

assign odat[3 ] = idat[48];
assign odat[7 ] = idat[49];
assign odat[11] = idat[50];
assign odat[15] = idat[51];
assign odat[19] = idat[52];
assign odat[23] = idat[53];
assign odat[27] = idat[54];
assign odat[31] = idat[55];
assign odat[35] = idat[56];
assign odat[39] = idat[57];
assign odat[43] = idat[58];
assign odat[47] = idat[59];
assign odat[51] = idat[60];
assign odat[55] = idat[61];
assign odat[59] = idat[62];
assign odat[63] = idat[63];

endmodule
module DMPRESENT (
        output	reg	[63:0]	odat, 
		input				iReset_n,
        input		[63:0]	idat,   
        input		[79:0]	key,   
        input				load,  
        input				clk,     
		output	reg			done
);

//---------wires, registers----------
reg	[79:0] kreg;               // key register
reg  [63:0] dreg;               // data register
reg  [4:0]  round;              // round counter
wire [63:0] dat1,dat2,dat3;     // intermediate data
wire [79:0] kdat1,kdat2;        // intermediate subkey data 
reg			active; 
wire [63:0] odreg;
reg	 [63:0]		idreg;
assign odreg = dat1 ^ idreg;
// key generation
assign kdat1        = {kreg[18:0], kreg[79:19]}; // rotate key 61 bits to the left
assign kdat2[14:0 ] = kdat1[14:0 ];
assign kdat2[19:15] = kdat1[19:15] ^ round;  // xor key[19:15] data and round counter
assign kdat2[75:20] = kdat1[75:20];
SBOX sBoxKey ( .odat(kdat2[79:76]), .idat(kdat1[79:76]) );

// add round key
assign dat1 = dreg ^ kreg[79:16]; 

// sBoxLayer
genvar i;
generate
    for (i=0; i<64; i=i+4) begin: sbox_loop
       SBOX sBox( .odat(dat2[i+3:i]), .idat(dat1[i+3:i]) );
    end
endgenerate

// pBoxLayer
PBOX pBox    ( .odat(dat3), .idat(dat2) );

always @(posedge clk)
begin
	if (iReset_n)
	begin
		if (load)
		begin
			idreg <= idat;
			dreg <= idat;
			kreg <= key;
			round <= 1;
			odat <= 64'h0;
			active <=1'b1;
		end
		else if (active)
		begin	
			dreg <= dat3;
			kreg <= kdat2;
			round <= round + 1;
		end
		if (round == 0)
		begin
			odat <= odreg; // or input data  
			done <=1'b1;
			active <= 1'b0;
		end	
		else
		begin
			done <=1'b0;
		end
	end
	else
	begin
		odat <=64'h0;
		done <=1'b0;
	end
end
endmodule