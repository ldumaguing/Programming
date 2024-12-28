const mvzr = @import("mvzr.zig");
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
    var id_counter: i32 = 1000;
    while (file.reader().readUntilDelimiterOrEofAlloc(allocator, '\n', std.math.maxInt(usize)) catch |err| {
        std.log.err("Failed to read line: {s}", .{@errorName(err)});
        return;
    }) |line| {
        defer allocator.free(line);

        if (std.mem.indexOf(u8, line, "***** chit placement")) |_| {
            mode = 1;
        }
        if (std.mem.indexOf(u8, line, "***** END")) |_| {
            mode = 999;
        }

        switch (mode) {
            999 => {
                return;
            },
            1 => {
                try placement(line, id_counter);
            },
            else => {},
        }
        id_counter += 1;
    }
}

// ************************************************************************************************
fn placement(line: []u8, id_counter: i32) !void {
    const regex: mvzr.Regex = mvzr.compile("^[0-9]+").?;

    if (regex.isMatch(line)) {
        const match: mvzr.Match = regex.match(line).?;
        std.debug.print("{}: {s}\n", .{ id_counter, match.slice });
    }
    // const match: mvzr.Match = regex.match("fish 123").?;
    // std.debug.print("{s}\n", .{match.slice});
    // const did_match: bool = regex.isMatch("123 fish");
    // std.debug.print("{}\n", .{did_match});
}
