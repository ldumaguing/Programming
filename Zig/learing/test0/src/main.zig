const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;

pub fn main() !void {
    var buffer: [100]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();

    const a1 = try concat(allocator, "foo", "bar");
    print("{s}--{s}\n", .{ a1, buffer });
    print("\n", .{});
    const b1 = try concat(allocator, a1, "123");
    print("{s}--{s}\n", .{ b1, buffer });
    print("\n", .{});
    const c1 = try concat(allocator, "", "456");
    print("{s}--{s}\n", .{ c1, buffer });
    print("\n", .{});
    @memcpy(buffer[0..5], ".....");
    print("{s}\n", .{ buffer });

}

fn concat(allocator: Allocator, a: []const u8, b: []const u8) ![]u8 {
    const result = try allocator.alloc(u8, a.len + b.len);
    @memcpy(result[0..a.len], a);
    @memcpy(result[a.len..], b);
    return result;
}
