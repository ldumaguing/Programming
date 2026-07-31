const rl = @import("raylib");

const c64_colors = [_]rl.Color{
    rl.Color.init(0x00, 0x00, 0x00, 0xFF), // Black
    rl.Color.init(0xFF, 0xFF, 0xFF, 0xFF), // White
    rl.Color.init(0xFF, 0x00, 0x00, 0xFF), // Red
    rl.Color.init(0x00, 0xFF, 0xFF, 0xFF), // Cyan
    rl.Color.init(0x8F, 0x00, 0xBF, 0xFF), // Purple
    rl.Color.init(0x00, 0xB3, 0x00, 0xFF), // Green
    rl.Color.init(0x00, 0x00, 0x99, 0xFF), // Blue
    rl.Color.init(0xFF, 0xFF, 0x00, 0xFF), // Yellow
    rl.Color.init(0xEC, 0x74, 0x08, 0xFF), // Orange
    rl.Color.init(0x67, 0x52, 0x00, 0xFF), // Brown
    rl.Color.init(0xFF, 0x4F, 0x4F, 0xFF), // Light Red
    rl.Color.init(0x40, 0x40, 0x40, 0xFF), // Dark Grey
    rl.Color.init(0x80, 0x80, 0x80, 0xFF), // Grey
    rl.Color.init(0x4D, 0xFF, 0x4D, 0xFF), // Light Green
    rl.Color.init(0x33, 0x33, 0xFF, 0xFF), // Light Blue
    rl.Color.init(0xBF, 0xBF, 0xBF, 0xFF), // Light Grey
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
