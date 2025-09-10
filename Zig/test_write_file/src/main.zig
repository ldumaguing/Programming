const std = @import("std");

pub fn main() !void {
    // Define the file path
    const file_path = "output.txt";

    // Create or open the file for writing.
    // The .{ .read = true } option is used here to allow reading later if needed.
    // If you only need to write, you can omit it or use .{}.
    var file = try std.fs.cwd().createFile(
        file_path,
        .{ .read = true },
    );
    defer file.close(); // Ensure the file is closed when the function exits

    // The data to write
    const data_to_write = "\x43\x36\x34\x46\x69\x6c\x65\x00\x48\x4f\x53\x54\x20\x46\x4c\x41\x47\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x0a";

    // Write the data to the file
    try file.writeAll(data_to_write);

    std.debug.print("Successfully wrote to '{s}'\n", .{file_path});
}
