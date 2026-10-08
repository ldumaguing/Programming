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

    // ******************************************************************
    // Load file bytes
    var file_data = try Io.Dir.readFileAlloc(
        std.Io.Dir.cwd(),
        io,
        "TLR/DB-Raging Spirits.png",
        allocator,
        .unlimited,
    );
    defer allocator.free(file_data);

    print("1: {d},{d}\n", .{ file_data.len, arena.queryCapacity() });

    var image = try rl.loadImageFromMemory(".png", file_data);
    //defer rl.unloadImage(image);

    const texture = try rl.loadTextureFromImage(image);
    defer rl.unloadTexture(texture);

    // ******************************************************************
    file_data = try Io.Dir.readFileAlloc( // reusing
        std.Io.Dir.cwd(),
        io,
        "TLR/Whitman.png",
        allocator,
        .unlimited,
    );

    image = try rl.loadImageFromMemory(".png", file_data);
    //defer rl.unloadImage(image);

    const texture1 = try rl.loadTextureFromImage(image);
    defer rl.unloadTexture(texture1);

    print("2: {d},{d}\n", .{ file_data.len, arena.queryCapacity() });

    // ******************************************************************
    file_data = try Io.Dir.readFileAlloc( // reusing
        std.Io.Dir.cwd(),
        io,
        "TLR/DB-Zoranov-B.png",
        allocator,
        .unlimited,
    );

    image = try rl.loadImageFromMemory(".png", file_data);
    //defer rl.unloadImage(image);

    const texture2 = try rl.loadTextureFromImage(image);
    defer rl.unloadTexture(texture2);

    print("3: {d},{d}\n", .{ file_data.len, arena.queryCapacity() });

    rl.unloadImage(image);

    // **********
    rl.setTargetFPS(60);
    var count: i32 = 0;
    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
        rl.clearBackground(.gray);
        rl.drawTexture(texture, count, 100, .white);
        rl.drawTexture(texture1, 200, 100, .white);
        rl.drawTexture(texture2, 300, 100, .white);
        if (count > 800) count = 0;
        count += 1;
    }
}
