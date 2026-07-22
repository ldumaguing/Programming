const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn slurp(id: i32, scenario: []const u8, init: std.process.Init) !void {
    // ********** 1: open database
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    // *********************************************

    const io = init.io;

    // Open a file relative to the current working directory
    var file = try std.Io.Dir.cwd().openFile(io, scenario, .{});
    defer file.close(io);

    // Read example: Read the entire file into a static buffer
    // var buffer: [1024]u8 = undefined;
    // const bytes_read = try file.readPositionalAll(io, &buffer, 0);

    // std.debug.print("Contents: {s}\n", .{buffer[0..bytes_read]});

    // *********************************************
    var file_buffer: [4096]u8 = undefined;
    var reader = file.reader(io, &file_buffer);
    var parseMode: i32 = 0;
    while (try reader.interface.takeDelimiter('\n')) |line| {
        if (line.len == 0) continue;
        if (isEND(line)) break;
        if (std.mem.startsWith(u8, line, "combatants *")) {
            parseMode = 1;
            continue;
        }

        if (parseMode == 1) includeCombatant(line[0..11], id); // 1049 x 4   ; Soviet Infantry

        if (std.mem.startsWith(u8, line, "name:")) {
            save_text(db, line[0..4], line[5..], id);
            continue;
        }
        if (std.mem.startsWith(u8, line, "maps:")) {
            save_text(db, line[0..4], line[5..], id);
            continue;
        }
        if (std.mem.startsWith(u8, line, "turns:")) {
            save_int(db, line[0..5], line[6..], id);
            continue;
        }
    }
}

// ************************************************************************************************
fn includeCombatant(line: []const u8, id: i32) void {
    print("{s} - {s} - {d}\n", .{line[0..4], line[7..], id});
}

// ************************************************************************************************
fn save_int(db: ?*c.sqlite3, attrib: []const u8, intVal: []const u8, id: i32) void {
    // Prepare statement
    const query = "INSERT INTO GameMeta (sessionID, attrib, val_int0) VALUES (?1, ?2, ?3)";
    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("Failed to prepare statement: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Binding
    _ = c.sqlite3_bind_int(stmt, 1, id);
    _ = c.sqlite3_bind_text(stmt, 2, attrib.ptr, @intCast(attrib.len), c.SQLITE_TRANSIENT);
    _ = c.sqlite3_bind_text(stmt, 3, intVal.ptr, @intCast(intVal.len), c.SQLITE_TRANSIENT);

    // Execute the insertion step
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Execution failed: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}

// ************************************************************************************************
fn save_text(db: ?*c.sqlite3, attrib: []const u8, text: []const u8, id: i32) void {
    // Prepare statement
    const query = "INSERT INTO GameMeta (sessionID, attrib, val_text) VALUES (?1, ?2, ?3)";
    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("Failed to prepare statement: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Binding
    _ = c.sqlite3_bind_int(stmt, 1, id);
    _ = c.sqlite3_bind_text(stmt, 2, attrib.ptr, @intCast(attrib.len), c.SQLITE_TRANSIENT);
    _ = c.sqlite3_bind_text(stmt, 3, text.ptr, @intCast(text.len), c.SQLITE_TRANSIENT);

    // Execute the insertion step
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Execution failed: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}

// ************************************************************************************************
fn isEND(line: []u8) bool {
    if (std.mem.startsWith(u8, line, "END *"))
        return true;
    return false;
}
