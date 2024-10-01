use sdl2::event::Event;
use sdl2::keyboard::Keycode;

use std::path::Path;
use std::time::Duration;

pub mod renderer;
pub mod texture_manager;

const SCREEN_WIDTH: i32 = 1366;
const SCREEN_HEIGHT: i32 = 768;

fn main() -> Result<(), String> {
    println!("Starting Rusteroids");

    let sdl_context = sdl2::init()?;
    let video_subsystem = sdl_context.video()?;

    let window = video_subsystem
        .window("Mine", SCREEN_WIDTH as u32, SCREEN_HEIGHT as u32)
        .position_centered()
        //.fullscreen()
        .build()
        .expect("could not initialize video subsystem");

    let mut canvas = window
        .into_canvas()
        .build()
        .expect("could not make a canvas");

    let texture_creator = canvas.texture_creator();
    let mut tex_man = texture_manager::TextureManager::new(&texture_creator);

    tex_man.load("img/space_ship.png")?;

    let ttf_context = sdl2::ttf::init().map_err(|e| e.to_string())?;
    let font_path: &Path = Path::new(&"fonts/OpenSans-Bold.ttf");
    let mut font = ttf_context.load_font(font_path, 128)?;
    font.set_style(sdl2::ttf::FontStyle::BOLD);

    let mut event_pump = sdl_context.event_pump()?;

    'running: loop {
        for event in event_pump.poll_iter() {
            match event {
                Event::Quit { .. } => {
                    break 'running;
                }
                Event::KeyDown {
                    keycode: Some(Keycode::Escape),
                    ..
                } => {
                    break 'running;
                }
                _ => {}
            }
        }

        renderer::render(&mut canvas, &mut tex_man, &texture_creator, &font)?;

        ::std::thread::sleep(Duration::new(0, 1_000_000_000u32 / 60));
    }

    Ok(())
}
