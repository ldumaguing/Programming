const std = @import("std");
const print = std.debug.print;

pub fn main(init: std.process.Init) !void {
    const arena: std.mem.Allocator = init.arena.allocator();
    const args = try init.minimal.args.toSlice(arena);

    if (args.len == 1) {
        usageA();
        return;
    }
    if (args.len > 2) {
        usageB();
        return;
    }

    const io = init.io;
    // Open a file relative to the current working directory
    var file = try std.Io.Dir.cwd().openFile(io, args[1], .{});
    defer file.close(io);

    // *********************************************
    var file_buffer: [4096]u8 = undefined;
    var reader = file.reader(io, &file_buffer);
    var line_no: usize = 0;
    while (try reader.interface.takeDelimiter('\n')) |line| {
        line_no += 1;
        print("{d}--{s}\n", .{ line_no, line });
    }
}

// ***********************************************************************************************
fn usageA() void {
    print("defineMap filename\n", .{});
}

fn usageB() void {
    print("defineMap 'file name'\n", .{});
}
