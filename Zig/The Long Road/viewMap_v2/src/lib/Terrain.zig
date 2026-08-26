pub const Hill = struct {
    x: i32,
    y: i32,
    h: i32, // height

    pub fn init(x: i32, y: i32, h: i32) Hill {
        // ======================================================
        return Hill{
            .x = x,
            .y = y,
            .h = h,
        };
    }
};
