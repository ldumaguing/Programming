const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

const slrp = @import("lib/slurping.zig");

pub fn main(init: std.process.Init) !void {
    const arena: std.mem.Allocator = init.arena.allocator();
    const args = try init.minimal.args.toSlice(arena);

    if (args.len < 3) {
        usageA();
        return;
    }

    const number = try std.fmt.parseInt(i32, args[2], 10);
    if (number < 1) {
        usageB();
        return;
    }

    // ********** 1: open database
    var db: ?*c.sqlite3 = undefined;

    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    // ************************************************************
    clearScenario(db, args[2]);
    try slrp.slrp(number, args[1], init);
}

// ************************************************************************************************
fn usageA() void {
    print("initScenario 'setup file' id\n", .{});
}

// **********
fn usageB() void {
    print("ID must be greater than 0.\n", .{});
}

// **********
fn clearScenario(db: ?*c.sqlite3, id: []const u8) void {
    // Prepare statement
    const query1 = "DELETE FROM GameSave where id = ?1";
    const query2 = "DELETE FROM GameMap where save_id = ?1";

    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query1, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("Failed to prepare statement: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Binding
    _ = c.sqlite3_bind_text(stmt, 1, id.ptr, @intCast(id.len), c.SQLITE_TRANSIENT);

    // Execute the insertion step
    var rc = c.sqlite3_step(stmt);
    if (rc != c.SQLITE_DONE) {
        print("Execution failed: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // **********
    if (c.sqlite3_prepare_v2(db, query2, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("Failed to prepare statement: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // Binding
    _ = c.sqlite3_bind_text(stmt, 1, id.ptr, @intCast(id.len), c.SQLITE_TRANSIENT);

    // Execute the insertion step
    rc = c.sqlite3_step(stmt);
    if (rc != c.SQLITE_DONE) {
        print("Execution failed: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}
