const print = @import("std").debug.print;

pub fn main() void {
    // Comments in Zig start with "//" and end at the next LF byte (end of line).
    // The line below is a comment and won't be executed.

    //print("Hello?", .{});

    print("Hello, world!\n", .{}); // another comment
    print("{u}\n", .{'⚡'});
    print("{d}\n", .{'⚡'});
    print("{u}\n", .{9889});
    print("{u}\n", .{"\x64"});
    print("{u}\n", .{65});


}
