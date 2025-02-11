const re = @cImport(@cInclude("regex.h"));

const std = @import("std");
const print = @import("std").debug.print;

const f = @cImport("./regez.h");

const REGEX_T_SIZEOF = re.sizeof_regex_t;
const REGEX_T_ALIGNOF = re.alignof_regex_t;

pub fn main() !void {
    const action_table = [27][7]i32{
        [_]i32{ 100, 101, 101, 99, 98, 73, 17 },
        [_]i32{ 100, 101, 99, 98, 97, 72, 16 },
        [_]i32{ 100, 101, 99, 98, 96, 71, 15 },
        [_]i32{ 100, 99, 98, 97, 95, 70, 14 },
        [_]i32{ 100, 99, 98, 96, 93, 68, 13 },
        [_]i32{ 100, 99, 98, 96, 92, 67, 12 },
        [_]i32{ 100, 99, 98, 95, 90, 65, 11 },
        [_]i32{ 100, 98, 96, 92, 86, 61, 10 },
        [_]i32{ 100, 98, 96, 91, 84, 59, 9 },
        [_]i32{ 100, 98, 96, 90, 82, 57, 8 },
        [_]i32{ 100, 98, 95, 88, 78, 55, 7 },
        [_]i32{ 100, 98, 95, 87, 77, 53, 6 },
        [_]i32{ 100, 98, 94, 85, 74, 51, 5 },
        [_]i32{ 100, 97, 92, 82, 70, 48, 4 },
        [_]i32{ 100, 97, 91, 80, 67, 46, 4 },
        [_]i32{ 100, 97, 90, 78, 54, 43, 3 },
        [_]i32{ 100, 97, 89, 76, 61, 41, 3 },
        [_]i32{ 100, 97, 88, 74, 57, 39, 3 },
        [_]i32{ 100, 96, 86, 71, 52, 36, 2 },
        [_]i32{ 100, 96, 85, 69, 48, 34, 2 },
        [_]i32{ 100, 96, 84, 67, 44, 32, 2 },
        [_]i32{ 100, 96, 83, 65, 40, 29, 2 },
        [_]i32{ 100, 95, 81, 62, 35, 25, 1 },
        [_]i32{ 100, 95, 80, 60, 31, 22, 1 },
        [_]i32{ 100, 95, 79, 58, 26, 19, 1 },
        [_]i32{ 100, 94, 77, 55, 21, 16, 1 },
        [_]i32{ 100, 93, 75, 50, 15, 12, 1 },
    };
    _ = action_table;

    const colors = [_][]const u8{ "Red", "Orange", "Yellow", "Green", "Blue", "White", "Black" };
    print("{s}\n", .{colors[3]});

    // zig fmt: off
    const ranks = [_][]const u8{
        "A", "B", "C",
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
        "12", "13", "14", "15", "16", "17", "18", "19", "20", "21",
        "X", "Y", "Z" };
    // zig fmt: on

    for (ranks) |rank| {
        print("{s}\n", .{rank});
    }

    // ****************
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const slice = try allocator.alignedAlloc(u8, REGEX_T_ALIGNOF, REGEX_T_SIZEOF);
    defer allocator.free(slice);
    const regext: [*]re.regex_t = @ptrCast(slice.ptr);

    var fish = re.regcomp(regext, "fish123", re.REG_EXTENDED | re.REG_ICASE);
    defer re.regfree(regext);
    print("1 - {}\n", .{fish});
    fish = re.regexec(regext, "fish123", 0, null, 0);
    print("2 - {}\n", .{fish});
}
