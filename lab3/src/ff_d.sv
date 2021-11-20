module ff_d (
// clock
input bit      cclk,
// reset
input bit      rst_n, 
// Data to store
input logic    d,
// Stored data
output logic   q,
// finish number
input logic finish_number
);

`include "ff_macro.def"

`FF_D(cclk, "negedge", rst_n, d, q);

`severity_task("fatal",finish_number);

endmodule
