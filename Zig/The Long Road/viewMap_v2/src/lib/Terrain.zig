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
    id: i32,

    pub fn init(x: i32, y: i32, id: i32) WholeHex {
        return WholeHex{
            .x = x,
            .y = y,
            .id = id,
        };
    }
};

// id (terrainNum)
// ***************
// 10: Rolling
//  3: Cultivated
