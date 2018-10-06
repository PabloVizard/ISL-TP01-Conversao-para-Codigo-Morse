module codifMorse (num, morse, display, reset, ready);

                                                                                                                                                                                                                                                            // A = num[5]
                                                                                                                                                                                                                                                            // B = num[4]
                                                                                                                                                                                                                                                            // C = num[3]
                                                                                                                                                                                                                                                            // D = num [2]
                                                                                                                                                                                                                                                            // E = num[1]
 // F = num[0]

    input reset;
    input ready;
    input wire[5:0] num;
    output reg[4:0] morse;
    output reg[4:0] display;

    always @(ready, ready) begin
        if (~reset & ready) begin

          morse[4] <= (num[3] & num[2] & num[1]) | (num[4] & ~num[2] & num[0]) | (num[5] & ~num[1] & ~num[0]) |
                      (~num[5] & ~num[3] & ~num[1] & num[0]) | (~num[5] & ~num[3] & ~num[2] & num[1]) | (~num[4] & ~num[3] & num[2] & ~num[1]) |
                      (~num[4] & num[3] & num[1] & ~num[0]) | (num[4] & num[3] & num[2] & ~num[0]);

          morse[3] <= (num[3] & num[2]) | (~num[4] & num[2] & ~num[1]) | (~num[4] & num[2] & ~num[0]) | (num[5] & ~num[1] & num[0]) | (num[2] & ~num[1] & ~num[0]) |
                      (~num[3] & ~num[2] & num[1] & ~num[0]) | (num[4] & num[2] & num[1] & num[0]) | (~num[5] & ~num[4] & ~num[2] & num[1] & num[0]) |
                      (num[4] & ~num[3] & ~num[2] & ~num[1] & num[0]);

          morse[2] <= (num[5] & num[0]) | (~num[4] & ~num[3] & num[2]) | (num[2] & ~num[1] & num[0]) | (num[3] & ~num[2] & num[1]) | (num[4] & num[2] & num[0]) |
                      (~num[4] & ~num[3] & num[1] & num[0]) | (num[4] & ~num[3] & ~num[2] & ~num[1]) | (num[4] & num[3] & num[2] & ~num[1]);

          morse[1] <= (~num[4] & num[2]) | (num[4] & ~num[1]) | (~num[4] & num[3] & ~num[0]) | (~num[4] & num[3] & num[1]) | (num[5] & num[1] & num[0]);

          morse[0] <= (num[3]) | (num[2] & num[0]) | (num[2] & num[1]);


          display[4] <= 1;

          display[3] <= (~num[3]) | (~num[2]) | (~num[4] & ~num[1]) | (num[1] & num[0]) | (num[4] & ~num[0]);

          display[2] <= (~num[1] & ~num[0]) | (~num[4] & ~num[3]) | (~num[3] & ~num[1]) | (~num[2] & num[0]) | (~num[4] & num[0]) | (num[4] & num[3] & num[1]);

          display[1] <= (num[5] & num[1]) | (~num[5] & ~num[4] & ~num[3]) | (~num[4] & ~num[2] & num[0]) | (~num[3] & ~num[2] & num[0]) | (~num[3] & ~num[1] & num[0]) |
                        (~num[2] & ~num[1] & num[0]) | (~num[5] & ~num[4] & ~num[1] & ~num[0]) | (num[3] & num[2] & num[1] & num[0]) | (num[4] & num[3] & ~num[2] & num[1] & ~num[0]);

          display[0] <= (~num[5] & ~num[4] & ~num[3]) | (~num[5] & ~num[4] & ~num[2] & ~num[1]);

        end

      if(reset) begin
         morse[4] <= 0;
  			 morse[3] <= 0;
  			 morse[2] <= 0;
  			 morse[1] <= 0;
  			 morse[0] <= 0;
      end
    end
endmodule

module demuxDisplay (
    input wire num,
    input wire display,
    input wire ready,

    output wire ponto,
    output wire traco
);

    assign  traco = (display & ~num);
    assign  ponto = (display & num);


endmodule

module sevSeg(
	 input wire ponto,
	 input wire traco,
	 output wire [6:0] display
	 );

	 assign display[0] = 1;
	 assign display[1] = 1;
	 assign display[2] = 1;
	 assign display[3] = ~ponto;
	 assign display[4] = 1;
	 assign display[5] = 1;
	 assign display[6] = ~traco;

endmodule

module desligaSeg(output wire [6:0] display);

	 assign display[0] = 1;
	 assign display[1] = 1;
	 assign display[2] = 1;
	 assign display[3] = 1;
	 assign display[4] = 1;
	 assign display[5] = 1;
	 assign display[6] = 1;

endmodule
