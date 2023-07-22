https://hdlbits.01xz.net/wiki/7458 
//7458
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	wire p2a_and_p2b;
	wire p2c_and_p2d;
	wire p1a_and_p1c_and_p1b;
	wire p1f_and_p1e_and_p1d;
	assign p2a_and_p2b = p2a & p2b;
	assign p2c_and_p2d = p2c & p2d;
	assign p1a_and_p1c_and_p1b = p1a & p1c & p1b;
	assign p1f_and_p1e_and_p1d = p1f & p1e & p1d;
	assign p2y = p2a_and_p2b | p2c_and_p2d;
	assign p1y = p1a_and_p1c_and_p1b |p1f_and_p1e_and_p1d;
endmodule

//vector0

module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
	assign outv = vec;
	assign o0 = vec[0];
	assign o1 = vec[1];
	assign o2 = vec[2];
	
endmodule

//vector1

`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
	assign out_hi = in[15:8];
	assign out_lo = in[7:0];
endmodule


//vector2

module top_module( 
    input [31:0] in,
    output [31:0] out );//

    // assign out[31:24] = ...;
	assign out = {in[7:0],in[15:8],in[23:16],in[31:24]};
endmodule

//vectorgates

module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
	assign out_or_bitwise = a|b;
	assign out_or_logical = a||b;
	assign out_not = ~{b,a};
endmodule

//gates4

module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
	assign out_and = &in;
	assign out_or = |in;
	assign out_xor = ^in;
endmodule


//vector3

module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
	assign w = {a,b[4:2]};//5+3
	assign x = {b[1:0],c,d[4]};//2+5+1
	assign y = {d[3:0],e[4:1]};//4+4
	assign z = {e[0],f[4:0],2'b11};//1+5+2
endmodule


//vectorr

module top_module( 
    input [7:0] in,
    output [7:0] out
);
	assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};
endmodule

//vector4

module top_module (
    input [7:0] in,
    output [31:0] out );//

    // assign out = { replicate-sign-bit , the-input };
	assign out = {{24{in[7]}},in[7:0]};
endmodule

//vector5

module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
	assign out = ~{{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}}^{5{a,b,c,d,e}};
endmodule


//module


module top_module ( input a, input b, output out );
    mod_a mod_a_u(a,b,out);
endmodule

//module_pos

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
	mod_a mod_a_u(out1,out2,a,b,c,d);
endmodule


//module_name
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
	mod_a mod_a_u(
	.in1(a),
	.in2(b),
	.in3(c),
	.in4(d),
	.out1(out1),
	.out2(out2)
	);
endmodule


//module_shift
module top_module ( input clk, input d, output q );
	wire q1;
	wire q2;
	my_dff my_dff_u1(clk,d,q1);
	my_dff my_dff_u2(clk,q1,q2);
	my_dff my_dff_u3(clk,q2,q);
	
endmodule

//module_shift8

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
	wire [7:0] q1;
	wire [7:0] q2;
	wire [7:0] q3;
	my_dff8 my_dff_u1(clk,d,q1);
	my_dff8 my_dff_u2(clk,q1,q2);
	my_dff8 my_dff_u3(clk,q2,q3);
    always@(*)begin
		case (sel)
			2'b11:q = q3;
			2'b10:q = q2;
			2'b01:q = q1;
			2'b00:q = d;
		endcase
    end
endmodule

//module_add


module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire cout1;
	wire cout2;
	add16 add16_u1(a[15:0],b[15:0],0,sum[15:0],cout1);
	add16 add16_u2(a[31:16],b[31:16],cout1,sum[31:16],cout2);
	
endmodule


//module_fadd

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
	assign sum = a^b^cin;
	assign cout = (a&b)|(a^b)&cin);

endmodule

//module_cseladd
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire cout1;
	wire cout2;
    wire [31:0] sum1;
	add16 add16_u1(a[15:0],b[15:0],0,sum[15:0],cout1);
	add16 add16_u2(a[31:16],b[31:16],0,sum1[31:16],cout2);
    add16 add16_u3(a[31:16],b[31:16],1,sum1[15:0],cout2);
    assign sum = cout1? {sum1[15:0],sum[15:0]}:{sum1[31:16],sum[15:0]};
		
	
endmodule


//module_addsub
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b_sub;
    assign b_sub = {32{sub}}^b;
	
	wire cout1;
	wire cout2;
	add16 add16_u1(a[15:0],b_sub[15:0],sub,sum[15:0],cout1);
	add16 add16_u2(a[31:16],b_sub[31:16],cout1,sum[31:16],cout2);
endmodule


// Alwaysblock1
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
	assign out_assign = a&b;
	always@(*)begin
		out_alwaysblock = a&b;
		end
endmodule


// Alwaysblock2
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

	assign out_assign = a^b;
	always@(*)begin
		out_always_comb =a^b;
		end
	always@(posedge clk)begin
		out_always_ff <= a^b;
		end
endmodule



//Always if
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 

	assign out_assign = ({sel_b1,sel_b2}==2'b11)?b:a;
	always@(*)
		begin
			if({sel_b1,sel_b2}==2'b11)
				out_always<=b;
			else
				out_always<=a;
		end
endmodule


//Always if2
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           	shut_off_computer = 1;
		else
			shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
		else
           keep_driving = 0;
    end
endmodule

// //always_case
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
			3'd0: out = data0;
			3'd1: out = data1;
			3'd2: out = data2;
			3'd3: out = data3;
			3'd4: out = data4;
			3'd5: out = data5;
			default:out = data0;
		endcase
    end

endmodule


//Always case2
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
	always@(*)
		case(in)
			4'b0000:	pos = 2'd0;      //0        0 
			4'b0001:	pos = 2'd0;      //1        0
			4'b0010:	pos = 2'd1;      //2        1
			4'b0011:	pos = 2'd0;      //3        0
			4'b0100:	pos = 2'd2;      //4        2
			4'b0101:	pos = 2'd0;      //5        0
			4'b0110:	pos = 2'd1;      //6        1
			4'b0111:	pos = 2'd0;	     //7        0
			4'b1000:	pos = 2'd3;      //8        3
			4'b1001:	pos = 2'd0;      //9        0
			4'b1010:	pos = 2'd1;      //10       1
			4'b1011:	pos = 2'd0;	     //11       0
			4'b1100:	pos = 2'd2;      //12       2
			4'b1101:	pos = 2'd0;      //13       0
			4'b1110:	pos = 2'd1;	     //14       1
			4'b1111:	pos = 2'd0;	     //15       0
			default:	pos = 2'd0;      //         
		endcase
endmodule

module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
	always@(*)
		case(in[0])
			1'b1:		pos = 2'd0;      //0        0 
			1'b0:		case(in[1])
							1'b1:		pos = 2'd1;      //0        0 
							1'b0:		case(in[2])
											1'b1:		pos = 2'd2;      //0        0 
											1'b0:		case(in[3])
															1'b1:		pos = 2'd3;      //0        0 
															default:	pos = 2'd0;
														endcase
										endcase
						endcase
		endcase
endmodule

// Always casez
module top_module (
    input [7:0] in,
    output reg [2:0] pos );
	always@(*)
		casez(in)                     
			8'bzzzz_zzz1:	pos = 3'd0;
			8'bzzzz_zz10:	pos = 3'd1;
			8'bzzzz_z100:	pos = 3'd2;
			8'bzzzz_1000:	pos = 3'd3;
			8'bzzz1_0000:	pos = 3'd4;
			8'bzz10_0000:	pos = 3'd5;
			8'bz100_0000:	pos = 3'd6;
			8'b1000_0000:	pos = 3'd7;
			default:		pos = 3'd0;
		endcase                      
endmodule

/*
!!!!!!!!!!!!!!!!!!先赋值默认。再赋值变量*******************/
//always_0olatches
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
	always @(*) begin
		left = 1'b0; down = 1'b0; right = 1'b0; up = 1'b0;
		case(scancode)
			16'he06b:	left = 1;
			16'he072:	down = 1;
			16'he074:	right= 1;
			16'he075:	up 	 = 1;
		endcase
	end
endmodule



//Conditional
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

	wire [7:0] net1;
	wire [7:0] net2;
    // assign intermediate_result1 = compare? true: false;
	assign net1 =(a<b)?a:b;
	assign net2 =(c<d)?c:d;
	assign min =(net1<net2)?net1:net2;
endmodule


//Reduction
module top_module (
    input [7:0] in,
    output parity); 
	assign parity =^in;
endmodule

//Gates100
module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);

	assign	out_and =   &in;
	assign	out_or	=   |in;
	assign	out_xor	=	^in;
endmodule


//Vector100r
module top_module( 
    input [99:0] in,
    output [99:0] out
);
	always@(*)begin
		integer i;
		for(i=0;i<100;i=i+1)begin
			out[i] = in[99-i];
			end
		end
endmodule
/*!!!!!!!!!!!!!!!!!i<100    ====> i<$bits(out)*******/

//问题：
//      $bits 可以综合么？？
//



//Popcount255
module top_module( 
    input [254:0] in,
    output [7:0] out );

	always@(*)begin
		integer i;
		out = 8'd0;
		for(i=0;i<$bits(in);i=i+1)begin
			if(in[i]==1'b1)
				out = out+1'b1;
			else
				out = out;
		end	
	end
endmodule
//show solution
//没有if-else,少很多mux
module top_module( 
    input [254:0] in,
    output [7:0] out );

	always@(*)begin
		out = 8'd0;
		for(i=0;i<255;i=i+1)begin
			out = out+in[i];
		end	
	end
endmodule

//Adder100i
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

	always@(*)begin
		sum[0]  = a[0]^b[0]^cin;
		cout[0] = (a[0]&b[0])|(a[0]&cin)|(cin&b[0]);
		for(int i = 1; i < 100; i = i + 1)begin
			sum[i] 	= 	a[i]^b[i]^cout[i-1];
			cout[i] =	(a[i]&b[i])|(a[i]&cout[i-1])|(cout[i-1]&b[i]);
		end	
endmodule


module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
	wire [399:0]cout_net;
	bcd_fadd bcd_fadd_u(.a(a[3:0]);.b(b[3:0]);.cin(cin);.cout(cout_net[0]);.sum(sum[3:0]));
	always@(*)begin
		for(int i = 4; i < 400; i = i + 4)begin
			bcd_fadd bcd_fadd_u(.a(a[i+3:i]),.b(b[i+3:i]),.cin(cout_net[i-4]),.cout(cout_net[i]),.sum(sum[i+3:i]));
			end
		end
	assign cout = cout_net[396];
endmodule



module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
	wire [399:0]cout_net;
    bcd_fadd bcd_fadd_u(a[3:0],b[3:0],cin,cout_net[0],sum[3:0]);
    generate 
        genvar i;
        for(int i=4;i<400;i=i+4) begin :bcdadd100
        	bcd_fadd bcd_fadd_u1(a[i+3:i+0],b[i+3:i+0],cout_net[i-4],cout_net[i],sum[i+3:i+0]);
		end
    endgenerate
	assign cout = cout_net[396];
endmodule

//用always@(*)没有通过


//《Circuits》
//>>Conditional Logic
//>>//>>Basic Gates
//wire Exams/m2014 q4h
module top_module (
    input in,
    output out);
	assign out =in;
endmodule

//Exams/m2014 q4i
module top_module (
    output out
);
	assign out = 1'b0;
endmodule

//Exams/m2014 q4e
module top_module (
    input in1,
    input in2,
    output out
);
	assign out = ~(in1|in2);
endmodule

//Exams/m2014 q4f
module top_module (
    input in1,
    input in2,
    output out
);
	assign out = in1&~in2;
endmodule
//Exams/m2014 q4g
module top_module (
    input in1,
    input in2,
    input in3,
    output out
);
	wire net;
	assign  net = in1^in2;
	assign  out = (~net)^in3;
endmodule


//Gates
module top_module( 
    input  a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
	assign  out_and    = a&b;
	assign  out_or     = a|b;
	assign  out_xor    = a^b;
	assign  out_nand   = ~(a&b);
	assign  out_nor    = ~(a|b);
	assign  out_xnor   = ~(a^b);
	assign  out_anotb  = a&(~b);
endmodule

//7420
module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y 
);
	nand(p1y, p1a, p1b, p1c, p1d);
	nand(p2y, p2a, p2b, p2c, p2d);
endmodule

//Truthtable1
module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
	assign f = x3&x1|((~x3)&x2);

endmodule
//Mt2015 eq2
module top_module ( input [1:0] A, input [1:0] B, output z ); 
	assign z = A==B?1:0;
endmodule

//Mt2015 q4a
module top_module (input x, input y, output z);
	assign z = (x^y)&x;
endmodule

//Mt2015 q4b
module top_module ( input x, input y, output z );
	assign z =  ~(x^y);
endmodule

//Mt2015 q4

module top_module (input x, input y, output z);
	wire A1,A2,B1,B2;
	A A_u1(x,y,A1);
	A A_u2(x,y,A2);
	B B_u1(x,y,B1);
	B B_u2(x,y,B2);
    assign z = (A1|B1)^(A2&B2);
endmodule

module B ( input x, input y, output z );
	assign z =  ~(x^y);
endmodule
module A (input x, input y, output z);
	assign z = (x^y)&x;
endmodule

//Ringer
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
	assign {motor,ringer} = ring?(vibrate_mode?2'b10:2'b01):2'b00;
	
endmodule
////////////////////////////////////////
//Thermostat
module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 

	assign {aircon,heater} = mode?(too_cold?2'b01:2'b00):(too_hot?2'b10:2'b00);
	assign fan = (aircon|heater|fan_on)? 1'b1:1'b0;
endmodule


//Popcount3
module top_module( 
    input [2:0] in,
    output [1:0] out );

	always@(*)begin
		out = 'b0;
		for(int i = 0;i<3;i=i+1)
			out = out + in[i];
		end
endmodule

//Gatesv
module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );

	always@(*)begin
		out_both = 'b0;
		for(int i = 0;i<3;i=i+1)begin
			out_both[i] = in[i]&in[i+1];
		end
	end
	
	always@(*)begin
		out_any = 'b0;
		for(int i = 1;i<4;i=i+1)begin
			out_any[i] = in[i]|in[i-1];
		end
	end
	always@(*)begin
		out_different[3] = in[0]^in[3];
        for(int i = 0;i<3;i=i+1)begin
            out_different[i] = in[i]^in[i+1];
		end
	end
endmodule

////////////////////////////////////////////////////// 
//Gatesv100
module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
	
	always@(*)begin
		out_both = 'b0;
		for(int i = 0;i<99;i=i+1)begin
			out_both[i] = in[i]&in[i+1];
		end
	end
	
	always@(*)begin
		out_any = 'b0;
		for(int i = 1;i<100;i=i+1)begin
			out_any[i] = in[i]|in[i-1];
		end
	end
	always@(*)begin
		out_different[99] = in[0]^in[99];
        for(int i = 0;i<99;i=i+1)begin
            out_different[i] = in[i]^in[i+1];
		end
	end
endmodule



//Mux2to1
module top_module( 
    input a, b, sel,
    output out ); 
	assign out = sel?b:a;
endmodule



//Mux2to1v
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
	assign out = sel?b:a;
endmodule


//Mux9to1v
module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
	always@(*)begin
		case(sel)
			4'd0:   out 	=	a;
			4'd1:   out 	=	b;
			4'd2:   out 	=	c;
			4'd3:   out 	=	d;
			4'd4:   out 	=	e;
			4'd5:   out 	=	f;
			4'd6:   out 	=	g;
			4'd7:   out 	=	h;
			4'd8:   out 	=	i;
			default:	out = 16'd1;
		endcase
	end
endmodule

//Mux256to1
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
	
	assign out = in[sel];
	
endmodule

//Mux256to1v
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
	assign out = in[4*sel+:4];
endmodule

//Hadd
module top_module( 
    input a, b,
    output cout, sum );
	assign sum = a^b;
	assign cout= a&b;	
endmodule

//Fadd
module top_module( 
    input a, b, cin,
    output cout, sum );
	assign sum = a^b^cin;
	assign cout= a&b|a&cin|b&cin;
endmodule

//Adder3
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum 
);
    fadd fadd_u(a[0],b[0],cin,cout[0],sum[0]);
	generate 
    genvar i;
        for(i = 1;i<3;i=i+1)begin:fadd_part
		fadd fadd_u(a[i],b[i],cout[i-1],cout[i],sum[i]);	
	end
    endgenerate
endmodule
module fadd( 
    input a, b, cin,
    output cout, sum );
	assign sum = a^b^cin;
	assign cout= a&b|a&cin|b&cin;
endmodule


//Exams/m2014 q4j
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0] cout_w;
    FA FA_u(x[0],y[0],0,cout_w[0],sum[0]);
    assign sum[4] = cout_w[3];
	generate 
    genvar i;
        for(i = 1;i<4;i=i+1)begin:fadd_part
            FA FA_u(x[i],y[i],cout_w[i-1],cout_w[i],sum[i]);	
		end
    endgenerate
endmodule
module FA( 
    input a, b, cin,
    output cout, sum );
	assign sum = a^b^cin;
	assign cout= a&b|a&cin|b&cin;
endmodule


//Exams/ece241 2014 q1c
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    assign s = a+b;
	assign overflow = (a[7]&b[7]&(~s[7]))|((~a[7])&(~b[7])&s[7]);
endmodule

//Adder100
module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
	assign {cout,sum} = a+b+cin;
endmodule

//Bcdadd4
module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
	
	wire [15:0]cout_net;
    bcd_fadd bcd_fadd_u(a[3:0],b[3:0],cin,cout_net[0],sum[3:0]);
	generate 
		genvar i;
        for(i = 4; i < 16; i = i + 4)begin:bcd
            bcd_fadd bcd_fadd_u(a[i+3:i],b[i+3:i],cout_net[i-4],cout_net[i],sum[i+3:i]);
		end
	endgenerate
	assign cout = cout_net[16-4];
endmodule

//Kmap1
module top_module(
    input a,
    input b,
    input c,
    output out  ); 
	assign out = ~(a&b);
endmodule

//Kmap2
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	assign out = (~b)&(~c)|(~a)&(~d)|(b&c&d)|(a&c&d);
endmodule

//Kmap3
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	assign out = a|((~b)&c);
endmodule

//Kmap4
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	assign out = (  ((~a)&(b)&(~c)&(~d))|
					((a)&(~b)&(~c)&(~d))|
					((~a)&(~b)&(~c)&(d))|
					((a)&(b)&(~c)&(d))|
					((~a)&(b)&(c)&(d))|
					((a)&(~b)&(c)&(d))|
					((~a)&(~b)&(c)&(~d))|
					((a)&(b)&(c)&(~d)));
endmodule
//通过公式化简：  out = (a^b)^(c^d);

//Exams/ece241 2013 q2
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
	always@(*)begin
		case({a,b,c,d})
			4'd2,4'd3,4'd7,4'd15,4'd11: out_pos = 1;
			4'd0,4'd1,4'd4,4'd5,4'd6,4'd9,4'd10,4'd13,4'd14: out_pos = 0;
			default:	out_pos = 0;
		endcase
	end
	assign out_sop = out_pos;
endmodule

//Exams/m2014 q3
module top_module (
    input [4:1] x, 
    output f );
	assign f = (x[2]&x[4])|((~x[1])&(x[3]));
endmodule





//Exams/2012 q1g
module top_module (
    input [4:1] x,
    output f
); 
    assign f = ((~x[2])&(~x[4]))|((~x[1])&(x[3]))|(x[2]&x[3]&x[4]);
endmodule



//Exams/ece241 2014 q3
module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
	assign mux_in[0] = ({c,d}==2'b00)? 0:1;
	assign mux_in[1] = 0;
	assign mux_in[3] = ({c,d}==2'b11)? 1:0;
	assign mux_in[2] = (d==1'b0)? 1:0;
endmodule



//Dff
module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//

    // Use a clocked always block
    //   copy d to q at every positive edge of clk
    //   Clocked always blocks should use non-blocking assignments
	always@(posedge clk)begin
		q<=d;
	end	
endmodule
//Dff8
module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
	always@(posedge clk)begin
		q<=d;
	end	
endmodule

//Dff8r
module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
	always@(posedge clk)begin
		if(reset)
			q <= 0;
		else
			q<=d;
	end	
endmodule

//Dff8p
module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
	always@(negedge clk)begin
		if(reset)
			q <= 8'h34;
		else
			q<=d;
	end	
endmodule

//Dff8ar
module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
	always@(posedge clk or posedge areset)begin
		if(areset)
			q <= 'b0;
		else
			q<=d;
	end	
endmodule

//Dff16e

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
	always@(posedge clk)begin
		if(!resetn)
			q[15:8] <= 'b0;
		else if (byteena[1])
			q[15:8]<=d[15:8];
		else
			q[15:8] <= q[15:8];
	end	
	always@(posedge clk)begin
		if(!resetn)
			q[7:0] <= 'b0;
		else if (byteena[0])
			q[7:0]<=d[7:0];
		else
			q[7:0] <= q[7:0];
	end	
endmodule

//Exams/m2014 q4a
module top_module (
    input d, 
    input ena,
    output q);
	always@(*)begin
		if(ena)
			q <= d;
	end	
endmodule

//Exams/m2014 q4b
module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);
    always@(posedge clk or posedge ar)begin
        if(ar)
            q <=0;
        else
			q <= d;
	end	
endmodule

//Exams/m2014 q4c
module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
	always@(posedge clk)begin
		if(r)
            q <=0;
        else
			q <= d;
	end	
endmodule

//Exams/m2014 q4d
module top_module (
    input clk,
    input in, 
    output out);
	wire d_w;
	assign d_w = out^in;
	
	always@(posedge clk)begin
		out <= d_w;
	end	
	
endmodule

//Mt2015 muxdff
module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
	wire mux_w1;
	Mux2to1 Mux2to1_u(r_in,q_in,L,mux_w1);
	flip_flop ff1(clk,mux_w1,Q);
endmodule
module flip_flop (
    input clk,
    input d, 
    output q);
	always@(posedge clk)
		q <= d;
endmodule
module Mux2to1 (
    input in1,in0,sel,
    output q);
	assign q = sel?in1:in0;
endmodule

//Exams/2014 q4a
module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
	wire mux_w1,mux_w2;
	Mux2to1 Mux2to1_u0(w,Q,E,mux_w1);
	Mux2to1 Mux2to1_u1(R,mux_w1,L,mux_w2);
	flip_flop ff1(clk,mux_w2,Q);
endmodule

module flip_flop (
    input clk,d, 
    output q);
	always@(posedge clk)
		q <= d;
endmodule
module Mux2to1 (
    input in1,in0,sel,
    output q);
	assign q = sel?in1:in0;
endmodule

//Exams/ece241 2014 q4
module top_module (
    input clk,
    input x,
    output z
); 
	wire ffw1,ffw2,ffw3;
	
	flip_flop ff1(
				.clk(clk	),
				.d	(x^ffw1	),
				.q	(ffw1	)
				);
	flip_flop ff2(
				.clk(clk	),
				.d	(x&(~ffw2)),
				.q	(ffw2	)
				);
	flip_flop ff3(
				.clk(clk	),
				.d	(x|(~ffw3)),
				.q	(ffw3	)
				);
	assign z = ~(ffw1|ffw2|ffw3);
endmodule
module flip_flop (
    input clk,d, 
    output q);
	always@(posedge clk)begin
		q 	<= d;
	end
endmodule

//Exams/ece241 2013 q7
module top_module (
    input clk,
    input j,
    input k,
    output Q); 
	always@(posedge clk)begin
		case({j,k})
			2'b00:Q <= Q;
			2'b01:Q <= 0;
			2'b10:Q <= 1;
			2'b11:Q <= ~Q;
			default:Q <= Q;
		endcase
	end
endmodule
//Edgedetect
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
	reg [7:0] p1;
	always@(posedge clk)
		begin
			p1<=in;
			pedge<=in&(~p1);
		end
endmodule

//Edgedetect2
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
	reg [7:0] p1;
	always@(posedge clk)
		begin
			p1<=in;
			anyedge<=in^p1;
		end
endmodule
//Edgecapture
module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
	reg [31:0] out_r1;
	
	always@(posedge clk)
		out_r1 	<= in;
	always@(posedge clk)
		begin
		    if(reset)begin
				out	<=	'b0;
			end
			else  begin
				for(int i=0;i<32;i=i+1)
					if(in[i]==1'b0&&out_r1[i]==1'b1)
					out[i]=1'b1;
			end
		end
endmodule

//Dualedge
module top_module (
    input clk,
    input d,
    output q
);	
	reg q1,q2;
	always@(posedge clk)begin
		q1<=d;
	end
	wire clk1;
	assign clk1 = ~clk;
	always@(posedge clk1)begin
		q2<=d;
	end
	assign q =clk?q1:q2;
endmodule

//Count15
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
	reg [3:0]count;
	always@(posedge clk)
	begin
		if(reset)begin
			count<='b0;
        end
		else if(count==4'd15)begin
			count<='b0;
		end
		else begin
			count<=count+1'b1;
		end
	end
    assign q=count;
endmodule

//Count10
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    reg [3:0]count;
	always@(posedge clk)
	begin
		if(reset)begin
			count<='b0;
        end
		else if(count==4'd9)begin
			count<='b0;
		end
		else begin
			count<=count+1'b1;
		end
	end
    assign q=count;
endmodule
//Count1to10
module top_module (
    input clk,
    input reset,
    output [3:0] q);
    reg [3:0]count;
	always@(posedge clk)
	begin
		if(reset)begin
			count<=4'b1;
        end
		else if(count==4'd10)begin
			count<=4'b1;
		end
		else begin
			count<=count+1'b1;
		end
	end
    assign q=count;
endmodule
// Countslow
module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    reg [3:0]count;
	always@(posedge clk)
	begin
		if(reset)begin
			count<=4'b0;
        end
		else if(slowena&(count<4'd9)) begin
			count<=count+1'b1;
		end
        else if(!slowena)begin
			count<=count;
		end
        else begin
            count<=4'b0;
        end
	end
    assign q=count;
endmodule

//Exams/ece241 2014 q7a
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    
    assign c_enable =  enable;
    assign c_load =  (reset|(Q==4'd12&enable))?1'b1:1'b0;
    assign c_d=c_load?4'b1:Q;
    count4 the_counter (clk, c_enable, c_load, c_d ,Q );
endmodule


// Exams/ece241 2014 q7b
module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [3:0] countera,counterb,counterc;
    bcdcount counter0 (clk, reset, c_enable[0],countera);
    bcdcount counter1 (clk, reset, c_enable[1],counterb);
    bcdcount counter2 (clk, reset, c_enable[2],counterc);

    assign c_enable[0] = reset?1'b0:1'b1;
    assign c_enable[1] = (countera==4'd9)?1'b1:1'b0;
    assign c_enable[2] = (counterb==4'd9&&countera==4'd9)?1'b1:1'b0;
    assign OneHertz    = (countera==4'd9)&&(counterb==4'd9)&&(counterc==4'd9);
endmodule


// Countbcd
module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    reg [3:0] c_enable;
    reg [3:0] countera,counterb,counterc,counterd;
    bcdcount counter0 (clk, reset, c_enable[0],countera);
    bcdcount counter1 (clk, reset, c_enable[1],counterb);
    bcdcount counter2 (clk, reset, c_enable[2],counterc);
    bcdcount counter3 (clk, reset, c_enable[3],counterd);
    assign c_enable[0] = reset?1'b0:1'b1;
    assign c_enable[1] = (countera==4'd9)?1'b1:1'b0;
    assign c_enable[2] = (counterb==4'd9&&countera==4'd9)?1'b1:1'b0;
    assign c_enable[3] = (countera==4'd9)&&(counterb==4'd9)&&(counterc==4'd9);
    assign q   ={counterd,counterc,counterb,countera};
    assign ena   =c_enable[3:1];
endmodule

module bcdcount(
    input clk,rst,en,
    output [3:0]    q);

always @(posedge clk) begin
    if(rst)begin
        q <=    'b0;
    end
    else if (en) begin
        if(q==4'd9)begin
            q <=1'b0;
        end
        else begin
            q <=q+1'b1;
        end
    end
    else begin 
        q <=q;
    end
end
endmodule

// Count clock
module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    reg pm_r;
    reg  [7:0] hh_r;
    wire [7:0] mm_r;
    wire [7:0] ss_r;
    addcount  #(0,9) counter1(clk, reset, ena, 1'b1,ss_r[3:0]);
    wire ens1=(ss_r[3:0]==4'd9&&ena)?1'b1:1'b0;
    addcount  #(0,5) counter2(clk, reset, ens1,1'b1,ss_r[7:4]);
    wire enm0=(ss_r[7:4]==4'd5&&ens1)?1'b1:1'b0;
    addcount  #(0,9) counter3(clk, reset, enm0,1'b1,mm_r[3:0]);
    wire enm1=(mm_r[3:0]==4'd9&&enm0)?1'b1:1'b0;
    addcount  #(0,5) counter4(clk, reset, enm1,1'b1,mm_r[7:4]);
    wire enh0=(mm_r[7:4]==4'd5&&enm1)?1'b1:1'b0;

    always @(posedge clk) begin
        if(reset) begin
            hh_r[3:0]<=4'd2;
            hh_r[7:4]<=4'd1;
        end
        else if(enh0) begin               //分钟有进位
            if(hh_r[7:4]==4'd1) begin     //时钟为》10
                if(hh_r[3:0]==4'd2)begin            //时钟个位==2
                    hh_r[3:0]<=4'd1;                 //回到01:00:00    
                    hh_r[7:4]<=4'd0;
                end
                else begin
                    hh_r[3:0]<=hh_r[3:0]+1'b1;
                    hh_r[7:4]<=4'd1;
                end
            end
            else begin
                if(hh_r[3:0]==4'd9)begin            //时钟个位==9
                    hh_r[3:0]<=4'd0;                 //加到10:00:00 
                    hh_r[7:4]<=4'd1;
                end
                else begin
                    hh_r[3:0]<=hh_r[3:0]+1'b1;
                    hh_r[7:4]<=4'd0;
                end
            end
        end
        else begin
            hh_r[3:0]<=hh_r[3:0];
            hh_r[7:4]<=hh_r[7:4];
        end
    end
    always @(posedge clk) begin
        if(reset) begin
            pm_r  <=  1'b0;
        end
        else if((hh_r[7:4]==4'd1&&hh_r[3:0]==4'd1)&&enh0)begin
            pm_r  <=  ~pm_r;
        end
        else begin
            pm_r  <=  pm_r;
        end
    end
    //复位为0；到12:59:59是就翻转，不是就保持
    //assign pm_w = reset?1'b0:(((hh_r[7:4]==4'd1&&hh_r[3:0]==4'd1)&&enh0)?1'b1:1'b0);
    assign pm = pm_r; 
    assign hh = hh_r;  
    assign mm = mm_r;  
    assign ss = ss_r;   
endmodule


//  Shift4
module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    always @(posedge clk or posedge areset) begin
        if(areset)begin
            q<=4'b0;
        end
        else if(load)begin
            q<=data;
        end
        else if(ena)begin
            q<=q>>1;
        end
        else begin
            q<=q;
        end
    end
endmodule

// Rotate100
module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

    always @(posedge clk) begin
        if(load)begin
            q<=data;
        end
        else if(ena==2'b01)begin
            q<={q[0],q[99:1]};
        end
        else if(ena==2'b10)begin
            q<={q[98:0],q[99]};
        end
        else begin
            q<=q;
        end
    end
endmodule


//Shift18
module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    always @(posedge clk) begin
        if(load)begin
            q<=data;
        end
        else if(ena)begin
            case(amount)                            //算术左移冲刷高位，右移保持高位
                2'b00:q<={q[63],q[62:0],1'b0};      //左移
                2'b01:q<={q[55:0],{8{1'b0}}};       //左移8
                2'b10:q<={q[63],q[63],q[62:1]};
                2'b11:q<={{9{q[63]}},q[62:8]};      //右移8
            endcase 
        end 
        else begin
            q<=q;
        end
    end
endmodule

//Lfsr5
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 

    always @(posedge clk) begin
        if(reset)begin
            q<=5'h1;
        end
        else begin
            q[4]<=1'b0^q[0];
            q[3]<=q[4];
            q[2]<=q[3]^q[0];
            q[1]<=q[2];
            q[0]<=q[1];    
        end
    end

endmodule
// Mt2015 lfsr
module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    always @(posedge KEY[0]) begin
        if(KEY[1])begin
            LEDR <= SW;
        end
        else begin
            LEDR[0]    <=  LEDR[2];
            LEDR[1]    <=  LEDR[0];
            LEDR[2]    <=  LEDR[2]^LEDR[1];           
        end
    end
endmodule

// Lfsr32
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    reg [31:0] q_w;
    always @(posedge clk) begin
        if(reset)begin
            q_w <= 32'h1;
        end
        else begin
            //抽头位输出是0位异或前一位(注意从0开始算)
            q_w[31] <= q_w[0]^1'b0;
            q_w[21] <= q_w[22]^q_w[0];
            q_w[1] <= q_w[2]^q_w[0];
            q_w[0] <= q_w[1]^q_w[0];
            //其他续沿上一位
            q_w[30:22] <= q_w[31:23];
            q_w[20:2] <= q_w[21:3];
        end
    end  
    assign q=q_w;
endmodule

// Exams/m2014 q4k
module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0]out_r;

    always @(posedge clk) begin
        if(!resetn)begin
            out_r<=4'd0;
        end
        else begin
            out_r[3] <= in;
            out_r[2:0]<= out_r[3:1];
        end
    end
    assign out=out_r[0];
endmodule


// Exams/2014 q4b
module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF MUXDFF_u3(
        .clk(KEY[0]),   //g
        .w(KEY[3]),     //g+b
        .q(LEDR[3]),    //b
        .e(KEY[1]),     //g
        .r(SW[3]),      //b
        .l(KEY[2]),     //g
        .out(LEDR[3])); //b
    generate
        genvar i;
        for(i=0;i<3;i=i+1)begin:muxdff
            MUXDFF MUXDFF_u2(
                .clk(KEY[0]),   //g
                .w(LEDR[i+1]),  //g+b
                .q(LEDR[i]),    //b
                .e(KEY[1]),     //g
                .r(SW[i]),      //b
                .l(KEY[2]),     //g
                .out(LEDR[i])); //b
        end
    endgenerate

endmodule

module MUXDFF (clk,w,q,e,r,l,out);
    input clk,w,q,e,r,l;
    output out;

    wire din;
    assign din=l?r:e?w:q;
    reg out_r;
    always @(posedge clk) begin
        out_r<=din;
    end
    assign out=out_r;
endmodule

// Exams/ece241 2013 q12
module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [7:0]   Q;
    always @(posedge clk) begin
        if(!enable) begin
            Q<=Q;
        end
        else begin
            Q <= {S,Q[7:1]};
        end
    end
    always @( *) begin
        case({A,B,C})
            3'd0:   Z<=Q[7];
            3'd1:   Z<=Q[6];
            3'd2:   Z<=Q[5];
            3'd3:   Z<=Q[4];
            3'd4:   Z<=Q[3];
            3'd5:   Z<=Q[2];
            3'd6:   Z<=Q[1];
            3'd7:   Z<=Q[0];
            default : Z<=Q[7];   
        endcase
    end
endmodule

//Rule90
module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 

endmodule






//////***********Bulid lager Circuits******************//
// Exams/review2015 count1k
module top_module (
    input clk,
    input reset,
    output [9:0] q);
    reg [9:0] counter;
    always @(posedge clk) begin
        if(reset)begin
            counter <= 'b0;
        end
        else if(counter<10'd999) begin
            counter <= counter +1'b1;
        end
        else begin
            counter <= 'b0;
        end
    end
    assign q = counter;
endmodule

// Exams/review2015 shiftcount
module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    reg [3:0] q_r;

    always @(posedge clk) begin
        if(shift_ena)begin
            q_r <= {q_r[2:0],data};
        end
        else if(count_ena)begin
            q_r <= q_r-1'b1;
        end
        else begin
            q_r<=q_r;
        end
    end
    assign q = q_r;   
endmodule


// Exams/review2015 fsmseq
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    reg [2:0] data_r;
    reg     start_shifting_r;
    always @(posedge clk) begin
        if(reset)begin
            data_r<='b0;
        end
        else begin
            data_r<={data_r[1:0],data};
        end
    end

    always @(posedge clk) begin
        if(reset)begin
            start_shifting_r=1'b0;
        end
        else begin
            case({data_r,data})
            4'b1101: start_shifting_r=1'b1;
            default: start_shifting_r=start_shifting_r;      
        endcase
        end
    end
    assign start_shifting = start_shifting_r;
endmodule







//****************Verification*******/
//Bugs mux2
module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0]	out  );

    assign out = sel?a:b;

endmodule
//Bugs nand3
module top_module (input a, input b, input c, output out);//
	wire out1;
    andgate inst1 (  out1,a, b, c,1,1 );
	assign out =out1;
endmodule

//Bugs mux4
module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] mux0, mux1;
    mux2 muxa ( sel[0],    a,    b, mux0 );
    mux2 muxb ( sel[0],    c,    d, mux1 );
    mux2 muxc ( sel[1], mux0, mux1,  out );

endmodule



// Bugs addsubz
// synthesis verilog_input_version verilog_2001
module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);//

    always @(*) begin
        case (do_sub)
          1'b0: out = a+b;
          1'b1: out = a-b;
        endcase
    end
    assign result_is_zero=(|out)?1'b0:1'b1;
endmodule

// Bugs case
module top_module (
    input [7:0] code,
    output reg [3:0] out,
    output reg valid=1 );//

     always @(*)
        case (code)
            8'h45: begin out = 0;   valid=1;    end
            8'h16: begin out = 1;   valid=1;    end
            8'h1e: begin out = 2;   valid=1;    end
            8'h26: begin out = 3;   valid=1;    end
            8'h25: begin out = 4;   valid=1;    end
            8'h2e: begin out = 5;   valid=1;    end
            8'h36: begin out = 6;   valid=1;    end
            8'h3d: begin out = 7;   valid=1;    end
            8'h3e: begin out = 8;   valid=1;    end
            8'h46: begin out = 9;   valid=1;    end
            default: begin out = 0; valid=0;    end
        endcase
endmodule

// Sim/circuit1
module top_module (
    input a,
    input b,
    output q );//

    assign q = b&a; // Fix me
endmodule

// Sim/circuit2
module top_module (
    input a,
    input b,
    input c,
    input d, 
    output q );//

    assign q = ~(a^b)^(c^d); // Fix me

endmodule
// Sim/circuit3
module top_module (
    input a,
    input b,
    input c,
    input d, 
    output q );//

    assign q = (a|b)&(c|d); // Fix me

endmodule

// Sim/circuit4
module top_module (
    input a,
    input b,
    input c,
    input d, 
    output q );//

    assign q = b|c; // Fix me

endmodule

// Sim/circuit5
module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );
    always @( *) begin
        case(c)
            4'd0:q=b;
            4'd1:q=e;
            4'd2:q=a;
            4'd3:q=d; 
            default :q=4'hf;
        endcase
    end
endmodule



// Sim/circuit6
module top_module (
    input [2:0] a,
    output [15:0] q ); 
    always @( *) begin
        case(a)
            3'd0:q=16'h1232;
            3'd1:q=16'haee0;
            3'd2:q=16'h27d4;
            3'd3:q=16'h5a0e;
            3'd4:q=16'h2066;
            3'd5:q=16'h64ce;
            3'd6:q=16'hc526;
            3'd7:q=16'h2f19;
            default :q=16'h0;
        endcase
    end
endmodule

// Sim/circuit7
module top_module (
    input clk,
    input a,
    output q );
    always @(posedge clk) begin
        if(a) begin
            q<=1'b0;
        end
        else begin
            q<=1'b1;        
        end
    end
endmodule

// Sim/circuit8
module top_module (
    input clock,
    input a,
    output p,
    output q );
    reg q_r;
    always @(negedge clock) begin
        q<=a;
    end
    always @(negedge clock) begin
        q_r<=a;
    end
    assign p=clock?a:q_r;
endmodule


// Sim/circuit9
module top_module (
    input clk,
    input a,
    output [3:0] q );
    reg [3:0] counter;
    always @(posedge clk ) begin
        if(a)begin
            counter<=4'd4;
        end
        else if (counter<4'd6)begin
            counter<=counter+1'b1;
        end
        else begin
            counter<=4'd0;
        end
    end
    assign q=counter;
endmodule
// Sim/circuit10

module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    always @(posedge clk ) begin
        if(a&&b)begin
            state<=1'b1;
        end 
        else if(!(a||b))begin
            state<=1'b0;
        end
        else
    end
    assign q=a^b;
endmodule
// Tb/clock
`timescale 1ps/1ps
module top_module ( );
    reg clk;
    initial begin
        clk=1'b0;
    end
    always #5 clk=~clk;
    dut dut_t(clk);
