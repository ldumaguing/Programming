use sdl2::pixels::Color;
use sdl2::render::{TextureCreator, WindowCanvas};
use sdl2::video::WindowContext;

use sdl2::rect::Point;
use sdl2::rect::Rect;

use crate::texture_manager;
use crate::GlobalVariables;

pub fn render(
    canvas: &mut WindowCanvas,
    texture_manager: &mut texture_manager::TextureManager<WindowContext>,
    _texture_creator: &TextureCreator<WindowContext>,
    _gv: &mut GlobalVariables,
) -> Result<(), String> {
    let color = Color::RGB(255, 0, 255);
    canvas.set_draw_color(color);
    canvas.clear();

    let texture = texture_manager.load("images/Map.jpg")?;
    canvas.copy(
        &texture,
        Rect::new(0, 0, 400, 400),
        Rect::new(100, 100, 400, 400),
    )?;

    canvas.present();
    Ok(())
}
