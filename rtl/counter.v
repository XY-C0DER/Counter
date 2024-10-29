module	counter
#(
	parameter	cnt_max=25'd24_999_999
)
(
	input	wire	sys_clk,
	input	wire	sys_rst,
	
	output	reg		led_out
);

reg		[24:0]	count;

always@(posedge	sys_clk or negedge	sys_rst)
	if(sys_rst	==	1'b0)
		count	<= 25'b0;
	else	if((sys_rst == 1'b1)&&(count == cnt_max))
		count <= 25'b0;
	else
		count <= count + 1;
		
always@(posedge	sys_clk or negedge	sys_rst)
	if(sys_rst	==	1'b0)
		led_out	<= 1'b0;
	else	if(count == cnt_max)
		led_out <= ~led_out;
endmodule