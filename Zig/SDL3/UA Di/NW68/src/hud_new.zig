const std = @import("std");
const gv = @import("GlobalVariables.zig");
const print = @import("std").debug.print;
//const m = @import("main.zig");
const jstk = @import("joystick.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn newGame() void {
    print("New Game...............\n", .{});
    // [ newGame loop =========================================================================== ]
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
        print("...{d}\n", .{jstk.button_bits});
    } // main_loop
    print("back...............\n", .{});
}
