const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub const light_brown = rl.Color.init(0xA6, 0x9A, 0x8E, 0xFF);
pub const pale_yellow = rl.Color.init(0xCE, 0xCC, 0xBF, 0xFF);

pub const Path = struct {
    x: i32,
    y: i32,
    f: u32, // flags

    pub fn init(x: i32, y: i32) Path {
        return Path{
            .x = x,
            .y = y,
            .f = 0,
        };
    }
    // bit 0: blocks LOS
    // bit 1:
};

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

pub const Bridge = struct {
    x: i32,
    y: i32,
    s: i32, // spineLoc

    pub fn init(x: i32, y: i32, s: i32) Bridge {
        return Bridge{
            .x = x,
            .y = y,
            .s = s,
        };
    }
};

// ************************************************************************************************
pub fn is_hill_blocks_LOS(h: *std.ArrayList(Hill), p: *std.ArrayList(Path)) bool {
    for (0..h.items.len) |i| {
        for (0..p.items.len) |j| {
            if (h.items.ptr[i].x == p.items.ptr[j].x) {
                if (h.items.ptr[i].y == p.items.ptr[j].y) return true;
            }
        }
    }
    return false;
}

// ************************************************************************************************
pub fn get_3rd_pt(pt1: struct { i32, i32 }, pt2: struct { i32, i32 }) struct { i32, i32 } {
    return .{ pt1[0] + pt2[0], pt1[1] + pt2[1] };
}
