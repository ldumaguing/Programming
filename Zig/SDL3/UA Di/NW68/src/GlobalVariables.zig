pub var window_w: f32 = 640.0;
pub var window_h: f32 = 480.0;

// *************** Mapboard info
pub const Zero_Zero = [_]i32{ 293, 141 };
pub const Lower_Right = [_]i32{ 5020, 3846 };
pub const Hex_Dim = [_]f64{ @as(f64, @floatFromInt((Lower_Right[0] - Zero_Zero[0]))) / 28.0, @as(f64, @floatFromInt((Lower_Right[1] - Zero_Zero[1]))) / 19.0 };
pub const Half_Hex_Y: f32 = @floatCast(Hex_Dim[1] / 2.0);

// *************** Bits
pub const bit_0 = 1 << 0;
pub const bit_1 = 1 << 1;
pub const bit_2 = 1 << 2;
pub const bit_3 = 1 << 3;
pub const bit_4 = 1 << 4;
pub const bit_5 = 1 << 5;
pub const bit_6 = 1 << 6;
pub const bit_7 = 1 << 7;

pub const bit_8 = 1 << 8;
pub const bit_9 = 1 << 9;
pub const bit_10 = 1 << 10;
pub const bit_11 = 1 << 11;
pub const bit_12 = 1 << 12;
pub const bit_13 = 1 << 13;
pub const bit_14 = 1 << 14;
pub const bit_15 = 1 << 15;

pub const bit_16 = 1 << 16;
pub const bit_17 = 1 << 17;
pub const bit_18 = 1 << 18;
pub const bit_19 = 1 << 19;
pub const bit_20 = 1 << 20;
pub const bit_21 = 1 << 21;
pub const bit_22 = 1 << 22;
pub const bit_23 = 1 << 23;
