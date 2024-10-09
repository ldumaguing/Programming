// ***** main.rs
use sdl2::event::Event;
use sdl2::keyboard::Keycode;

use specs::{World, WorldExt};

use std::collections::HashMap;
use std::path::Path;
use std::time::Duration;

pub mod components;
pub mod game;
pub mod joystick;
pub mod renderer;
pub mod texture_manager;
pub mod utils;

struct State {
    ecs: World,
}

pub struct GlobalVariables {
    hex_0x0: (u32, u32),
    hex_low_right: (u32, u32),
    hexagon: (f32, f32),
    cursor_hex_0x0: (u32, u32),
    cursor_dim: (u32, u32),
}

// ***** 2048x1152
// pub const SCREEN_WIDTH: u32 = 2040;
// pub const SCREEN_HEIGHT: u32 = 1074;

// ***** 720p
// pub const SCREEN_WIDTH: u32 = 1280;
// pub const SCREEN_HEIGHT: u32 = 720;

// ***** low laptop
pub const SCREEN_WIDTH: u32 = 1360;
pub const SCREEN_HEIGHT: u32 = 686;

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

// ***** Cursor
pub const CURSOR_HEX_0X0: (u32, u32) = (248, 113);
pub const CURSOR_DIM: (u32, u32) = (235, 206);

// *************************************************************************************************
fn main() -> Result<(), String> {
    sdl2::hint::set("SDL_JOYSTICK_THREAD", "1");

    let sdl_context = sdl2::init()?;
    let video_subsystem = sdl_context.video()?;

    // ************************* JOYSTICK
    let game_controller_subsystem = sdl_context.game_controller()?;

    let available = game_controller_subsystem
        .num_joysticks()
        .map_err(|e| format!("can't enumerate joysticks: {}", e))?;

    println!("{} joysticks available", available);

    // Iterate over all available joysticks and look for game controllers.
    let controller = (0..available)
        .find_map(|id| {
            if !game_controller_subsystem.is_game_controller(id) {
                println!("{} is not a game controller", id);
                return None;
            }

            println!("Attempting to open controller {}", id);

            match game_controller_subsystem.open(id) {
                Ok(c) => {
                    println!("Success: opened \"{}\"", c.name());
                    Some(c)
                }
                Err(e) => {
                    println!("failed: {:?}", e);
                    None
                }
            }
        })
        .expect("Couldn't open any controller");

    println!("Controller mapping: {}", controller.mapping());
    // +++++++++++++++++++++++++ joystick

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

    // **** managers
    let texture_creator = canvas.texture_creator();
    let mut tex_man = texture_manager::TextureManager::new(&texture_creator);
    let mut joystick_manager: u16 = 0;
    let mut gv = GlobalVariables {
        hex_0x0: HEX_0X0,
        hex_low_right: HEX_LOW_RIGHT,
        hexagon: HEXAGON,
        cursor_hex_0x0: CURSOR_HEX_0X0,
        cursor_dim: CURSOR_DIM,
    };

    // Load the images before the main loop so we don't try and load during gameplay
    tex_man.load("img/space_ship.png")?;
    tex_man.load("img/cursor.png")?;
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
    gs.ecs.register::<components::Cursor>();

    game::load_world(&mut gs.ecs);

    'running: loop {
        // println!("joystick: {}", joystick_manager);
        for event in event_pump.poll_iter() {
            match event {
                // ************************* JOYSTICK
                Event::ControllerButtonDown { button, .. } => {
                    joystick::button_down(&mut joystick_manager, button)
                }
                Event::ControllerButtonUp { button, .. } => {
                    joystick::button_up(&mut joystick_manager, button)
                }
                // +++++++++++++++++++++++++ joystick
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
        game::update(
            &mut gs.ecs,
            &mut key_manager,
            &mut joystick_manager,
            &mut gv,
        );
        renderer::render(
            &mut canvas,
            &mut tex_man,
            &texture_creator,
            &font,
            &gs.ecs,
            &mut gv,
        )?;

        ::std::thread::sleep(Duration::new(0, 1_000_000_000u32 / 60));
    }

    Ok(())
}
