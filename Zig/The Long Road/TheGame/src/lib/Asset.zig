const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub fn draw_units_in_hex(len: usize, uih: *std.ArrayList(Combatant), img: *std.ArrayList(rl.Texture), flags0_txu: rl.Texture2D) void {
    for (0..len) |i| {
        const reverse_i = len - 1 - i;
        var Y: i32 = @intCast(i);
        Y *= 160;
        rl.drawTexture(img.items.ptr[@intCast(uih.items.ptr[reverse_i].imgIndex)], 5, Y + 5, .white);

        if (uih.items.ptr[reverse_i].flag1 & (1 << 0) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 0 * 13, .width = 158, .height = 13 }, .{ .x = 5, .y = @as(f32, @floatFromInt(Y)) + 5.0 }, .white);
        if (uih.items.ptr[reverse_i].flag1 & (1 << 1) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 1 * 13, .width = 158, .height = 13 }, .{ .x = 5, .y = @as(f32, @floatFromInt(Y)) + 5.0 }, .white);
        if (uih.items.ptr[reverse_i].flag1 & (1 << 2) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 2 * 13, .width = 158, .height = 13 }, .{ .x = 5, .y = @as(f32, @floatFromInt(Y)) + 5.0 }, .white);
        if (uih.items.ptr[reverse_i].flag1 & (1 << 3) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 3 * 13, .width = 158, .height = 13 }, .{ .x = 5, .y = @as(f32, @floatFromInt(Y)) + 5.0 }, .white);
        if (uih.items.ptr[reverse_i].flag1 & (1 << 4) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 4 * 13, .width = 158, .height = 13 }, .{ .x = 5, .y = @as(f32, @floatFromInt(Y)) + 5.0 }, .white);
        if (uih.items.ptr[reverse_i].flag1 & (1 << 5) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 5 * 13, .width = 158, .height = 13 }, .{ .x = 5, .y = @as(f32, @floatFromInt(Y)) + 5.0 }, .white);
        if (uih.items.ptr[reverse_i].flag1 & (1 << 6) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 6 * 13, .width = 158, .height = 13 }, .{ .x = 5, .y = @as(f32, @floatFromInt(Y)) + 5.0 }, .white);
    }
}

// ********************************************************************************************************************
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
    stack_lvl: i32,

    pub fn init(instanceID: i32, hex_x: i32, hex_y: i32, id: i32, currState: i32, descrip: []const u8, stack_lvl: i32) Combatant {
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
            .descrip = descrip,
            .stack_lvl = stack_lvl,
        };
    }

    pub fn drawMe(self: Combatant, hex_width: f32, hex_height: f32, img: *std.ArrayList(rl.Texture), flags0_txu: rl.Texture2D) void {
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

        const aF32: f32 = @floatFromInt(self.stack_lvl);
        X += (aF32 * 8.0);
        Y -= (aF32 * 8.0);

        rl.drawTextureEx(img.items.ptr[@intCast(self.imgIndex)], rl.Vector2.init(X, Y), 0.0, 1.0, .white);

        if (self.flag1 & (1 << 0) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 0 * 13, .width = 158, .height = 13 }, .{ .x = X, .y = Y }, .white);
        if (self.flag1 & (1 << 1) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 1 * 13, .width = 158, .height = 13 }, .{ .x = X, .y = Y }, .white);
        if (self.flag1 & (1 << 2) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 2 * 13, .width = 158, .height = 13 }, .{ .x = X, .y = Y }, .white);
        if (self.flag1 & (1 << 3) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 3 * 13, .width = 158, .height = 13 }, .{ .x = X, .y = Y }, .white);
        if (self.flag1 & (1 << 4) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 4 * 13, .width = 158, .height = 13 }, .{ .x = X, .y = Y }, .white);
        if (self.flag1 & (1 << 5) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 5 * 13, .width = 158, .height = 13 }, .{ .x = X, .y = Y }, .white);
        if (self.flag1 & (1 << 6) != 0) rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 6 * 13, .width = 158, .height = 13 }, .{ .x = X, .y = Y }, .white);
    }
};
