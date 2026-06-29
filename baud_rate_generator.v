module baud_rate_generator(
    input clk,
    input rst,
    output reg baud_en
);

reg [1:0] counter;

always @(posedge clk)
begin
    if(rst)
    begin
        counter <= 0;
        baud_en <= 0;
    end
    else
    begin
        if(counter == 3)
        begin
            counter <= 0;
            baud_en <= 1;
        end
        else
        begin
            counter <= counter + 1;
            baud_en <= 0;
        end
    end
end

endmodule
