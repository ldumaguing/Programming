const std = @import("std");
// const print = @import("std").debug.print;
const outw = @import("std").io.getStdOut().writer();

const fs = std.fs;

pub fn main() !void {
    const cwd = fs.cwd();
    const open_file_flags = fs.File.OpenFlags{ .mode = .read_only };
    const file_path = "chargen-901225-01.bin";

    const file = try cwd.openFile(file_path, open_file_flags);

    const buffer = try std.heap.page_allocator.alloc(u8, 4096);
    defer std.heap.page_allocator.free(buffer);

    const bytes_read = try file.read(buffer);

    // std.debug.print("... {s}", .{buffer[0..bytes_read]});
    const p: [*]u8 = @ptrCast(buffer);
    try outw.print("{}, {}\n", .{ p[1], bytes_read });
    for (0..512) |x| {
        for (0..8) |y| {
            const b: u8 = p[y + (8 * x)];
            inline for (0..8) |i| {
                const mask = 128 >> i;
                const showDot: bool = ((mask & b) != 0);
                if (showDot) {
                    try outw.print("*", .{});
                } else {
                    try outw.print(" ", .{});
                }
            }
            try outw.print("\n", .{});
        }
        try outw.print("-------- {}\n", .{x});
    }
}
