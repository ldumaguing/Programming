const rl = @import("raylib");

pub const Hill = struct {
    x: i32,
    y: i32,
    h: i32, // height

    pub fn init(x: i32, y: i32, h: i32) Hill {
        return Hill{
            .x = x,
            .y = y,
            .h = h,
        };
    }
};

pub const WholeHex = struct {
    x: i32,
    y: i32,
    c: rl.Color,

    pub fn init(x: i32, y: i32) WholeHex {
        return WholeHex{
            .x = x,
            .y = y,
        };
    }
};
