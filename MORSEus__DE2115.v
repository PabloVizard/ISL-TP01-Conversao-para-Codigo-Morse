
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module MORSEus__DE2115(

	//////////// SW //////////
	input 		    [17:0]		SW,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,
	output		     [6:0]		HEX6,
	output		     [6:0]		HEX7
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

	wire[4:0] morse;
	wire[4:0] ponto;
	wire[4:0] traco;
	wire[5:0] num;
	wire[5:0] display;


	assign num = SW[17:12];

//=======================================================
//  Structural coding
//=======================================================

	 codifMorse codificador (.num(num), .display(display), .reset(SW[0]), .ready(SW[1]), .morse(morse));
	 
    demuxDisplay demux4 (.num(morse[4]), .display(display[4]), .ponto(ponto[4]), .traco(traco[4]));
    demuxDisplay demux3 (.num(morse[3]), .display(display[3]), .ponto(ponto[3]), .traco(traco[3]));
    demuxDisplay demux2 (.num(morse[2]), .display(display[2]), .ponto(ponto[2]), .traco(traco[2]));
    demuxDisplay demux1 (.num(morse[1]), .display(display[1]), .ponto(ponto[1]), .traco(traco[1]));
    demuxDisplay demux0 (.num(morse[0]), .display(display[0]), .ponto(ponto[0]), .traco(traco[0]));
	 
	 sevSeg demuxfpga4 (.ponto(ponto[4]), .traco(traco[4]), .display(HEX4));
	 sevSeg demuxfpga3 (.ponto(ponto[3]), .traco(traco[3]), .display(HEX3));
	 sevSeg demuxfpga2 (.ponto(ponto[2]), .traco(traco[2]), .display(HEX2));
	 sevSeg demuxfpga1 (.ponto(ponto[1]), .traco(traco[1]), .display(HEX1));
	 sevSeg demuxfpga0 (.ponto(ponto[0]), .traco(traco[0]), .display(HEX0));
	 
	 desligaSeg desligaDisFPGA1 (.display(HEX7));
	 desligaSeg desligaDisFPGA2 (.display(HEX6));
	 desligaSeg desligaDisFPGA (.display(HEX5));


endmodule
