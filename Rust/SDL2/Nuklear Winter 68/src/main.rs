use sdl2::event::Event;
use sdl2::keyboard::Keycode;

use specs::{World, WorldExt};

use std::collections::HashMap;
use std::path::Path;
use std::time::Duration;

pub mod components;
pub mod renderer;
pub mod texture_manager;
pub mod utils;

pub mod game;

struct State {
    ecs: World,
}

// 2048x1152

// ***** 720p
pub const SCREEN_WIDTH: u32 = 1280;
pub const SCREEN_HEIGHT: u32 = 720;

// ***** Board Map
pub const MAP_DIM: (u32, u32) = (6372, 4139);
pub const HEX_0X0: (u32, u32) = (367, 215);
const X_HEX_COUNT: i32 = 28;
const Y_HEX_COUNT: i32 = 19;
const HEX_LOW_RIGHT: (u32, u32) = (5095, 3920);
pub const HEXAGON: (f32, f32) = (
    (HEX_LOW_RIGHT.0 as f32 - HEX_0X0.0 as f32) / X_HEX_COUNT as f32,
    (HEX_LOW_RIGHT.1 as f32 - HEX_0X0.1 as f32) / Y_HEX_COUNT as f32,
);

fn main() -> Result<(), String> {
    println!("({}, {})", HEXAGON.0 * 10.0, HEXAGON.1 * 10.0);
    let sdl_context = sdl2::init()?;
    let video_subsystem = sdl_context.video()?;

    let window = video_subsystem
        .window("Nuklear Winter '68", SCREEN_WIDTH, SCREEN_HEIGHT)
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

    // Load the images before the main loop so we don't try and load during gameplay
    tex_man.load("img/space_ship.png")?;
    tex_man.load("images/Map.jpg")?;

    // Prepare fonts
    let ttf_context = sdl2::ttf::init().map_err(|e| e.to_string())?;
    let font_path: &Path = Path::new(&"fonts/OpenSans-Bold.ttf");
    let mut font = ttf_context.load_font(font_path, 128)?;
    font.set_style(sdl2::ttf::FontStyle::BOLD);

    let mut event_pump = sdl_context.event_pump()?;
    let mut key_manager: HashMap<String, bool> = HashMap::new();

    let mut gs = State { ecs: World::new() };
    gs.ecs.register::<components::Position>();
    gs.ecs.register::<components::Renderable>();
    gs.ecs.register::<components::Player>();
    gs.ecs.register::<components::GameBoard>();

    game::load_world(&mut gs.ecs);

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
                Event::KeyDown { keycode, .. } => match keycode {
                    None => {}
                    Some(key) => {
                        utils::key_down(&mut key_manager, key.to_string());
                    }
                },
                Event::KeyUp { keycode, .. } => match keycode {
                    None => {}
                    Some(key) => {
                        utils::key_up(&mut key_manager, key.to_string());
                    }
                },
                _ => {}
            }
        }
        game::update(&mut gs.ecs, &mut key_manager);
        renderer::render(&mut canvas, &mut tex_man, &texture_creator, &font, &gs.ecs)?;

        ::std::thread::sleep(Duration::new(0, 1_000_000_000u32 / 60));
    }

    Ok(())
}
