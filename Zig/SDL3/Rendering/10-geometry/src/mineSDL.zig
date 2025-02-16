const std = @import("std");
const print = @import("std").debug.print;
const m = @import("main.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
});

pub fn AppIterate(renderer: *c.SDL_Renderer) !void {
    const now: f32 = @floatFromInt(c.SDL_GetTicks());

    // we'll have some textures move around over a few seconds.
    const direction = blk: {
        var val: f32 = -1.0;
        if (@mod(now, 2000) >= 1000) val = 1.0;
        break :blk val;
    };
    const scale = ((@mod(now, 1000) - 500.0) / 500.0) * direction;
    const size: f32 = (@as(f32, scale) * 200.0) + 200.0;

    var vertices: [4]c.SDL_Vertex = undefined;

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // Draw a single triangle with a different color at each vertex. Center this one and make it grow and shrink.
    // You always draw triangles with this, but you can string triangles together to form polygons.
    // SDL_zero(vertices);
    vertices[0].position.x = m.WINDOW_WIDTH / 2.0;
    vertices[0].position.y = (m.WINDOW_HEIGHT - size) / 2.0;
    vertices[0].color.r = 1.0;
    vertices[0].color.a = 1.0;
    vertices[1].position.x = (m.WINDOW_WIDTH + size) / 2.0;
    vertices[1].position.y = (m.WINDOW_HEIGHT + size) / 2.0;
    vertices[1].color.g = 1.0;
    vertices[1].color.a = 1.0;
    vertices[2].position.x = (m.WINDOW_WIDTH - size) / 2.0;
    vertices[2].position.y = (m.WINDOW_HEIGHT + size) / 2.0;
    vertices[1].color.b = 1.0;
    vertices[1].color.a = 1.0;
    _ = c.SDL_RenderGeometry(renderer, null, &vertices, 3, null, 0);

    // you can also map a texture to the geometry! Texture coordinates go from 0.0f to 1.0f. That will be the location
    // in the texture bound to this vertex.
    // SDL_zeroa(vertices);
    vertices[0].position.x = 10.0;
    vertices[0].position.y = 10.0;
    vertices[0].color.r = 1.0;
    vertices[0].color.g = 1.0;
    vertices[0].color.b = 1.0;
    vertices[0].color.a = 1.0;
    vertices[0].tex_coord.x = 0.0;
    vertices[0].tex_coord.y = 0.0;
    vertices[1].position.x = 150.0;
    vertices[1].position.y = 10.0;
    vertices[1].color.r = 1.0;
    vertices[1].color.g = 1.0;
    vertices[1].color.b = 1.0;
    vertices[1].color.a = 1.0;
    vertices[1].tex_coord.x = 1.0;
    vertices[1].tex_coord.y = 0.0;
    vertices[2].position.x = 10.0;
    vertices[2].position.y = 150.0;
    vertices[2].color.r = 1.0;
    vertices[2].color.g = 1.0;
    vertices[2].color.b = 1.0;
    vertices[2].color.a = 1.0;
    vertices[2].tex_coord.x = 0.0;
    vertices[2].tex_coord.y = 1.0;
    _ = c.SDL_RenderGeometry(renderer, m.texture, &vertices, 3, null, 0);

    // Did that only draw half of the texture? You can do multiple triangles sharing some vertices,
    // using indices, to get the whole thing on the screen:

    // Let's just move this over so it doesn't overlap...
    // for (i = 0; i < 3; i++) {
    for (0..3) |i| {
        vertices[i].position.x += 450;
    }

    // we need one more vertex, since the two triangles can share two of them.
    vertices[3].position.x = 600.0;
    vertices[3].position.y = 150.0;
    vertices[3].color.r = 1.0;
    vertices[0].color.g = 1.0;
    vertices[0].color.b = 1.0;
    vertices[0].color.a = 1.0;
    vertices[3].tex_coord.x = 1.0;
    vertices[3].tex_coord.y = 1.0;

    // And an index to tell it to reuse some of the vertices between triangles...
    {
        // 4 vertices, but 6 actual places they used. Indices need less bandwidth to transfer and can reorder vertices easily!
        // const int indices[] = { 0, 1, 2, 1, 2, 3 };
        const indices = [_]i32{ 0, 1, 2, 1, 2, 3 };
        _ = c.SDL_RenderGeometry(renderer, m.texture, &vertices, 4, &indices, indices.len);
    }

    _ = c.SDL_RenderPresent(renderer);
}
