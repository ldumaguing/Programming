const std =  @import("std");
const print_stdio =  @import("std").Io.File.stdout();

pub fn main(init: std.process.Init) !void {
    try print_stdio.writeStreamingAll(init.io, "stdio: Hello, World! (can't do format)\n");

    std.log.info("log.info: Achtung, {s}!\n", .{"World"});
}


