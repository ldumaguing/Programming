const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub const Card = struct {
    pxX: i32,
    pxY: i32,
    texture: rl.Texture,

    // ********************************************************************************************
    pub fn init(pxX: i32, pxY: i32, fname: []const u8) !Card {
        var buff: [60]u8 = undefined;
        const filename = try std.fmt.bufPrintZ(&buff, "{s}", .{fname});
        const texture = try rl.loadTexture(filename);

        return Card{
            .pxX = pxX,
            .pxY = pxY,
            .texture = texture,
        };
    }
};







// const new_slice = try std.fmt.allocPrintZ(allocator, "{s}", .{old_slice});






