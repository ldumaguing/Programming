const std = @import("std");
const print = std.debug.print;

pub const GameMap = struct {
    index: usize,
    row: i32,
    col: i32,

    pub fn init() GameMap {
        return GameMap{
            .index = 0,
            .row = 0,
            .col = 0,
        };
    }

    // ********************************************************************************************
    pub fn foo(self: GameMap) void {
        _ = self;
        print("************** yo ************\n", .{});
    }

    pub fn bar(self: GameMap) void {
        _ = self;
        print("************** yeah ************\n", .{});
    }
};
