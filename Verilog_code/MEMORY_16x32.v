module MEMORY_16x32
#(
	parameter DATA_WIDTH = 32,
	parameter ADDRESS_WIDTH = 4 		// 2^4 = 16 address
) (
	input iClk,
	input iReset,
	
	input iChipSelect,
	input iRead,
	input iWrite,
	
	input 	[ADDRESS_WIDTH - 1:0] iAddress,

	input 	[DATA_WIDTH - 1:0] iData,
	output 	[DATA_WIDTH - 1:0] oData
);

/*****************************************************************************
 *           Internal Wires, Registers and Paramemters Declarations          *
 *****************************************************************************/
reg [(DATA_WIDTH - 1)	:0] 	mem	[(2**ADDRESS_WIDTH - 1):0]; // 2^ADDRESS_WIDTH; 4 bit address -> 2^4 adddress -> 2^4 memory "cells" 32 bit
reg [(ADDRESS_WIDTH - 1):0] 	address_reg;



/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign oData = mem[address_reg];



/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
always@(posedge iClk)
begin

	if(iChipSelect & iWrite)
	begin
		mem[iAddress] <= iData;
	end
	
	
	else if(iChipSelect & iRead)
	begin
		address_reg <= iAddress;
	end
end



endmodule