endmodule

//Tb/tb1
`timescale 1ps/1ps
module top_module ( output reg A, output reg B );//

    // generate input patterns here
    initial begin
        A = 1'b0;
        B = 1'b0;
        #10 A=1'b1;
        #5  B=1'b1;
        #5  A=1'b0;
        #20 B=1'b0;   
    end

endmodule
// Tb/and
`timescale 1ps/1ps
module top_module();
    reg [1:0]   in;
    wire out;
    initial begin
        in = 2'b00;
        #10 in=2'b01;
        #10 in=2'b10;
        #10 in=2'b11;
    end
    andgate andgate_u(in,out);
endmodule

// Tb/tb2
`timescale 1ps/1ps
module top_module();
    reg         clk,in;
    reg [2:0]   s;
    wire out;
    initial begin
        clk=1'b0;
        in = 1'b0;
        s  = 3'd2;
        #10 s=3'd6;
        #10 s=3'd2; in = 1'b1;
        #10 s=3'd7; in = 1'b0;
        #10 s=3'd0; in = 1'b1;
        #30 in = 1'b0;
        #100 $finish;
    end
    always #5 clk=~clk;
    q7 q7_u(.clk(clk),.in(in),.s(s),.out(out)); 
endmodule
// Tb/tff
`timescale 1ps/1ps
module top_module ();
    tff tff_u(clk,reset,t,q);
    reg         clk,reset,t;
    wire q;
    initial begin
        clk = 1'b1;
        reset = 1'b1;
        t = 1'b1;
        #50 reset = 1'b0;
        #50 t = 1'b0;
        #50 reset = 1'b1;
        #1000 $finish;
    end
    always #10 clk=~clk;
