const std = @import("std");
const print = std.debug.print;

const terrains = [_][]const u8{ "", "BRIDGE", "CITY", "CULTIVATED", "FOREST", "HILL", "HILL2", "LAKE", "RIVER", "ROAD", "ROLLING", "TOWN", "TUNNEL ROAD" };
// terrainType
//    1: whole hexagon
//    2: spine location
//    3: road, path, etc.  The spines are exits from starting hexagon
const terrainTypes = []const i32{ 0, 2, 1, 1, 1, 1, 1, 1, 2, 3, 1, 1, 3 };

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

        if (terrainType > 0) saveTerrain(terrainType);
        // if (terrainType == 1) {
        //     try terrainType_1(args[1]);
        // } else if ((terrainType == 2) | (terrainType == 3)) {
        //     terrainType_23();
        // }
    }
}

// ************************************************************************************************
fn saveTerrain(terrainType: usize) void {
    print("{s}\n", .{terrains[terrainType]});
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
