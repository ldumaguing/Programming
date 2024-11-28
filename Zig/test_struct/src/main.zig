const std = @import("std");
const print = @import("std").debug.print;

const Texture = struct {
    name: []const u8,
    img_w: i32,
    img_h: i32,

    fn new(x: i32, y: i32, name: []const u8) Texture { // note: no self attribute
        return Texture{
            .name = name,
            .img_w = x,
            .img_h = y,
        };
    }

    fn foo1(self: Texture) void {
        _ = self;
        print("foo1\n", .{});
    }

    fn foo2(self: Texture) void {
        print("foo2 {}\n", .{self.img_w});
    }

    fn foo3(self: Texture) void {
        print("foo3 {s}\n", .{self.name});
    }

    fn loadFromFile(self: Texture, imgFile: []const u8) void {
        _ = self;
        print(">>> {s}\n", .{imgFile});
    }
};

pub fn main() !void {
    const textureFish = Texture.new(640, 480, "blablabla");
    print("({}, {})\n", .{ textureFish.img_w, textureFish.img_h });

    textureFish.loadFromFile("fish");
    textureFish.foo1();
    textureFish.foo2();
    textureFish.foo3();
}
