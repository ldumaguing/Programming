const std = @import("std");
const Io = std.Io;

const c = @cImport({
    @cInclude("sqlite3.h");
});

const test0 = @import("test0");

fn callback(
    _: ?*anyopaque,
    argc: c_int,
    argv: [*c][*c]u8,
    azColName: [*c][*c]u8,
) callconv(.C) c_int {
    for (0..@intCast(argc)) |i| {
        if (argv[i] != null) {
            std.debug.print("{s} = {s}\n", .{ azColName[i], argv[i] });
        } else {
            std.debug.print("{s} = NULL\n", .{azColName[i]});
        }
    }
    return 0;
}


pub fn main(init: std.process.Init) !void {
    // Prints to stderr, unbuffered, ignoring potential errors.
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // This is appropriate for anything that lives as long as the process.
    const arena: std.mem.Allocator = init.arena.allocator();

    // Accessing command line arguments:
    const args = try init.minimal.args.toSlice(arena);
    for (args) |arg| {
        std.log.info("arg: {s}", .{arg});
    }

    // In order to do I/O operations need an `Io` instance.
    const io = init.io;

    // Stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_file_writer: Io.File.Writer = .init(.stdout(), io, &stdout_buffer);
    const stdout_writer = &stdout_file_writer.interface;

    try test0.printAnotherMessage(stdout_writer);

    try stdout_writer.flush(); // Don't forget to flush!

    var db: ?*c.sqlite3 = null;
    var rc = c.sqlite3_open("foo.db", &db);
    defer _ = c.sqlite3_close(db);



    var errMsg: [*c]u8 = undefined;
    rc = c.sqlite3_exec(db, "insert into fish (name) values ('moe')", null, null, &errMsg);
    if (rc != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{errMsg});
        c.sqlite3_free(errMsg);
    }
    _ = c.sqlite3_close(db);
}



