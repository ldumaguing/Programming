//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.
const mvzr = @import("mvzr.zig");
const re = mvzr.Regex;

pub fn main() !void {
    // const re: mvzr.Regex = mvzr.compile("f").?;
    const fi: re = mvzr.compile("f").?;
    // const match: mvzr.Match = re.match("fish 123").?;
    const did_match: bool = fi.isMatch("fish 123");

    std.debug.print(">{}<\n", .{did_match});
}

const std = @import("std");
