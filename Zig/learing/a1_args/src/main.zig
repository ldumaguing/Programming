const std = @import("std");
const print = std.debug.print;

pub fn main(init: std.process.Init) !void {
    const arena: std.mem.Allocator = init.arena.allocator();
    const args = try init.minimal.args.toSlice(arena);

    for (args) |arg| {
        std.log.info("arg: {s}", .{arg});
        print("---> {s}\n", .{arg});
    }
    print("*** {s} ***\n", .{args[0]});
}


