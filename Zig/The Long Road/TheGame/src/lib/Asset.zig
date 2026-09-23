const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub const ImgID2index = struct {
    imgID: i32,

    pub fn init(imgID: i32) ImgID2index {
        return ImgID2index{
            .imgID = imgID,
        };
    }
};

pub const Combatant = struct {
    instanceID: i32,
    hex_x: i32,
    hex_y: i32,
    hex_z: i32,
    flag1: i32,
    id: i32, // Combatant ID
    currState: i32, // img ID
    imgIndex: i32,
    is_visible: bool,
    descrip: []const u8,
    // imagefile: [64]u8,
    // imagefile_len: i32,

    pub fn init(instanceID: i32, hex_x: i32, hex_y: i32, id: i32, currState: i32, c_str: []const u8) Combatant {
        return Combatant{
            .instanceID = instanceID,
            .hex_x = hex_x,
            .hex_y = hex_y,
            .hex_z = 0,
            .flag1 = 0,
            .id = id,
            .currState = currState,
            .imgIndex = 0,
            .is_visible = true,
            .descrip = c_str,
            // .imagefile = undefined,
            // .imagefile_len = 0,
        };
    }

    pub fn drawMe(self: Combatant, hex_width: f32, hex_height: f32, img: *std.ArrayList(rl.Texture)) void {
        if (!self.is_visible) return;

        const adjX: f32 = 79.0;
        const adjY: f32 = hex_height * 0.84;
        const adjYa: f32 = hex_height * 0.35;

        var X: f32 = @floatFromInt(self.hex_x);
        X = (X * hex_width) - adjX;
        var Y: f32 = @floatFromInt(self.hex_y);
        if (@mod(self.hex_x, 2) == 0) {
            Y = (Y * hex_height) - adjYa;
        } else {
            Y = (Y * hex_height) - adjY;
        }

        rl.drawTextureEx(img.items.ptr[@intCast(self.imgIndex)], rl.Vector2.init(X, Y), 0.0, 1.0, .white);
    }
};
