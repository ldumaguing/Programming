use sdl2::pixels::Color;
use sdl2::render::{TextureCreator, WindowCanvas};
use sdl2::video::WindowContext;

use sdl2::rect::Point;
use sdl2::rect::Rect;

use crate::texture_manager;

const IMAGE_WIDTH: u32 = 100;
const IMAGE_HEIGHT: u32 = 100;
const OUTPUT_WIDTH: u32 = 50;
const OUTPUT_HEIGHT: u32 = 50;
const SCREEN_WIDTH: i32 = 1366;
const SCREEN_HEIGHT: i32 = 768;

pub fn render(
    canvas: &mut WindowCanvas,
    texture_manager: &mut texture_manager::TextureManager<WindowContext>,
    _texture_creator: &TextureCreator<WindowContext>,
    _font: &sdl2::ttf::Font,
    counter: &mut i64,
) -> Result<(), String> {
    //
    let color = Color::RGB(150, 50, 150);
    canvas.set_draw_color(color);
    canvas.clear();

    // Draw Space Ship
    let src = Rect::new(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT);
    let x: i32 = (SCREEN_WIDTH / 2) as i32;
    let y: i32 = (SCREEN_HEIGHT / 2) as i32;

    let dest = Rect::new(
        x - ((OUTPUT_WIDTH / 2) as i32),
        y - ((OUTPUT_HEIGHT / 2) as i32),
        OUTPUT_WIDTH,
        OUTPUT_HEIGHT,
    );
    let center = Point::new((OUTPUT_WIDTH / 2) as i32, (OUTPUT_HEIGHT) as i32);

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

    canvas.present();
    Ok(())
}
