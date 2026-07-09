const std = @import("std");
const print = std.debug.print;

const terrains = [_][]const u8{ "", "BRIDGE", "CITY", "CULTIVATED", "FOREST", "HILL", "HILL2", "LAKE", "RIVER", "ROAD", "ROLLING", "TOWN", "TUNNEL ROAD" };
// terrainType
//    1: whole hexagon
//    2: spine location
//    3: road, path, etc.  The spines are exits from starting hexagon
const terrainTypes = [_]i32{ 0, 2, 1, 1, 1, 1, 1, 1, 2, 3, 1, 1, 3 };
const ref_a = 'a';

pub fn main(init: std.process.Init) !void {
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
    var file_buffer: [200]u8 = undefined;
    var reader = file.reader(io, &file_buffer);
    var terrainType: usize = 0;
    while (try reader.interface.takeDelimiter('\n')) |line| {
        if (isEND(line)) break;
        if (line.len == 0) terrainType = 0;
        if (std.mem.startsWith(u8, line, "BRIDGE ")) {
            terrainType = 1;
            continue;
        }
        if (std.mem.startsWith(u8, line, "CITY ")) {
            terrainType = 2;
            continue;
        }
        if (std.mem.startsWith(u8, line, "CULTIVATED ")) {
            terrainType = 3;
            continue;
        }
        if (std.mem.startsWith(u8, line, "FOREST ")) {
            terrainType = 4;
            continue;
        }
        if (std.mem.startsWith(u8, line, "HILL ")) {
            terrainType = 5;
            continue;
        }
        if (std.mem.startsWith(u8, line, "HILL2 ")) {
            terrainType = 6;
            continue;
        }
        if (std.mem.startsWith(u8, line, "LAKE ")) {
            terrainType = 7;
            continue;
        }
        if (std.mem.startsWith(u8, line, "RIVER ")) {
            terrainType = 8;
            continue;
        }
        if (std.mem.startsWith(u8, line, "ROAD ")) {
            terrainType = 9;
            continue;
        }
        if (std.mem.startsWith(u8, line, "ROLLING ")) {
            terrainType = 10;
            continue;
        }
        if (std.mem.startsWith(u8, line, "TOWN ")) {
            terrainType = 11;
            continue;
        }
        if (std.mem.startsWith(u8, line, "TUNNEL ROAD ")) {
            terrainType = 12;
            continue;
        }

        if (terrainType > 0) try saveTerrain(terrainType, args[1], line);
    }
}

// ************************************************************************************************
fn saveTerrain(terrainType: usize, filename: []const u8, line: []u8) !void {
    print("{s}, {s}, {d}\n", .{ terrains[terrainType], filename, terrainType });
    print("{d}, >{s}<\n", .{ terrainTypes[terrainType], line });
    if (terrainTypes[terrainType] == 1) try terrain_1(filename, line) else terrain_2n3();
}

fn terrain_1(filename: []const u8, line: []u8) !void {
    var buffer: [512]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();

    // ********** define fname
    var fname: []u8 = undefined;
    if (std.mem.findLast(u8, filename, "/")) |index| {
        fname = try std.fmt.allocPrint(
            allocator,
            "{s}",
            .{filename[index + 1 ..]},
        );
    }
    print("{s}\n", .{fname});

    // ********** slice string
    var it = std.mem.splitScalar(u8, line, ',');
    while (it.next()) |hexID| {
        const hexLoc = convert_to_hexLoc(hexID);
        print("--> {d},{d}\n", .{ hexLoc[0], hexLoc[1] });
    }
}

fn terrain_2n3() void {
    print("brah\n", .{});
}

fn convert_to_hexLoc(hexID: []const u8) struct { i32, i32 } {
    const number = std.fmt.parseInt(i32, hexID[1..], 10) catch 0;
    return .{ hexID[0] - ref_a, number };
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
    if (std.mem.startsWith(u8, line, "END "))
        return true;
    return false;
}

fn usageA() void {
    print("defineMap filename\n", .{});
}

fn usageB() void {
    print("defineMap 'file name'\n", .{});
}
