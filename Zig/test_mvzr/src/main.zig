//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.
const mvzr = @import("mvzr.zig");

pub fn main() !void {
    //const re: mvzr.Regex = mvzr.compile("f").?;
    const regex: mvzr.Regex = mvzr.compile("23").?;
    // const match: mvzr.Match = re.match("fish 123").?;
    // const did_match: bool = fi.isMatch("fish 123");

    // std.debug.print(">{}<\n", .{did_match});
    var iter: mvzr.Regex.RegexIterator = regex.iterator("By convention, main23.zig is where your main fun23ction lives in the ca23se that");
    while (iter.next()) |m| {
        std.log.err("{s}\n", .{m});
    }
}

const std = @import("std");
