module RAM (
	input[7:0] data_in,
	input[7:0] write_address,
	input[7:0] read_address,
	input write_enable,
	input clock,
	output reg[7:0] data_out
);
	reg[7:0] memory[2047:0];
	
	always @(posedge(clock))
	begin
		if (write_enable == 1'b1)
		begin
			memory[write_address] <= data_in;
		end
		
		data_out <= memory[read_address];
	end

endmodule
