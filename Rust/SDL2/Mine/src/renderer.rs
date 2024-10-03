use sdl2::pixels::Color;
use sdl2::render::{TextureCreator, WindowCanvas};
use sdl2::video::WindowContext;

use sdl2::rect::Point;
use sdl2::rect::Rect;

use sdl2::gfx::primitives::DrawRenderer;

use crate::texture_manager;

const IMAGE_WIDTH: u32 = 100;
const IMAGE_HEIGHT: u32 = 100;

pub fn render(
    canvas: &mut WindowCanvas,
    texture_manager: &mut texture_manager::TextureManager<WindowContext>,
    _texture_creator: &TextureCreator<WindowContext>,
    _font: &sdl2::ttf::Font,
    counter: &mut i64,
) -> Result<(), String> {
    //
    let color = Color::RGB(0, 0, 0);
    canvas.set_draw_color(color);
    //canvas.clear();

    // ******************************************* Sprite placement
    // ***** using center_on() function
    let src = Rect::new(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT); // define sprite

    let mut dest = Rect::new(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT); // stretch/shrink sprite.
    dest.center_on(Point::new(100, 100)); // x,y screen location. Modifies dest.
    let center = Point::new(50, 50); // should be center of sprite.

    let texture = texture_manager.load("img/space_ship.png")?;
    // *******************************************

    *counter += 5;
    if *counter >= 360 {
        *counter = 0;
    }
    canvas.copy_ex(
        &texture,        // Texture object
        src,             // source rect
        dest,            // destination rect
        *counter as f64, // angle (degrees)
        center,          // center
        false,           // flip horizontal
        false,           // flip vertical
    )?;

    let color = Color::RGB(255, 0, 255);
    let _ = canvas.line(0, 0, 100, 100, color);

    canvas.present();
    Ok(())
}
