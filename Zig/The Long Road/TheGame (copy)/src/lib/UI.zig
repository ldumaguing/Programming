const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;
const asset = @import("Asset.zig");

var mousePos: rl.Vector2 = undefined;

pub fn mode_1(GameFlags: *u64, camera: rl.Camera2D, hex_width: f32, hex_height: f32, cmb: *std.ArrayList(asset.Combatant), cuih: *std.ArrayList(asset.Combatant), allocator: std.mem.Allocator) !void {
    print("yo: {d}\n", .{GameFlags.*});

    const screenMousePos = rl.getMousePosition();
    const worldMousePos = rl.getScreenToWorld2D(screenMousePos, camera);
    mousePos = screenMousePos;

    var mouseX = worldMousePos.x - 101.0;
    mouseX /= hex_width;

    const X: i32 = @ceil(mouseX);
    var Y: i32 = 0;

    if (@mod(X, 2) == 0) {
        var mouseY = worldMousePos.y - 116.79166;
        mouseY /= hex_height;
        Y = @ceil(mouseY);
    } else {
        var mouseY = worldMousePos.y;
        mouseY /= hex_height;
        Y = @ceil(mouseY);
    }

    //print("{d},{d}\n\n", .{ X, Y });
    //GameFlags_prev.* = GameFlags.*;
    GameFlags.* ^= (1 << 0);

    for (0..cmb.items.len) |i| {
        if (cmb.items.ptr[i].hex_x == X) {
            if (cmb.items.ptr[i].hex_y == Y) {
                if ((GameFlags.* & (1 << 1)) == 0) { // choose a hex with units
                    print("{d},{d}: {s}\n", .{ cmb.items.ptr[i].hex_x, cmb.items.ptr[i].hex_y, cmb.items.ptr[i].descrip });
                    GameFlags.* ^= (1 << 1);

                    _ = try cuih.append(allocator, cmb.items.ptr[i]);
                    break;
                }
            }
        }
    }
    print("no units\n", .{});
}
