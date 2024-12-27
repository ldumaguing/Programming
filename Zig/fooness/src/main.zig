const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const file = std.fs.cwd().openFile("test.script", .{}) catch |err| {
        std.log.err("Failed to open file: {s}", .{@errorName(err)});
        return;
    };
    defer file.close();

    var mode: i32 = 0;
    while (file.reader().readUntilDelimiterOrEofAlloc(allocator, '\n', std.math.maxInt(usize)) catch |err| {
        std.log.err("Failed to read line: {s}", .{@errorName(err)});
        return;
    }) |line| {
        defer allocator.free(line);

        if (std.mem.indexOf(u8, line, "***** chit placement")) |_| {
            mode = 1;
        }
        if (std.mem.indexOf(u8, line, "***** END")) |_| {
            mode = 0;
        }

        switch (mode) {
            0 => {
                return;
            },
            1 => {
                placement(line);
            },
            else => {},
        }
    }
}

// ************************************************************************************************
fn placement(line: []u8) void {
    std.debug.print("{s}\n", .{line});
}
