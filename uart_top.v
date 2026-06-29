module uart_top(

input clk,
input rst,
input wr_en,
input [7:0] data_in,
input rdy_clr,

output busy,
output rdy,
output [7:0] data_out

);

wire baud_en;
wire tx;

baud_rate_generator bg(

.clk(clk),
.rst(rst),
.baud_en(baud_en)

);

transmitter tx1(

.clk(clk),
.rst(rst),
.baud_en(baud_en),
.wr_en(wr_en),
.data_in(data_in),
.tx(tx),
.busy(busy)

);

receiver rx1(

.clk(clk),
.rst(rst),
.rx(tx),
.rdy_clr(rdy_clr),
.clk_en(baud_en),
.rdy(rdy),
.data_out(data_out)

);

endmodule
