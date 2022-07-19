module Con_Cate_Bits_Module (input[31:0] numA, input [31:0] numB, output[31:0] res);

	assign res = {numA[31:16],numB[15:0]};

endmodule
