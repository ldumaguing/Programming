const std = @import("std");
const print = @import("std").debug.print;

const Texture = struct {
    img_w: i32,
    img_h: i32,

    fn foo1(self: Texture) void {
        _ = self;
        print("foo1\n", .{});
    }

    fn foo2(self: Texture) void {
        print("foo2 {}\n", .{self.img_w});
    }

    fn new(x: i32, y: i32) Texture {
        return Texture{
            .img_w = x,
            .img_h = y,
        };
    }

    fn loadFromFile(self: Texture, imgFile: []const u8) void {
        _ = self;
        print(">>> {s}\n", .{imgFile});
    }
};

pub fn main() !void {
    const textureFish = Texture.new(640, 480);
    print("({}, {})\n", .{ textureFish.img_w, textureFish.img_h });

    textureFish.loadFromFile("fish");
    textureFish.foo1();
    textureFish.foo2();
}
