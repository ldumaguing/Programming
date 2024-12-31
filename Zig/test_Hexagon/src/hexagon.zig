// ***** hexagon.zig
const std = @import("std");
const mvzr = @import("mvzr.zig");
const String = @import("zig-string.zig").String;

const letter_A: u8 = 'A';

pub const Hexagon = struct {
    id: []const u8,
    x: i32,
    y: i32,
    z: i32,

    pub fn foo(self: Hexagon, hex: Hexagon) void {
        _ = self;
        std.debug.print("foo: {}\n", .{hex.x});
    }

    pub fn new_XYZ(x: i32, y: i32, z: i32) Hexagon {
        // // Use your favorite allocator
        var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        defer arena.deinit();

        // // Create your String
        var myString = String.init(arena.allocator());
        defer myString.deinit();
        myString.concat("123fXish123.334") catch undefined;

        std.debug.print("{s}\n", .{myString.str()});
        var buff: [32]u8 = undefined;
        _ = std.fmt.bufPrint(&buff, "{s}: {}", .{ myString.str(), myString.str().len }) catch undefined;
        const String_len = @as(usize, myString.str().len);
        buff[String_len] = 0;
        const slice = buff[0..String_len :0];

        return Hexagon{
            .id = slice,
            .x = x,
            .y = y,
            .z = z,
        };
    }

    pub fn new(id: []const u8, z: i32) Hexagon {
        var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        defer arena.deinit();
        std.debug.print("id: {s}\n", .{id});

        var X: i32 = 0;
        var Y: i32 = 0;
        var regex: mvzr.Regex = undefined;
        var match: mvzr.Match = undefined;

        regex = mvzr.compile("^[A-Z][A-Z]").?;
        if (regex.isMatch(id)) {
            match = regex.match(id).?;
            X = @as(i32, match.slice[0]) - letter_A + 26;
        } else {
            regex = mvzr.compile("^[A-Z]").?;
            if (regex.isMatch(id)) {
                match = regex.match(id).?;
                X = @as(i32, match.slice[0]) - letter_A;
            }
        }

        regex = mvzr.compile("[0-9]+").?;
        if (regex.isMatch(id)) {
            match = regex.match(id).?;
            Y = std.fmt.parseInt(i32, match.slice, 10) catch 0;
        }

        return Hexagon{
            .id = id,
            .x = X,
            .y = Y,
            .z = z,
        };
    }
};
