module receiver(
    input clk,
    input rst,
    input rx,
    input rdy_clr,
    input clk_en,
    output reg rdy,
    output reg [7:0] data_out
);

    parameter IDLE  = 2'b00;
    parameter DATA  = 2'b01;
    parameter STOP  = 2'b10;

    reg [1:0] state;
    reg [2:0] index;
    reg [7:0] temp_register;

    always @(posedge clk)
    begin
        if(rst)
        begin
            state <= IDLE;
            index <= 3'd0;
            temp_register <= 8'd0;
            data_out <= 8'd0;
            rdy <= 1'b0;
        end
        else
        begin
            if(rdy_clr)
                rdy <= 1'b0;

            if(clk_en)
            begin
                case(state)

                    IDLE:
                    begin
                        if(rx == 1'b0)
                        begin
                            index <= 3'd0;
                            state <= DATA;
                        end
                    end

                    DATA:
                    begin
                        temp_register[index] <= rx;

                        if(index == 3'd7)
                            state <= STOP;
                        else
                            index <= index + 1'b1;
                    end

                    STOP:
                    begin
                        if(rx == 1'b1)
                        begin
                            data_out <= temp_register;
                            rdy <= 1'b1;
                        end

                        state <= IDLE;
                    end

                    default:
                        state <= IDLE;

                endcase
            end
        end
    end
