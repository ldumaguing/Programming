// ***** renderer.rs
use sdl2::pixels::Color;
use sdl2::render::{TextureCreator, WindowCanvas};
use sdl2::video::WindowContext;

use sdl2::rect::Point;
use sdl2::rect::Rect;

use crate::texture_manager;
use crate::GlobalVariables;
use crate::SCREEN_DIM;

pub fn render(
    canvas: &mut WindowCanvas,
    texture_manager: &mut texture_manager::TextureManager<WindowContext>,
    _texture_creator: &TextureCreator<WindowContext>,
    gv: &mut GlobalVariables,
    joy: &u16,
) -> Result<(), String> {
    // Step 1: paint the canvas red
    let color = Color::RGB(255, 0, 0);
    canvas.set_draw_color(color);
    canvas.clear();

    // Step 2: put the game board
    let texture = texture_manager.load("images/UK43-MAP-2015.jpg")?;
    canvas.copy(
        &texture,
        // Rect::new(gv.map_loc.0, gv.map_loc.1, SCREEN_DIM.0, SCREEN_DIM.1), // source
        Rect::new(
            gv.map_loc.0,
            gv.map_loc.1,
            gv.map_screen_dim.0,
            gv.map_screen_dim.1,
        ),
        Rect::new(0, 0, SCREEN_DIM.0, SCREEN_DIM.1), // destination
    )?;

    // Step 3: put cursor
    if *joy & (1 << 10) == 0 {
        let texture = texture_manager.load("img/cursor.png")?;
        canvas.copy(
            &texture,
            Rect::new(0, 0, gv.cursor_dim.0, gv.cursor_dim.1), // source
            Rect::new(
                gv.cursor_loc.0,
                gv.cursor_loc.1,
                gv.cursor_dim.0,
                gv.cursor_dim.1,
            ), // destination
        )?;
    }

    canvas.present();
    Ok(())
}