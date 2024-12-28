const mvzr = @import("mvzr.zig");
const String = @import("zig-string.zig").String;
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
    _ = id_counter;
    const stmt_a = "insert into chit_status (id, chit_ID, hex_ID, flags) values (";
    //var chit_ID: []u8 = undefined;
    //var hex_ID: []u8 = undefined;

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    var stmt = String.init(arena.allocator());
    defer stmt.deinit();

    const regex1: mvzr.Regex = mvzr.compile("^[0-9]+").?;
    if (regex1.isMatch(line)) {
        const match: mvzr.Match = regex1.match(line).?;
        // const fish = match.slice;
        try stmt.concat(stmt_a);
        try stmt.concat(match.slice);
        try stmt.concat(", ");
        // chit_ID = try std.fmt.allocPrint(allocator, "{s}", .{match.slice});
        // defer allocator.free(chit_ID);
        // std.debug.print("...b: {s}{s}\n", .{ fish, stmt.str() });
    }
    std.debug.print("...b: {s}\n", .{stmt.str()});

    // std.debug.print("b: {s}, {s}\n", .{ line, chit_ID.ptr });

    // var arena1 = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // defer arena1.deinit();
    // const allocator1 = arena1.allocator();

    // const regex2: mvzr.Regex = mvzr.compile("[A-Z]+[0-9]+").?;
    // if (regex2.isMatch(line)) {
    //     const match: mvzr.Match = regex2.match(line).?;

    //     stmt_c = try std.fmt.allocPrint(allocator1, "{s}, {s}", .{ stmt_b, match.slice });
    //     std.debug.print(":::{s}\n", .{stmt_c});
    //     defer allocator1.free(stmt_c);
    //     std.debug.print("...{s}\n", .{stmt_c});
    // }

    // const match: mvzr.Match = regex.match("fish 123").?;
    // std.debug.print("{s}\n", .{match.slice});
    // const did_match: bool = regex.isMatch("123 fish");
    // std.debug.print("{}\n", .{did_match});
}
