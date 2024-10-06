use sdl2::pixels::Color;
use sdl2::render::{TextureCreator, WindowCanvas};
use sdl2::video::WindowContext;

use sdl2::rect::Point;
use sdl2::rect::Rect;

use specs::{Join, World, WorldExt};

use crate::components;
use crate::texture_manager;

pub fn render(
    canvas: &mut WindowCanvas,
    texture_manager: &mut texture_manager::TextureManager<WindowContext>,
    _texture_creator: &TextureCreator<WindowContext>,
    _font: &sdl2::ttf::Font,
    ecs: &World,
) -> Result<(), String> {
    //
    let color = Color::RGB(0, 0, 0);
    canvas.set_draw_color(color);
    canvas.clear();

    let positions = ecs.read_storage::<components::Position>();
    let renderables = ecs.read_storage::<components::Renderable>();

    for (renderable, pos) in (&renderables, &positions).join() {
        let src = Rect::new(0, 0, renderable.i_w, renderable.i_h);
        let x: i32 = pos.x as i32;
        let y: i32 = pos.y as i32;
        let dest = Rect::new(
            x - ((renderable.o_w / 2) as i32),
            y - ((renderable.o_h / 2) as i32),
            renderable.o_w,
            renderable.o_h,
        );

        let center = Point::new((renderable.o_w / 2) as i32, (renderable.o_h / 2) as i32);
        let texture = texture_manager.load(&renderable.tex_name)?;
        canvas.copy_ex(
            &texture, src,     //source rect
            dest,    // dest rect
            pos.rot, // angle
            center,  // center
            false,   // flip horizontal
            false,   // flip vertical
        )?;
    }

    canvas.present();
    Ok(())
}
