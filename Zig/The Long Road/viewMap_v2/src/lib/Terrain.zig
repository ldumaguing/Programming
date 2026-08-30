const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

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

pub const Lake = struct {
    x: i32,
    y: i32,

    pub fn init(x: i32, y: i32) Lake {
        return Lake{
            .x = x,
            .y = y,
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

pub const River = struct {
    x: i32,
    y: i32,
    s: i32, // spineLoc

    pub fn init(x: i32, y: i32, s: i32) River {
        return River{
            .x = x,
            .y = y,
            .s = s,
        };
    }
};

pub const Road = struct {
    x: i32,
    y: i32,
    s: i32, // spineLoc

    pub fn init(x: i32, y: i32, s: i32) Road {
        return Road{
            .x = x,
            .y = y,
            .s = s,
        };
    }
};

// ************************************************************************************************
pub fn get_3rd_pt(pt1: struct { i32, i32 }, pt2: struct { i32, i32 }) struct { i32, i32 } {
    return .{ pt1[0] + pt2[0], pt1[1] + pt2[1] };
}
