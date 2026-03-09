`timescale 1ns/1ps

module tt_top_tb;
	
	//declaration
	reg clk, en;
	wire [7:0] out;
	
	//clock
	always #10 clk = ~clk;
	
	//DUT instantation
	tt_top tt0 (	.clk(clk),
						.en(en),
						.out(out)
	);
	
	//Test
	initial begin
	
		//initializations
		clk <= 0;
		en <= 0;
		
		#10 en <= 1;
		
		#900 $finish;
	
	end
	

endmodule