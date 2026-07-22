const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn slurp(id: i32, scenario: []const u8, init: std.process.Init) !void {
    print("ID: {d}\n", .{id});

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
    var line_no: usize = 0;
    while (try reader.interface.takeDelimiter('\n')) |line| {
        if (isEND(line)) break;
        if (std.mem.startsWith(u8, line, "name:")) {
            save_text(db, line[0..4], line[5..]);
            continue;
        }

        line_no += 1;
    }
}

// ************************************************************************************************
fn save_text(db: ?*c.sqlite3, attrib: []const u8, text: []const u8) void {
    print("{?}---{s}, {s}\n", .{ db, attrib, text });
}

// ************************************************************************************************
fn isEND(line: []u8) bool {
    if (std.mem.startsWith(u8, line, "END *"))
        return true;
    return false;
}
