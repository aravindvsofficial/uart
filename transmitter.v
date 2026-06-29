module transmitter(

input clk,
input rst,
input baud_en,
input wr_en,
input [7:0] data_in,

output reg tx,
output busy

);

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

reg [1:0] state;
reg [7:0] data;
reg [2:0] bit_count;

assign busy = (state != IDLE);

always @(posedge clk)
begin

if(rst)
begin
    state <= IDLE;
    tx <= 1'b1;
    bit_count <= 0;
    data <= 0;
end

else
begin

case(state)

IDLE:
begin
    tx <= 1'b1;

    if(wr_en)
    begin
        data <= data_in;
        bit_count <= 0;
        state <= START;
    end
end

START:
begin
    if(baud_en)
    begin
        tx <= 1'b0;
        state <= DATA;
    end
end

DATA:
begin
    if(baud_en)
    begin

        tx <= data[bit_count];

        if(bit_count==7)
            state <= STOP;
        else
            bit_count <= bit_count + 1;

    end
end

STOP:
begin
    if(baud_en)
    begin
        tx <= 1'b1;
        state <= IDLE;
    end
end

default:
state <= IDLE;

endcase

end

end

endmodule
