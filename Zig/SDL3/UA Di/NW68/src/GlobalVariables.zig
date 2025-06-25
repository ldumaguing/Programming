pub var window_w: f32 = 800.0; // var because may be redefine later.
pub var window_h: f32 = 600.0; // var because may be redefine later.
pub var joystick_type: i32 = 0;

// *************** Mapboard info
pub const Zero_Zero = [_]i32{ 293, 141 };
pub const Lower_Right = [_]i32{ 5020, 3846 };
const hex_count_row: f64 = 28.0;
const hex_count_col: f64 = 19.0;
pub const Hex_Dim_ness = [_]f64{ @as(f64, @floatFromInt((Lower_Right[0] - Zero_Zero[0]))) / hex_count_row, @as(f64, @floatFromInt((Lower_Right[1] - Zero_Zero[1]))) / hex_count_col };
pub const Half_Hex_Y_ness: f32 = @floatCast(Hex_Dim_ness[1] / 2.0);
pub var map_loc = [_]i32{ 0, 0 };

pub var scale: i32 = 0;
pub var scaleness: f32 = 1.0;
pub var scale_old: i32 = 0;
pub var scaleness_old: f32 = 1.0;

// *************** chit
pub const chit_square_dim: i32 = 150;

// *************** Bits
pub const bit_0: u16 = 1 << 0;
pub const bit_1: u16 = 1 << 1;
pub const bit_2: u16 = 1 << 2;
pub const bit_3: u16 = 1 << 3;
pub const bit_4: u16 = 1 << 4;
pub const bit_5: u16 = 1 << 5;
pub const bit_6: u16 = 1 << 6;
pub const bit_7: u16 = 1 << 7;

pub const bit_8: u16 = 1 << 8;
pub const bit_9: u16 = 1 << 9;
pub const bit_10: u16 = 1 << 10;
pub const bit_11: u16 = 1 << 11;
pub const bit_12: u16 = 1 << 12;
pub const bit_13: u16 = 1 << 13;
pub const bit_14: u16 = 1 << 14;
pub const bit_15: u16 = 1 << 15;
