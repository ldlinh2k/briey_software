module Con_Cate_Bits_With_Clock_Module (input iClk, input iReset, input[31:0] numA, input [31:0] numB, output reg[31:0] res);
	reg[31:0] counter;
	reg[31:0] memory;
	always@(posedge iClk, negedge iReset)
	if(iReset) 
	begin
			counter<=0;
	end
	else counter <=counter +1;
	
	always@(posedge iClk)
	if(iReset) memory<=0;
	else
	begin
		if(numA[0]==0) res<=0;
		else res<=1;
	end

endmodule
