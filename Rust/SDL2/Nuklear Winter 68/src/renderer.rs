// ***** renderer.rs
use sdl2::pixels::Color;
use sdl2::render::{TextureCreator, WindowCanvas};
use sdl2::video::WindowContext;

// use sdl2::rect::Point;
use sdl2::rect::Rect;

use crate::texture_manager;
use crate::GlobalVariables;
use crate::CHIT_SQR;
use crate::SCREEN_DIM;

pub fn render(
    canvas: &mut WindowCanvas,
    texture_manager: &mut texture_manager::TextureManager<WindowContext>,
    _texture_creator: &TextureCreator<WindowContext>,
    gv: &mut GlobalVariables,
    _joy: &u16,
) -> Result<(), String> {
    // Step 1: paint the canvas red
    let color = Color::RGB(255, 0, 0);
    canvas.set_draw_color(color);
    canvas.clear();

    // Step 2: put the game board
    let texture = texture_manager.load("images/Map.jpg")?;
    canvas.copy(
        &texture,
        Rect::new(
            gv.map_loc.0 as i32,
            gv.map_loc.1 as i32,
            gv.map_screen_dim.0 as u32,
            gv.map_screen_dim.1 as u32,
        ),
        Rect::new(0, 0, SCREEN_DIM.0, SCREEN_DIM.1), // destination
    )?;

    // ******************* Reference chit
    let texture = texture_manager.load("img/ref.png")?;

    canvas.copy(
        &texture,
        Rect::new(0, 0, CHIT_SQR, CHIT_SQR), // source
        Rect::new(
            gv.chit_0x0.0 as i32,
            gv.chit_0x0.1 as i32,
            gv.chit_sqr as u32,
            gv.chit_sqr as u32,
        ), // destination
    )?;

    canvas.copy(
        &texture,
        Rect::new(0, 0, CHIT_SQR, CHIT_SQR), // source
        Rect::new(
            gv.chit_0x0.0 as i32 + (gv.hexagon.0 * 1.0) as i32,
            gv.chit_0x0.1 as i32,
            gv.chit_sqr as u32,
            gv.chit_sqr as u32,
        ), // destination
    )?;

    canvas.copy(
        &texture,
        Rect::new(0, 0, CHIT_SQR, CHIT_SQR), // source
        Rect::new(
            gv.chit_0x0.0 as i32 + (gv.hexagon.0 * 26.0) as i32,
            gv.chit_0x0.1 as i32,
            gv.chit_sqr as u32,
            gv.chit_sqr as u32,
        ), // destination
    )?;

    canvas.copy(
        &texture,
        Rect::new(0, 0, CHIT_SQR, CHIT_SQR), // source
        Rect::new(
            gv.chit_0x0.0 as i32,
            gv.chit_0x0.1 as i32 + (gv.hexagon.1 * 19.0) as i32,
            gv.chit_sqr as u32,
            gv.chit_sqr as u32,
        ), // destination
    )?;

    // Step 3: put cursor
    let texture = texture_manager.load("img/cursor.png")?;
    canvas.copy(
        &texture,
        Rect::new(0, 0, gv.cursor_dim.0 as u32, gv.cursor_dim.1 as u32), // source
        Rect::new(
            gv.cursor_loc.0 as i32,
            gv.cursor_loc.1 as i32,
            gv.cursor_dim.0 as u32,
            gv.cursor_dim.1 as u32,
        ), // destination
    )?;

    canvas.present();
    Ok(())
}
