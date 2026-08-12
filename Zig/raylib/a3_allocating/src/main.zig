const std = @import("std");
const print = std.debug.print;
const rl = @import("raylib");

const Io = std.Io;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    rl.initWindow(800, 450, "Load Image From Memory");
    defer rl.closeWindow();

    // Load file bytes
    const file_data = try Io.Dir.readFileAlloc(
        std.Io.Dir.cwd(),
        io,
        "TLR/cup.png",
        allocator,
        .unlimited,
    );
    defer allocator.free(file_data);

    print("{d}\n", .{file_data.len});

    const image = try rl.loadImageFromMemory(".png", file_data);
    defer rl.unloadImage(image);

    const texture = try rl.loadTextureFromImage(image);
    defer rl.unloadTexture(texture);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
        rl.clearBackground(.white);
        rl.drawTexture(texture, 100, 100, .white);
    }
}
