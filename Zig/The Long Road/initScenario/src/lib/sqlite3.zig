const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

