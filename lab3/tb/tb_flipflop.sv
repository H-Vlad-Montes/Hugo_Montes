`timescale 10ps/1ps //`timescale <reference_time_unit>/<time_precision>

// Testbench for flipflop

module tb_flipflop();
	 parameter WIDTH = 4;
// Inputs

    task check_ff;
    input data, clock, reset, out;
    logic [WIDTH-1:0] data;
    logic clock, reset;
    logic [WIDTH-1:0] q_gold;
    logic [WIDTH-1:0] out;

begin // compare to value

	`ifdef pos_clr
	begin
	if(reset)
	q_gold = 4'b0;
	else q_gold = data;
	end
		`ifdef fatal 
		if(q_gold != out)
		$fatal($time);
			`elsif warning 
			if(q_gold != out)
			$warning($time);
			elsif error
			if(q_gold != out)
			$error($time);
		`else 
		if(q_gold != out)
		$info($time, "error");
		endif
	 else
	begin
	if(!reset)
	q_gold = 4'b0;
	else q_gold = data;
	end
		`ifdef fatal 
		if(q_gold != out)
		$fatal($time);
			`elsif warning 
			if(q_gold != out)
			$warning($time);
			`elsif error 
			if(q_gold != out)
			$error($time);
		`else 
		if(q_gold != out)
		$info($time, "error");
	`endif 
`endif 
end
endtask

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
			
endmodule
