`timescale 10ps/1ps //`timescale <reference_time_unit>/<time_precision>

// Testbench for flipflop

module tb_flipflop();
	 parameter WIDTH = 4;
// Inputs
input bit      cclk;
input bit      rst_n;
input logic    [0:WIDTH-1] d;
output logic   q;
input logic finish_number

ff_d(.cclk(cclk), "negedge", .rst_n(rst_n), .d(d), .q(q), .finish_number(finish_number));

initial begin
//values
reset <= 0;
d <= 4'b0101;
clk <= 0;

#10 reset <= 1;
#15 d <= 4'b0101;
#10 reset <= 0;
#15 d <= 4'b0111;
#10 reset <= 0;
#15 d <= 4'b0011;
end			
endmodule
