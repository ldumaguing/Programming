const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;
const asset = @import("Asset.zig");

var mousePos: rl.Vector2 = undefined;

pub fn list_Units_in_Hex(GameFlags: *u64, camera: rl.Camera2D, hex_width: f32, hex_height: f32, cmb: *std.ArrayList(asset.Combatant), cuih: *std.ArrayList(asset.Combatant), allocator: std.mem.Allocator) !void {
    if (GameFlags.* & (1 << 0) == 0) return; // bit 0: menu mode
    if (GameFlags.* & (1 << 1) != 0) return; // bit 1: append units in hex for show mode

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

    for (0..cmb.items.len) |i| {
        if (cmb.items.ptr[i].hex_x == X) {
            if (cmb.items.ptr[i].hex_y == Y) {
                if ((GameFlags.* & (1 << 1)) == 0) { // choose a hex with units
                    _ = try cuih.append(allocator, cmb.items.ptr[i]);
                }
            }
        }
    }

    // --------------------------------
    GameFlags.* |= (1 << 1); // bit 1: prevend to add again
    print("num units:{d}\n", .{cuih.items.len});
    if (cuih.items.len == 0) {
        GameFlags.* ^= (1 << 0);
        GameFlags.* ^= (1 << 1);
    }
}
