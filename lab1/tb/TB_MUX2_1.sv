`timescale 10ps/1ps //`timescale <reference_time_unit>/<time_precision>
// Testbench del multiplexor 2x16
module TB_MUX2_1();
	 parameter WIDTH = 4;
// Inputs

    reg[WIDTH-1:0] data_0;
    reg[WIDTH-1:0] data_1;
    reg sel;
    integer s_gold, Num_errors;
	 integer i, j, k; // i, j, k representan los operandos
// OutputS
    wire [WIDTH-1:0] data_out;
// Instanciacion del DUT
    MUX2_1 UUT (.data_0(data_0),.data_1(data_1),.sel(sel),.data_out(data_out));

// Inicialización de las entradas
    `ifdef auto_init
        initial begin
            i = 0; j = 0;k = 0;
				sel=i; data_0=j; data_1=k;
				#1;
        end
    `endif
initial #1000 $finish;
initial Num_errors = 0;

initial begin
for (i = 0; i < 2; i = i + 1) begin
for (j = 0; j < 2**WIDTH; j = j + 1)begin
for (k = 0; k < 2**WIDTH; k = k + 1)begin
	sel=i; data_0=j; data_1=k;
	
	if (i) s_gold = k;
	else s_gold = j;

	#1 if (data_out ^ s_gold) begin  // Observe el tiempo de espera
	Num_errors = Num_errors + 1;
	$display ("Error: select = %b", i);
	$display ("Error: data_0 = %d   data_1 = %d  sel = %b", j, k, i);
	$display ("Error: Valor Esperado = %h  Valor obtenido = %h", s_gold, data_out);
	end
end
end
end
	$display ("Num_errors = %d", Num_errors);
end	  // end el initial begin
endmodule
