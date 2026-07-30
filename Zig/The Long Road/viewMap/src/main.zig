const rl = @import("raylib");
// const c64_colors = [_]i64{ 0x000000FF, 0xFFFFFFFF, 0x813338FF, 0x75CEC8FF, 0x8E3C97FF, 0x56AC4DFF, 0x2E2C9BFF, 0xEDF171FF, 0x8E5029FF, 0x553800FF, 0xC46C71FF, 0x4A4A4AFF, 0x7B7B7BFF, 0xA9FF9FFF, 0x706DEBFF, 0xB2B2B2FF };

const c64_colors = [_]rl.Color{
    rl.Color.init(0x00, 0x00, 0x00, 0xFF), // Black
    rl.Color.init(0xFF, 0xFF, 0xFF, 0xFF), // White
    rl.Color.init(0x81, 0x33, 0x38, 0xFF), // Red
    rl.Color.init(0x75, 0xCE, 0xC8, 0xFF), // Cyan
    rl.Color.init(0x8E, 0x3C, 0x97, 0xFF), // Purple
    rl.Color.init(0x56, 0xAC, 0x4D, 0xFF), // Green
    rl.Color.init(0x2E, 0x2C, 0x9B, 0xFF), // Blue
    rl.Color.init(0xED, 0xF1, 0x71, 0xFF), // Yellow
    rl.Color.init(0x8E, 0x50, 0x29, 0xFF), // Orange
    rl.Color.init(0x55, 0x38, 0x00, 0xFF), // Brown
    rl.Color.init(0xC4, 0x6C, 0x71, 0xFF), // Light Red
    rl.Color.init(0x4A, 0x4A, 0x4A, 0xFF), // Dark Grey
    rl.Color.init(0x7B, 0x7B, 0x7B, 0xFF), // Grey
    rl.Color.init(0xA9, 0xFF, 0x9F, 0xFF), // Light Green
    rl.Color.init(0x70, 0x6D, 0xEB, 0xFF), // Light Blue
    rl.Color.init(0xB2, 0xB2, 0xB2, 0xFF), // Light Grey
};

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
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        rl.beginDrawing();
        defer rl.endDrawing();

        // rl.clearBackground(rl.getColor(c64_colors[foo]));
        rl.clearBackground(.white);
        rl.drawCircle(10, 10, 10, c64_colors[0]);
        rl.drawCircle(10, 30, 10, c64_colors[1]);
        rl.drawCircle(10, 50, 10, c64_colors[2]);
        rl.drawCircle(10, 70, 10, c64_colors[3]);
        rl.drawCircle(10, 90, 10, c64_colors[4]);
        rl.drawCircle(10, 110, 10, c64_colors[5]);
        rl.drawCircle(10, 130, 10, c64_colors[6]);
        rl.drawCircle(10, 150, 10, c64_colors[7]);
        rl.drawCircle(10, 170, 10, c64_colors[8]);
        rl.drawCircle(10, 190, 10, c64_colors[9]);
        rl.drawCircle(10, 210, 10, c64_colors[10]);
        rl.drawCircle(10, 230, 10, c64_colors[11]);
        rl.drawCircle(10, 250, 10, c64_colors[12]);
        rl.drawCircle(10, 270, 10, c64_colors[13]);
        rl.drawCircle(10, 290, 10, c64_colors[14]);
        rl.drawCircle(10, 310, 10, c64_colors[15]);

        //----------------------------------------------------------------------------------
    }
}
