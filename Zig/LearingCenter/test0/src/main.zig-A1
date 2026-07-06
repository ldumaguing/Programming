const std = @import("std");
const print = std.debug.print;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    // Open a file relative to the current working directory
    var file = try std.Io.Dir.cwd().openFile(io, "foo.txt", .{});
    defer file.close(io);

    // Read example: Read the entire file into a static buffer
    // var buffer: [1024]u8 = undefined;
    // const bytes_read = try file.readPositionalAll(io, &buffer, 0);

    // std.debug.print("Contents: {s}\n", .{buffer[0..bytes_read]});

    // *********************************************
    var file_buffer: [4096]u8 = undefined;
    var reader = file.reader(io, &file_buffer);
    var line_no: usize = 0;
    while (try reader.interface.takeDelimiter('\n')) |line| {
        line_no += 1;
        print("{d}--{s}\n", .{ line_no, line });
    }

    // try std.testing.expectEqual(13, line_no);
    // print("Total lines: {d}\n", .{line_no});
}
