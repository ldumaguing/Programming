const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    // Open a file relative to the current working directory
    var file = try std.Io.Dir.cwd().openFile(io, "foo.txt", .{});
    defer file.close(io);

    // Read example: Read the entire file into a static buffer
    var buffer: [1024]u8 = undefined;
    const bytes_read = try file.readPositionalAll(io, &buffer, 0);
    
    std.debug.print("Contents: {s}\n", .{buffer[0..bytes_read]});
}

