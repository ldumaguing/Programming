const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var hex_loc = [_]i32{ 3, 5 };
    hex_rot180(&hex_loc);
    print("{d},{d}\n", .{ hex_loc[0], hex_loc[1] });
}

// ************************************************************************************************
fn hex_rot180(hl: []i32) void {
    print("{d},{d}\n", .{ hl.ptr[0], hl.ptr[1] });
    if (@mod(hl.ptr[0], 2) == 0) {
        hl.ptr[0] = 18 - hl.ptr[0];
        hl.ptr[1] = 12 - hl.ptr[1];
        return;
    }
    hl.ptr[0] = 18 - hl.ptr[0];
    hl.ptr[1] = 13 - hl.ptr[1];
}
