const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

const terrains = [_][]const u8{ "", "BRIDGE", "CITY", "CULTIVATED", "FOREST", "HILL", "HILL 2", "LAKE", "RIVER", "ROAD", "ROLLING", "TOWN", "TUNNEL ROAD" };
// terrainType
//    1: whole hexagon
//    2: spine location
//    3: road, path, etc.  The spines are exits from starting hexagon
const terrainTypes = [_]i32{ 0, 2, 1, 1, 1, 1, 1, 1, 2, 3, 1, 1, 3 };
const ref_a = 'a';

pub fn main(init: std.process.Init) !void {
    var db: ?*c.sqlite3 = undefined;

    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    const arena: std.mem.Allocator = init.arena.allocator();
    const args = try init.minimal.args.toSlice(arena);

    if (args.len == 1) {
        usageA();
        return;
    }
    if (args.len > 2) {
        usageB();
        return;
    }

    const io = init.io;
    // Open a file relative to the current working directory
    var file = try std.Io.Dir.cwd().openFile(io, args[1], .{});
    defer file.close(io);

    // *********************************************
    var buffer: [512]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();

    // ********** define fname
    var fname: []u8 = undefined;
    if (std.mem.findLast(u8, args[1], "/")) |index| {
        fname = try std.fmt.allocPrint(
            allocator,
            "{s}",
            .{args[1][index + 1 ..]},
        );
    }

    // *********************************************
    var file_buffer: [200]u8 = undefined;
    var reader = file.reader(io, &file_buffer);
    var terrainType: usize = 0;
    while (try reader.interface.takeDelimiter('\n')) |line| {
        if (isEND(line)) break;
        if (line.len == 0) terrainType = 0;
        if (std.mem.startsWith(u8, line, "BRIDGE *")) {
            terrainType = 1;
            continue;
        }
        if (std.mem.startsWith(u8, line, "CITY *")) {
            terrainType = 2;
            continue;
        }
        if (std.mem.startsWith(u8, line, "CULTIVATED *")) {
            terrainType = 3;
            continue;
        }
        if (std.mem.startsWith(u8, line, "FOREST *")) {
            terrainType = 4;
            continue;
        }
        if (std.mem.startsWith(u8, line, "HILL *")) {
            terrainType = 5;
            continue;
        }
        if (std.mem.startsWith(u8, line, "HILL 2 *")) {
            terrainType = 6;
            continue;
        }
        if (std.mem.startsWith(u8, line, "LAKE *")) {
            terrainType = 7;
            continue;
        }
        if (std.mem.startsWith(u8, line, "RIVER *")) {
            terrainType = 8;
            continue;
        }
        if (std.mem.startsWith(u8, line, "ROAD *")) {
            terrainType = 9;
            continue;
        }
        if (std.mem.startsWith(u8, line, "ROLLING *")) {
            terrainType = 10;
            continue;
        }
        if (std.mem.startsWith(u8, line, "TOWN *")) {
            terrainType = 11;
            continue;
        }
        if (std.mem.startsWith(u8, line, "TUNNEL ROAD *")) {
            terrainType = 12;
            continue;
        }

        if (terrainType > 0) saveTerrain(terrainType, fname, line, db);
    }
}

// ************************************************************************************************
fn saveTerrain(terrainType: usize, fname: []const u8, line: []u8, db: ?*c.sqlite3) void {
    if (terrainTypes[terrainType] == 1) {
        terrain_1(fname, line, terrainType, db);
    } else terrain_2n3(fname, line, terrainType, db);
}

fn terrain_1(fname: []const u8, line: []u8, terrainNum: usize, db: ?*c.sqlite3) void {
    // ********** slice string
    var it = std.mem.splitScalar(u8, line, ',');
    while (it.next()) |hexID| {
        const hexLoc = convert_to_hexLoc(hexID);
        process_sql_statement(hexLoc, fname, hexID, terrainNum, db, 0);
    }
}

