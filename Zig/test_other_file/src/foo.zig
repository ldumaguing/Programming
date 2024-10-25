const std = @import("std");

const a = 1;
pub const b = 2;
pub const c = 69;

pub fn bar() void {
    std.debug.print("Hello from foo.zig\n", .{});
}

pub fn fee() i32 {
    return 70;
}

pub fn fie(x: i32) i32 {
    return x;
}
