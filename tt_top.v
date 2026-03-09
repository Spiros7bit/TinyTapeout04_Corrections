module tt_top(
    input        clk, en,
    output [7:0] out
);
	//Declarations
   wire [15:0] lfsr16_out;
   wire [7:0]  lfsr8_out;
	wire        clk_slow;   // slower clock for LFSR8

    // clock divider: clk_slow = clk / 8
    clk_div #(.DIV(8)) u_div (
       .clk_in  (clk),
       .en      (en),
       .clk_out (clk_slow)
    );
	
	// Instantiations
   lfsr_16   u_lfsr16 (.clk(clk),      .en(en), .out(lfsr16_out));
   lfsr_8    u_lfsr8  (.clk(clk_slow), .en(en), .out(lfsr8_out)); 
   mux_16to8 u_mux    (.in(lfsr16_out), .sel(lfsr8_out), .out(out));

endmodule

// ─────────────────────────────────────────────
module clk_div #(parameter DIV = 8) (
    input  clk_in, en,
    output reg clk_out
);
	integer counter;

   always @(posedge clk_in) begin // this block counters the time pulses and set the slow clock
      if (!en) begin
          counter   <= 0;
          clk_out   <= 0;
      end else begin
			if (counter == (DIV/2) - 1) begin
            clk_out <= ~clk_out; //  toggle → div
            counter <= 0;
         end else begin
				counter <= counter + 1;
         end
		end
   end // always
endmodule

// ───────────────────LFSR 8──────────────────────────
`timescale 1ns/1ps // without this timescale specification the simulation dont run
module lfsr_8(
					 input            clk, en,
					 output reg [7:0] out
);
   always @(posedge clk) begin
       if (!en)
           out <= 8'b0000_0001;              
       else
           out <= {out[6:0], out[7]^out[5]^out[4]^out[3]}; 
   end
endmodule

// ───────────────────────LFSR 16──────────────────────
module lfsr_16(
					 input             clk, en,
					 output reg [15:0] out
);
   always @(posedge clk) begin
       if (!en)
           out <= 16'b00000000_00000001;
       else
           out <= {out[14:0], out[15]^out[13]^out[12]^out[10]};
   end
endmodule

// ──────────────────────MULTIPLEXER 16 TO 8───────────────────────

module mux_16to8(
						 input  [15:0] in,
						 input  [7:0]  sel,
						 output [7:0]  out    
);
   genvar i;
   generate
       for (i = 0; i < 8; i = i + 1) begin: generatre_block
           assign out[i] = sel[i] ? in[i*2+1] : in[i*2]; 
       end
   endgenerate

endmodule

