module Avalon_test_module(
  input iClk,
  input iReset,
  input iChipselect,
  input iWrite_n,
  input iRead_n,
  input [1:0] iAddress,
  input [31:0]  iData,
  output  reg [31:0]  oData
 );
reg[31:0] memory1,memory2,memory3,memory4;
	always@(posedge iClk)
	if(iChipselect)
	begin
		if(~iWrite_n)
		begin
			case(iAddress)
			2'b00:	memory1 <=iData;
			2'b01:	memory2 <=iData;
			2'b10:	memory3 <=iData;
			2'b11:	memory4 <=iData;
			endcase
		end
		else if(~iRead_n)
		begin
			case(iAddress)
			2'b00:	oData  <=memory1;
			2'b01:	oData  <=memory2;
			2'b10:	oData  <=memory3;
			2'b11:	oData  <=memory4;
			endcase
		end	
	end

endmodule
