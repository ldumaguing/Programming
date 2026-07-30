const rl = @import("raylib");
const c64_colors = [_]i64{ 0x000000FF, 0xFFFFFFFF, 0x813338FF, 0x75CEC8FF, 0x8E3C97FF, 0x56AC4DFF, 0x2E2C9BFF, 0xEDF171FF, 0x8E5029FF, 0x553800FF, 0xC46C71FF, 0x4A4A4AFF, 0x7B7B7BFF, 0xA9FF9FFF, 0x706DEBFF, 0xB2B2B2FF };

pub fn main() anyerror!void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(1); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    var count: u32 = 0;
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        rl.beginDrawing();
        defer rl.endDrawing();
        const foo: usize = c64_colors[@intCast(@mod(count, 16))]);
        // rl.clearBackground(rl.getColor(c64_colors[foo]));
        count += 1;

        //----------------------------------------------------------------------------------
    }
}
