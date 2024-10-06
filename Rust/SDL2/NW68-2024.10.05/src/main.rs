use sdl2::event::Event;
use sdl2::keyboard::Keycode;

use std::path::Path;
use std::time::Duration;

use resolution::current_resolution;

pub mod renderer;
pub mod texture_manager;

fn main() -> Result<(), String> {
    println!("Starting Nuklear Winter '68");

    let sdl_context = sdl2::init()?;
    let video_subsystem = sdl_context.video()?;

    let screen_dim = match current_resolution() {
        Ok((width, height)) => (width, height),
        Err(error) => panic!("Problem: {error:?}"),
    };

    let window = video_subsystem
        .window(
            "Nuklear Winter '68",
            screen_dim.0 as u32,
            screen_dim.1 as u32,
        )
        //.position_centered()
        .fullscreen()
        .build()
        .expect("could not initialize video subsystem");

    let mut canvas = window
        .into_canvas()
        .build()
        .expect("could not make a canvas");

    let texture_creator = canvas.texture_creator();
    let mut tex_man = texture_manager::TextureManager::new(&texture_creator);

    tex_man.load("img/space_ship.png")?;
    tex_man.load("images/Map.jpg")?;

    let ttf_context = sdl2::ttf::init().map_err(|e| e.to_string())?;
    let font_path: &Path = Path::new(&"fonts/OpenSans-Bold.ttf");
    let mut font = ttf_context.load_font(font_path, 128)?;
    font.set_style(sdl2::ttf::FontStyle::BOLD);

    let mut event_pump = sdl_context.event_pump()?;

    let mut counter: i64 = 0;
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

        renderer::render(
            &mut canvas,
            &mut tex_man,
            &texture_creator,
            &font,
            &mut counter,
            screen_dim.0,
            screen_dim.1,
        )?;

        ::std::thread::sleep(Duration::new(0, 1_000_000_000u32 / 60));
    }

    Ok(())
}
