const std = @import("std");
const print = std.debug.print;

pub const Asset = struct {
    pub fn init() Asset {

    }

    // ********************************************************************************************
    pub fn close(self: Asset) void {
        _ = self;
    }
};
