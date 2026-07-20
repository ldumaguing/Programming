const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main(init: std.process.Init) !void {
    const arena: std.mem.Allocator = init.arena.allocator();
    const args = try init.minimal.args.toSlice(arena);

    if (args.len == 1) {
        usageA();
        return;
    }

    // **********
    var db: ?*c.sqlite3 = undefined;

    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    // **********
    print("{s}, {s}", .{args[1], args[2]});
}

// ************************************************************************************************
fn usageA() void {
    print("initScenario 'filename' id\n", .{});
}
