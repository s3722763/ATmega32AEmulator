module InstructionDecoder(
	input[15:0] instruction,
	output[7:0] data_bus,
	output[4:0] gpr_register_to_write_to_out,
	output[4:0] gpr_register_to_read_from_out,
	output enable_write_from_gpr_to_data_bus_out,
	output enable_read_from_data_bus_to_gpr_out
);

// Output to data bus
reg[7:0] data_for_bus;
reg output_to_data_bus;
assign data_bus = output_to_data_bus ? data_for_bus : 8'bzzzzzzzz;

// Control lines
reg[4:0] gpr_register_to_write_to;
reg[4:0] gpr_register_to_read_from;
reg enable_write_from_gpr_to_data_bus;
reg enable_read_from_data_bus_to_gpr;

always@(instruction)
begin
	// LDI Rd, K
	if (instruction[15:12] == 4'b1110)
	begin
		// Control lines
		// Register data
		// Register 16-31 only
		gpr_register_to_write_to <= {1'b1, instruction[7:4]};
		gpr_register_to_read_from <= 5'b00000;
		
		enable_read_from_data_bus_to_gpr <= 1'b1;
		enable_write_from_gpr_to_data_bus <= 1'b0;
		
		// Data lines
		data_for_bus[7] <= instruction[11];
		data_for_bus[6] <= instruction[10];
		data_for_bus[5] <= instruction[9];
		data_for_bus[4] <= instruction[8];
		data_for_bus[3] <= instruction[3];
		data_for_bus[2] <= instruction[2];
		data_for_bus[1] <= instruction[1];
		data_for_bus[0] <= instruction[0];
		output_to_data_bus <= 1'b1;
	end
	// MOV Rd, Rr
	/*else if (instruction[15:10] == 6'b001011)
	begin
		gpr_1 <= instruction[8:4];
		gpr_2 <= {instruction[9], instruction[3:0]};
		output_to_data_bus <= 1'b0;
		write_gpr_1 <= 1'b0;
	end*/
	else
	begin
	// Control lines
		// Register data
		gpr_register_to_write_to <= 5'b00000;
		gpr_register_to_read_from <= 5'b00000;
		
		enable_read_from_data_bus_to_gpr <= 1'b0;
		enable_write_from_gpr_to_data_bus <= 1'b0;
		
		// Data lines
		data_for_bus <= 8'b00000000;
		output_to_data_bus <= 1'b0;
	end
end

// Assign to control lines
// Control lines
// Control lines
// Control lines
assign gpr_register_to_write_to_out = gpr_register_to_write_to;
assign gpr_register_to_read_from_out = gpr_register_to_read_from;
assign enable_write_from_gpr_to_data_bus_out = enable_write_from_gpr_to_data_bus;
assign enable_read_from_data_bus_to_gpr_out = enable_read_from_data_bus_to_gpr;

endmodule
