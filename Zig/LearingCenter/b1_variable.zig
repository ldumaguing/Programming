const std = @import("std");
const print = std.debug.print;

// 1. Define the struct with a string field
const User = struct {
    username: []const u8, // Strings are slices of constant u8 bytes
    id: u32,
};

pub fn main() void {
    // 2. Initialize the struct (variable must be 'var' to mutate fields later)
    var user1 = User{
        .username = "Alice", // String literal assigned at initialization
        .id = 1,
    };

    print("Initial username: {s}\n", .{user1.username});

    // 3. Assign a new string to the struct variable at runtime
    user1.username = "Bob";

    print("Updated username: {s}\n", .{user1.username});
}