fn process_sql_statement(hexLoc: struct { i32, i32 }, fname: []const u8, hexID: []const u8, terrainNum: usize, db: ?*c.sqlite3, spineLoc: i32) void {
    // Prepare statement
    const query = "INSERT INTO map (filename, hexID, hex_x, hex_y, terrainNum, terrainName, terrainType, spineLoc) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8)";
    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("Failed to prepare statement: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Binding
    _ = c.sqlite3_bind_text(stmt, 1, fname.ptr, @intCast(fname.len), c.SQLITE_TRANSIENT);
    _ = c.sqlite3_bind_text(stmt, 2, hexID.ptr, @intCast(hexID.len), c.SQLITE_TRANSIENT);
    _ = c.sqlite3_bind_int(stmt, 3, hexLoc[0]);
    _ = c.sqlite3_bind_int(stmt, 4, hexLoc[1]);
    _ = c.sqlite3_bind_int(stmt, 5, @as(i32, @intCast(terrainNum)));
    _ = c.sqlite3_bind_text(stmt, 6, terrains[terrainNum].ptr, @intCast(terrains[terrainNum].len), c.SQLITE_TRANSIENT);
    _ = c.sqlite3_bind_int(stmt, 7, terrainTypes[terrainNum]);
    _ = c.sqlite3_bind_int(stmt, 8, spineLoc);

    // Execute the insertion step
    const rc = c.sqlite3_step(stmt);
    if (rc != c.SQLITE_DONE) {
        print("Execution failed: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}

fn terrain_2n3(fname: []const u8, line: []u8, terrainNum: usize, db: ?*c.sqlite3) void {
    var it = std.mem.splitScalar(u8, line, ':');
    var index: i32 = 0;
    var hexLoc: struct { i32, i32 } = undefined;

    while (it.next()) |cut| {
        if (index == 0) {
            hexLoc = convert_to_hexLoc(cut);
        } else {
            it.reset();
            if (it.next()) |hexID|
                process_spines(cut, hexLoc, fname, terrainNum, db, hexID);
            return;
        }
        index += 1;
    }
}

fn convert_to_hexLoc(hexID: []const u8) struct { i32, i32 } {
    const number = std.fmt.parseInt(i32, hexID[1..], 10) catch 0;
    return .{ hexID[0] - ref_a, number };
}

fn process_spines(spines: []const u8, hexLoc: struct { i32, i32 }, fname: []const u8, terrainNum: usize, db: ?*c.sqlite3, hexID: []const u8) void {
    var spineAddr: struct { i32, i32, i32 } = undefined; // x, y, spine
    const hexMODtwo = @mod(hexLoc[0], 2);

    for (spines) |spine| {
        const spn = std.math.powi(i32, 2, (spine - ref_a)) catch 0;
        if (hexMODtwo >= 1) {
            spineAddr = get_uniq_hexAddr(hexLoc, spn);
            process_sql_statement(.{ spineAddr[0], spineAddr[1] }, fname, hexID, terrainNum, db, spineAddr[2]);
        } else process_sql_statement(hexLoc, fname, hexID, terrainNum, db, spn);
    }
}

fn get_uniq_hexAddr(hexLoc: struct { i32, i32 }, spn: i32) struct { i32, i32, i32 } {
    var sAddr: struct { i32, i32, i32 } = .{ hexLoc[0], hexLoc[1], spn };
    if (spn == 1) {
        sAddr[2] = 8;
        sAddr[0] -= 1;
        sAddr[1] -= 1;
    }
    if (spn == 2) {
        sAddr[2] = 16;
        sAddr[0] += 1;
        sAddr[1] -= 1;
    }
    if (spn == 4) {
        sAddr[2] = 32;
        sAddr[0] += 1;
    }
    if (spn == 8) {
        sAddr[0] -= 1;
    }
    if (spn == 16) {
        sAddr[2] = 2;
        sAddr[0] -= 1;
    }
    if (spn == 32) {
        sAddr[2] = 4;
        sAddr[0] -= 1;
        sAddr[1] -= 1;
    }

    return sAddr;
}

// fn terrainType_1(filename: []const u8) !void {
//     var buffer: [512]u8 = undefined;
//     var fba = std.heap.FixedBufferAllocator.init(&buffer);
//     const allocator = fba.allocator();
//
//     if (std.mem.findLast(u8, filename, "/")) |index| {
//         const statement = try std.fmt.allocPrint(
//             allocator,
//             "INSERT INTO map (filename, hexID, terrainName, terrainType) VALUES ()Hello, my name is {s} and I am {d} years old.",
//             .{ filename[index + 1 ..], index },
//         );
//
//         print("{s}\n", .{statement});
//     } else {
//         std.debug.print("Could not find '{s}'\n", .{filename});
//     }
// }
//
// fn terrainType_23() void {
//     print("2,3\n", .{});
// }

fn isEND(line: []u8) bool {
    if (std.mem.startsWith(u8, line, "END *"))
        return true;
    return false;
}

fn usageA() void {
    print("slurpMap filename\n", .{});
}

fn usageB() void {
    print("slurpMap 'file name'\n", .{});
}













