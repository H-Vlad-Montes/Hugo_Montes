
module flipflop
   #(parameter WIDTH=4)
   (input logic [WIDTH-1:0] data_0,
    input logic clk,
    output logic [WIDTH-1:0] data_out);
	ifdef posRST
		always @ (posedge clk)
		begin
			q <= d;
		end
	else
		always @ (negedge clk)
		begin
			q <= d;
		end
	endif
   endmodule