endmodule

// Cs450/timer
module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0]counter;
    always @(posedge clk) begin
        if(load)begin
            counter <= data;
        end
        else begin
            if(counter>0)begin
                counter<=counter-1'b1;
            end
            else begin
                counter<=counter;
            end
        end
    end
    assign tc = (|counter)?1'b0:1'b1;
endmodule

//Cs450/counter 2bc
module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    parameter SNT = 2'b00;  //强不跳转      |
    parameter WNT = 2'b01;  //弱不跳转      v
    parameter WT  = 2'b10;  //弱跳转        |
    parameter ST  = 2'b11;  //强跳转        V

    reg [1:0] state_r;
    always @(posedge clk or posedge areset) begin
        if(areset)begin
          state_r   <= WNT;
        end
        else if(train_valid)begin                       //为1时跳转
            if(train_taken&&(state_r<2'b11))begin       //跳转得方向,保证不溢出
                state_r  <=  state_r+1'b1;
            end
            else if(~train_taken&&(state_r>2'b00))begin //跳转得方向,保证不溢出
                state_r  <=  state_r-1'b1;
            end
            else begin
                state_r  <=  state_r;                   //溢出就为本身
            end
        end
        else begin                                      //为0时不跳转
            state_r<=state_r;
        end
    end
    assign state=state_r;
endmodule
// Cs450/history shift
module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);
    reg [31:0] shift_r;
    always @(posedge clk or posedge areset) begin
       if(areset) begin
            shift_r<=32'd0;
       end
       else if(train_mispredicted) begin                    //优先
            shift_r<={train_history[30:0],train_taken};     //记录训练得新的跳转
       end
       else if(predict_valid) begin                         //预测
            shift_r<={predict_history[30:0],predict_taken}; //记录预测的跳转
       end
       else begin
            shift_r<=shift_r;
       end
    end
    assign predict_history=shift_r;
endmodule

// Cs450/gshare
module top_module(
    input clk,
    input areset,

    input  predict_valid,
    input  [6:0] predict_pc,
    output predict_taken,
    output [6:0] predict_history,

    input train_valid,
    input train_taken,
    input train_mispredicted,
    input [6:0] train_history,
    input [6:0] train_pc
);
    reg [1:0]    PHT[127:0]; 
    integer i;
    always @(posedge clk or posedge areset) begin
       if(areset) begin
            predict_history<= 0;
            for(i=0;i<128;i=i+1)begin
                PHT[i]<= 2'b01;
            end
       end
       else begin
            if(train_valid && train_mispredicted) begin                    //优先
                 predict_history<={train_history[6:0],train_taken};     //记录训练得新的跳转
            end
            else if(predict_valid) begin                         //预测
                 predict_history<={predict_history[6:0],predict_taken}; //记录预测的跳转
            end
            if(train_valid) begin
                if(train_taken)begin
                    PHT[train_history^train_pc]<=(PHT[train_history^train_pc]==2'b11)?2'b11:(PHT[train_history^train_pc]+1'b1);
                end
                else begin
                    PHT[train_history^train_pc]<=(PHT[train_history^train_pc]==2'b00)?2'b00:(PHT[train_history^train_pc]-1'b1);
                end
            end
        end
    end
    assign predict_taken =PHT[predict_history^predict_pc][1];
endmodule



module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter A = 8'd1;
    parameter B = 8'd2;
    parameter C = 8'd4;
    parameter D = 8'd8;
    parameter E = 8'd16;
    parameter F = 8'd32;
    parameter G = 8'd64;
    parameter H = 8'd128;

    //internal veriable
    reg [7:0]   current_state;
    reg [7:0]   next_state;

    always @(posedge clk ) begin
        if(!resetn)begin
            current_state <= A;
        end
        else begin
            current_state <= next_state;
        end
    end
    always @(current_state or x or y) begin
        case(current_state)
            A:begin
                if(!resetn) begin
                   next_state<=A; 
                end
                else begin
                    if(f_d)begin
                        next_state<=B;
                    end
                        next_state<=A;
                end
            end
            B:begin
                if(x) begin
                   next_state<=C; 
                end
                else begin
                    next_state<=B;
                end
            end
            C:begin
                if(!x) begin
                   next_state<=D; 
                end
                else begin
                    next_state<=C;
                end
            end
            D:begin
                if(x) begin
                   next_state<=E; 
                end
                else begin
                    next_state<=B;
                end
            end
            E:begin
                if(y) begin
                   next_state<=F; 
                end
                else begin
                    next_state<=H;
                end
            end
            F:begin
                if(y) begin
                    next_state<=G; 
                end
                else begin
                    next_state<=H;
                end
            end
        endcase
    end
    reg [1:0] f_r;
    always @(posedge clk) begin
        if(!resetn)begin
            f_r<=2'b0;
        end
        else begin
            f_r[0]<=1'b1;
            f_r[1]<=f_r[0];
        end
    end
    assign f_d = f_r[1]&(~f_r[0]);
    assign f=~f_r[1]&f_r[0];
    // reg g_r;
    // always @(posedge clk) begin
    //     if(!resetn)begin
    //         g_r<=1'b0;
    //     end
    //     else if(next_state == D&&(x==1'b1)|next_state == E&&(y==1'b1)) begin
    //         g_r<=1'b1;
    //     end
    //     else if(next_state == G)begin
    //         g_r<=1'b1;
    //     end
    //     else begin
    //         g_r<=1'b0;
    //     end
    // end
    // assign g =g_r;

    assign g =!resetn?1'b0:(next_state == E|next_state == E|next_state == G)?1'b1:1'b0;

endmodule