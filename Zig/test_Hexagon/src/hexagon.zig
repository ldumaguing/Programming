// ***** hexagon.zig
const std = @import("std");
const mvzr = @import("mvzr.zig");
// const String = @import("zig-string.zig").String;

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

    pub fn new(id: []const u8, z: i32) Hexagon {
        var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        defer arena.deinit();
        std.debug.print("id: {s}\n", .{id});

        var X: i32 = 0;
        const regex3: mvzr.Regex = mvzr.compile("^[A-Z][A-Z]").?;
        if (regex3.isMatch(id)) {
            const match: mvzr.Match = regex3.match(id).?;
            X = @as(i32, match.slice[0]) - letter_A + 26;
        } else {
            const regex1: mvzr.Regex = mvzr.compile("^[A-Z]").?;
            if (regex1.isMatch(id)) {
                const match: mvzr.Match = regex1.match(id).?;
                X = @as(i32, match.slice[0]) - letter_A;
            }
        }

        var Y: i32 = 0;
        const regex2: mvzr.Regex = mvzr.compile("[0-9]+").?;
        if (regex2.isMatch(id)) {
            const match: mvzr.Match = regex2.match(id).?;
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
