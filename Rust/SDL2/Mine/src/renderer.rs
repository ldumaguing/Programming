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

    // clip an image
    let src = Rect::new(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT);
    // stretch or shrink it
    let mut dest = Rect::new(0, 0, IMAGE_WIDTH / 2, IMAGE_HEIGHT / 2);
    // define a point to pivot on (usually center mass of the image)
    let center = Point::new(IMAGE_WIDTH as i32 / 2 / 2, IMAGE_HEIGHT as i32 / 2 / 2);
    // move the pivot point to the x,y coordination
    dest.center_on(Point::new(100, 100));

    let texture = texture_manager.load("img/space_ship.png")?;

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
