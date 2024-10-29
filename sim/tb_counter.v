`timescale	1ns/1ns
module	tb_counter();

wire	led_out;

reg		sys_clk;
reg		sys_rst;

initial
	begin
		sys_clk <= 1'b0;
		sys_rst	<= 1'b0;
		#20
		sys_rst	<= 1'b1;
	end
	
always	#10	sys_clk	= ~sys_clk;

initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t: clk=%b rst=%b led_out=%b", $time, sys_clk, sys_rst, led_out);
end
counter
#(
	.cnt_max(25'd24)
)
counter_inst
(
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),
	.led_out(led_out)
);

endmodule