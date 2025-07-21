const std = @import("std");
const gv = @import("GlobalVariables.zig");
const print = @import("std").debug.print;
const m = @import("main.zig");
const jstk = @import("joystick.zig");
const hud_0 = @import("HUD.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

var menu_option: i32 = 0;
var menu_option_old: i32 = -1;
var d_pad_old: u16 = 0;

pub fn newGame() void {
    var FLG_render_texture: bool = true;

    jstk.d_pad = d_pad_old;

    main_loop: while (true) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                // [ Key down =================================================================== ]
                c.SDL_EVENT_KEY_DOWN => {
                    switch (event.key.scancode) {
                        c.SDL_SCANCODE_ESCAPE => {
                            break :main_loop;
                        },
                        else => {},
                    }
                },
                else => {},
            }
        }
        jstk.record_events();

        // ********** D-Pad
        if (jstk.d_pad == 1) {
            if (jstk.d_pad != d_pad_old) {
                menu_option -= 1;
                d_pad_old = 1;
                FLG_render_texture = true;
            }
        }
        if (jstk.d_pad == 4) {
            if (jstk.d_pad != d_pad_old) {
                menu_option += 1;
                d_pad_old = 4;
                FLG_render_texture = true;
            }
        }

        // ********** Choosing a scenario
        if (menu_option < 0) menu_option += 15;
        if (menu_option >= 15) menu_option = 0;
        if (jstk.d_pad == 0) d_pad_old = 0;

        // ********** Rendering
        if (FLG_render_texture) {
            _ = c.SDL_RenderTexture(@ptrCast(m.renderer), @ptrCast(hud_0.HUD_texture), null, @ptrCast(&hud_0.frame_viewportness));

            _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), @ptrCast(&hud_0.scaled_viewport));
            _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), hud_0.scale, hud_0.scale);
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 10), "        Play Scenario");

            _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), @ptrCast(&hud_0.mesa_viewport));
            _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), 1.0, hud_0.scale);
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 11), "         Scenario I,    Day 8:  Prodigal Sons");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 12), "         Scenario II,   Day 13: Rangers Lead The Way");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 13), "         Scenario III,  Day 15: Lifeline");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 14), "         Scenario IV,   Day 18: Omega");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 15), "         Scenario V,    Day 22: Empty Quiver");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 16), "         Scenario VI,   Day 36: Flytrap");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 17), "         Scenario VII,  Day 37: An Eye For An Eye");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 18), "         Scenario VIII, Day 38: Cloak And Dagger");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 19), "         Scenario IX,   Day 45: Parsifal");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 20), "         Scenario X,    Day 46: Cassino Redux");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 21), "         Scenario XI,   Day 58: Licence To Kill");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 22), "         Scenario XII,  Day 64: Reversed Knee");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 23), "         Scenario XIII, Day 79: Masquerade");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 24), "         Scenario XIV,  Day 86: Deal With The Devil");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 25), "         Scenario XV,   Day 88: Endsieg");
            var Y: f32 = @floatFromInt(menu_option);
            Y += 11.0;
            Y *= 8.0;
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, Y, "      *");

            _ = c.SDL_RenderPresent(@ptrCast(m.renderer));

            FLG_render_texture = false;

            // ********** back to normal
            _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), null);
            _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), 1.0, 1.0);
        }

        if ((jstk.button_bits & gv.bit_3) != 0) { // Button Right; back menu
            break :main_loop;
        }
    }
}
