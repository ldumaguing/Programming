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
    var buf: [32]u8 = undefined;
    const stmt_a = "insert into chit_status (id, chit_ID, hex_ID, flags) values (";

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    var stmt = String.init(arena.allocator());
    defer stmt.deinit();

    const regex1: mvzr.Regex = mvzr.compile("^[0-9]+").?;
    if (regex1.isMatch(line)) {
        const str_id_counter = try std.fmt.bufPrint(&buf, "{}", .{id_counter});
        const match: mvzr.Match = regex1.match(line).?;
        try stmt.concat(stmt_a);
        try stmt.concat(str_id_counter);
        try stmt.concat(", ");
        try stmt.concat(match.slice);
        try stmt.concat(", ");
    }

    const regex2: mvzr.Regex = mvzr.compile("[A-Z]+[0-9]+").?;
    if (regex2.isMatch(line)) {
        const match: mvzr.Match = regex2.match(line).?;
        try stmt.concat("'");
        try stmt.concat(match.slice);
        try stmt.concat("', ");
    }

    const regex3: mvzr.Regex = mvzr.compile("[FB]$").?;
    if (regex3.isMatch(line)) {
        const match: mvzr.Match = regex3.match(line).?;
        if (std.mem.eql(u8, match.slice, "F")) {
            try stmt.concat("0)");
        } else {
            try stmt.concat("1)");
        }
    }

    if (stmt.len() > 20) {
        std.debug.print("{s}\n", .{stmt.str()});
    }
}
