module keypad(input wire clk,
              output reg [3:0]  column_pins,
              input wire [3:0]   row_pins,
              output reg [15:0] keys);

  reg [1:0] column = 0;

  initial begin
    column_pins = 4'b1110;
    keys = 0;
  end

  integer i;

  always @(posedge clk) begin
    for (i = 0; i < 4; i = i + 1) begin
      keys[i*4 + column] <= (row_pins[i] == 0);
    end
    column <= (column + 1) % 4;
    column_pins <= (column_pins << 1) + (column_pins >> 3);
  end
endmodule

module top(input wire  i_clock,
           input wire  i_keypad_col1,
           input wire  i_keypad_col2,
           input wire  i_keypad_col3,
           input wire  i_keypad_col4,
           output wire o_keypad_row1,
           output wire o_keypad_row2,
           output wire o_keypad_row3,
           output wire o_keypad_row4,
           output wire o_led1,
           output wire o_led2,
           output wire o_led3,
           output wire o_led4,
           output wire LED4);

  wire [3:0] row_pins;
  wire [3:0] column_pins;
  wire [15:0] keys;

  keypad k(i_clock, column_pins, row_pins, keys);

  assign column_pins = {o_keypad_row4, o_keypad_row3, o_keypad_row2, o_keypad_row1};
  assign row_pins = {i_keypad_col1, i_keypad_col2, i_keypad_col3, i_keypad_col4};

  integer i;
  reg [3:0] key = 0;

  always @(posedge i_clock) begin
    key <= 0;
    for (i = 0; i < 16; i = i + 1)
      if (keys[i])
        key <= i;
  end

  assign LED4 = !(|keys);
  assign o_led1 = key[3];
  assign o_led2 = key[2];
  assign o_led3 = key[1];
  assign o_led4 = key[0];
endmodule