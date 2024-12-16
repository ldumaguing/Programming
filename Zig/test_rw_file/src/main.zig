const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const file = std.fs.cwd().openFile("build.zig", .{}) catch |err| {
        std.log.err("Failed to open file: {s}", .{@errorName(err)});
        return;
    };
    defer file.close();

    while (file.reader().readUntilDelimiterOrEofAlloc(allocator, '\n', std.math.maxInt(usize)) catch |err| {
        std.log.err("Failed to read line: {s}", .{@errorName(err)});
        return;
    }) |line| {
        defer allocator.free(line);
        std.debug.print("{s}\n", .{line});
        // _ = line; // Do something with the line
    }
}

// ************************************************************************************************
// const std = @import("std");
// const data = @embedFile("root.zig");
// const split = std.mem.splitAny;
//
// pub fn main() !void {
//     var splits = split(u8, data, "\n");
//     while (splits.next()) |line| {
//         std.debug.print("{s}\n", .{line});
//     }
// }

// ************************************************************************************************
// const std = @import("std");
//
// pub fn main() !void {
//     var gpa = std.heap.GeneralPurposeAllocator(.{}){};
//     const allocator = gpa.allocator();
//
//     var file = try std.fs.cwd().openFile("build.zig", .{});
//     defer file.close();
//
//     // Things are _a lot_ slower if we don't use a BufferedReader
//     var buffered = std.io.bufferedReader(file.reader());
//     var reader = buffered.reader();
//
//     // lines will get read into this
//     var arr = std.ArrayList(u8).init(allocator);
//     defer arr.deinit();
//
//     var line_count: usize = 0;
//     var byte_count: usize = 0;
//     while (true) {
//         reader.streamUntilDelimiter(arr.writer(), '\n', null) catch |err| switch (err) {
//             error.EndOfStream => break,
//             else => return err,
//         };
//         line_count += 1;
//         byte_count += arr.items.len;
//         arr.clearRetainingCapacity();
//     }
//     std.debug.print("{d} lines, {d} bytes", .{ line_count, byte_count });
// }

// ************************************************************************************************
// const std = @import("std");
// const fs = std.fs;

// pub fn main() !void {
//     const cwd = fs.cwd();
//     const open_file_flags = fs.File.OpenFlags{ .mode = .read_only };
//     const file_path = "build.zig";
//
//     const file = try cwd.openFile(file_path, open_file_flags);
//
//     const buffer = try std.heap.page_allocator.alloc(u8, 1024);
//     defer std.heap.page_allocator.free(buffer);
//
//     const bytes_read = try file.read(buffer);
//
//     std.debug.print("... {s}", .{buffer[0..bytes_read]});
// }
