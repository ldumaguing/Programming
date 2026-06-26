const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;

pub fn main() !void {
    var buffer: [100]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();

    print("--{s}\n\n", .{buffer});

    const a1 = try concat(allocator, "foo", "bar");
    print("{s}\n--{s}\n\n", .{ a1, buffer });

    const b1 = try concat(allocator, a1, "123");
    print("{s}\n--{s}\n\n", .{ b1, buffer });

    const c1 = try concat(allocator, "", "456");
    print("{s}\n--{s}\n\n", .{ c1, buffer });

    @memcpy(buffer[0..5], ".....");
    print("--{s}\n\n", .{buffer});

    const d1 = try concat(allocator, "ABC", "DEF");
    print("{s}\n--{s}\n\n", .{ d1, buffer });

    buffer = undefined;
    const e1 = try concat(allocator, "GHI", "JKL");
    print("{s}\n--{s}\n\n", .{ e1, buffer });

    fba = std.heap.FixedBufferAllocator.init(&buffer);
    const f1 = try concat(allocator, "MNO", "PQR");
    print("{s}\n--{s}\n\n", .{ f1, buffer });

    buffer = undefined;
    fba = std.heap.FixedBufferAllocator.init(&buffer);
    const g1 = try concat(allocator, "STU", "VWX");
    print("{s}\n--{s}\n\n", .{ g1, buffer });
}

fn concat(allocator: Allocator, a: []const u8, b: []const u8) ![]u8 {
    const result = try allocator.alloc(u8, a.len + b.len);
    @memcpy(result[0..a.len], a);
    @memcpy(result[a.len..], b);
    return result;
}
