const std = @import("std");
const print = std.debug.print;

pub const Meta = struct {
    imgID: i32,

    pub fn init(imgID: i32) Meta {
        return Meta{
            .imgID = imgID,
        };
    }
};
