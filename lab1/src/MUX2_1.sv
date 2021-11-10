
module MUX2_1
   #(parameter WIDTH=4)
   (input logic [WIDTH-1:0] data_0,data_1,
    input logic sel,
    output logic [WIDTH-1:0] data_out);
	 assign data_out = sel ? data_1 : data_0;
   endmodule