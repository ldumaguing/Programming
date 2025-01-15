const mvzr = @import("mvzr.zig");
const String = @import("zig-string.zig").String;
const std = @import("std");
const print = @import("std").debug.print;
const sqlite = @import("sqlite");

var db: sqlite.Db = undefined;
var faction_name: [64]u8 = undefined;
var formation_name: [64]u8 = undefined;
var unit_type: [64]u8 = undefined;

pub fn main() !void {
    db = try sqlite.Db.init(.{
        .mode = sqlite.Db.Mode{ .File = "NW68.db" },
        .open_flags = .{
            .write = true,
            .create = true,
        },
        .threading_mode = .MultiThread,
    });

    try db.exec("delete from chit_status", .{}, .{});

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    // ************** PARSING ARGS
    var theFile = String.init(allocator);
    defer theFile.deinit();

    var argsIterator = try std.process.ArgIterator.initWithAllocator(allocator);
    defer argsIterator.deinit();

    _ = argsIterator.next();
    if (argsIterator.next()) |arg| {
        try theFile.concat(arg);
        std.log.err("{s}\n", .{theFile.str()});
    } else {
        std.log.err("Need a file.\n", .{});
        return;
    }
    // *************** parsing args

    const file = std.fs.cwd().openFile(theFile.str(), .{}) catch |err| {
        std.log.err("Failed to open file: {s}", .{@errorName(err)});
        return;
    };
    defer file.close();

    var mode: u64 = 0;
    // 0: chit placement
    // 1: OOB
    var id_counter: i32 = 1000;
    while (file.reader().readUntilDelimiterOrEofAlloc(allocator, '\n', std.math.maxInt(usize)) catch |err| {
        std.log.err("Failed to read line: {s}", .{@errorName(err)});
        return;
    }) |line| {
        defer allocator.free(line);

        if (std.mem.indexOf(u8, line, "***** chit placement")) |_| {
            mode = (1 << 0);
        }
        if (std.mem.indexOf(u8, line, "***** OOB")) |_| {
            mode = (1 << 1);
        }

        if (std.mem.indexOf(u8, line, "***** set embarkable")) |_| {
            try embarkable();
        }
        if (std.mem.indexOf(u8, line, "***** END")) |_| {
            mode = 999;
        }

        switch (mode) {
            999 => {
                print("Done.\n", .{});
                return;
            },
            (1 << 0) => {
                try placement(line, id_counter);
            },
            (1 << 1) => {
                try oob(line, id_counter);
            },

            else => {},
        }
        id_counter += 1;
    }
}

// ************************************************************************************************
fn oob(line: []u8, id_counter: i32) !void {
    _ = id_counter;
    // print("In OOB: {s}.\n", .{line});

    if (std.mem.indexOf(u8, line, "*** ")) |_| {
        for (0..64) |i| {
            faction_name[i] = 0;
        }
        for (0..64) |i| {
            formation_name[i] = 0;
        }
        _ = try std.fmt.bufPrintZ(&faction_name, "{s}", .{line[4..]});
        return;
    }
    if (std.mem.indexOf(u8, line, "** ")) |_| {
        for (0..64) |i| {
            formation_name[i] = 0;
        }
        _ = try std.fmt.bufPrintZ(&formation_name, "{s}", .{line[3..]});
        return;
    }
    for (0..64) |i| {
        unit_type[i] = 0;
    }
    _ = try std.fmt.bufPrintZ(&unit_type, "{s}", .{line});

    if (line.len <= 0) return;

    print("{s} : {s} : {s}\n", .{ faction_name, formation_name, unit_type });
}

// ************************************************************************************************
fn embarkable() !void {
    print("embarkable\n", .{});
    const query =
        \\update chit_status set embarkable = 0 where chit_ID in (
        \\select id from chits where flags & (1 << 7)
        \\)
    ;

    try db.exec(query, .{}, .{});
}

// ************************************************************************************************
fn placement(line: []u8, id_counter: i32) !void {
    print("placement.\n", .{});
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    var chit_ID: i32 = 0;
    var hex_ID = String.init(arena.allocator());
    defer hex_ID.deinit();
    var flags: i32 = 0;
    var is_valid: bool = false;

    const regex1: mvzr.Regex = mvzr.compile("^[0-9]+").?;
    if (regex1.isMatch(line)) {
        const match: mvzr.Match = regex1.match(line).?;
        chit_ID = try std.fmt.parseInt(i32, match.slice, 10);
    }

    const regex2: mvzr.Regex = mvzr.compile("[A-Z]+[0-9]+").?;
    if (regex2.isMatch(line)) {
        const match: mvzr.Match = regex2.match(line).?;
        try hex_ID.concat(match.slice);
    }

    const regex3: mvzr.Regex = mvzr.compile("[FB]$").?;
    if (regex3.isMatch(line)) {
        const match: mvzr.Match = regex3.match(line).?;
        if (std.mem.eql(u8, match.slice, "F")) {
            flags = 0;
        } else {
            flags = 1;
        }
        is_valid = true;
    }

    if (is_valid) {
        // print("{} --- {s} --- {}, {s}, {}\n", .{ id_counter, line, chit_ID, hex_ID.str(), flags });
        const query =
            \\insert into chit_status (id, chit_ID, hex_ID, flags) values (?, ?, ?, ?)
        ;
        var stmt = try db.prepare(query);
        defer stmt.deinit();
        try stmt.exec(.{}, .{
            .id = id_counter,
            .chit_ID = chit_ID,
            .hex_ID = hex_ID.str(),
            .flags = flags,
        });
    }
}
