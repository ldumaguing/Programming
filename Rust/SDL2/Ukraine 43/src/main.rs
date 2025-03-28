// ***** main.rs
use sdl2::event::Event;
use sdl2::keyboard::Keycode;

use std::collections::HashMap;
use std::time::Duration;

pub mod game; // Game logic
pub mod joystick; // Joystick input
pub mod renderer; // blit
pub mod texture_manager; // graphics database
pub mod utils; // Mouse & keyboard inputs

// ***** 2048x1152
// pub const SCREEN_DIM: (u32, u32) = (2040, 1074);

// ***** 720p
// pub const SCREEN_DIM: (u32, u32) = (1280, 720);

// ***** low laptop
// pub const SCREEN_DIM: (u32, u32) = (1360, 686);
// pub const SCREEN_DIM: (u32, u32) = (1366, 768); // fullscreen

// pub const SCREEN_DIM: (u32, u32) = (800, 600);
// pub const SCREEN_DIM: (u32, u32) = (1067, 600);
// pub const SCREEN_DIM: (u32, u32) = (320, 200);
// pub const SCREEN_DIM: (u32, u32) = (320, 240);
// pub const SCREEN_DIM: (u32, u32) = (640, 480);

// ***** WXGA
pub const SCREEN_DIM: (u32, u32) = (1280, 800);

// ***** Board Map
pub const MAP_DIM: (u32, u32) = (5475, 5100);
pub const HEX_0X0: (u32, u32) = (152, 145);
// pub const QUART_GRID: (u32, u32) = (56, 99); // left right up down
const X_HEX_COUNT: u32 = 50;
const Y_HEX_COUNT: u32 = 41;
const HEX_LOW_RIGHT: (u32, u32) = (5359, 5059);
pub const HEXAGON: (f64, f64) = (
    (HEX_LOW_RIGHT.0 as f64 - HEX_0X0.0 as f64) / X_HEX_COUNT as f64,
    (HEX_LOW_RIGHT.1 as f64 - HEX_0X0.1 as f64) / Y_HEX_COUNT as f64,
);
pub const CHIT_SQR: u32 = 96;


// ***** Cursor
pub const CURSOR_HEX_0X0: (u32, u32) = (248, 113);
pub const CURSOR_DIM: (u32, u32) = (21, 30);

pub struct GlobalVariables {
    hex_0x0: (f64, f64),
    hexagon: (f64, f64),
    cursor_dim: (f64, f64),
    map_loc: (f64, f64),
    cursor_loc: (f64, f64),
    map_screen_dim: (f64, f64),
    map_scale: f64,
    chit_sqr: f64,
    chit_0x0: (f64, f64), // corner (upper-left)
    hex_id: (i32, i32),
}

// ***************************************************************************************
fn main() -> Result<(), String> {
    sdl2::hint::set("SDL_JOYSTICK_THREAD", "1");

    let sdl_context = sdl2::init()?;
    let video_subsystem = sdl_context.video()?;

    // ************************* JOYSTICK
    let game_controller_subsystem = sdl_context.game_controller()?;

    let available = game_controller_subsystem
        .num_joysticks()
        .map_err(|e| format!("can't enumerate joysticks: {}", e))?;

    //println!("{} joysticks available", available);

    // Iterate over all available joysticks and look for game controllers.
    let _controller = (0..available)
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

    //println!("Controller mapping: {}", controller.mapping());
    // ------------------------- joystick

    let window = video_subsystem
        .window("Nuklear Winter '68", SCREEN_DIM.0, SCREEN_DIM.1)
        .position_centered()
        // .fullscreen()
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
    let mut key_manager: HashMap<String, bool> = HashMap::new();
    let mut gv = GlobalVariables {
        hex_0x0: (HEX_0X0.0 as f64, HEX_0X0.1 as f64),
        hexagon: HEXAGON,
        cursor_dim: (CURSOR_DIM.0 as f64, CURSOR_DIM.1 as f64),
        map_loc: (0.0, 0.0),
        cursor_loc: (HEX_0X0.0 as f64, HEX_0X0.1 as f64),
        map_screen_dim: (SCREEN_DIM.0 as f64, SCREEN_DIM.1 as f64),
        map_scale: 1.0,
        chit_sqr: CHIT_SQR as f64,
        chit_0x0: (0.0, 0.0),
        hex_id: (0, 0),
    };

    game::load_game(&mut gv);

    tex_man.load("img/cursor.png")?;
    tex_man.load("images/UK43-MAP-2015.jpg")?;
    tex_man.load("img/ref.png")?;

    let mut event_pump = sdl_context.event_pump()?;

    'running: loop {
        // println!("joystick: {}", joystick_manager);
        for event in event_pump.poll_iter() {
            match event {
                // ************************* Joystick
                Event::ControllerButtonDown { button, .. } => {
                    joystick::button_down(&mut joystick_manager, button)
                }
                Event::ControllerButtonUp { button, .. } => {
                    joystick::button_up(&mut joystick_manager, button)
                }
                // ************************* GUI - Quit
                Event::Quit { .. } => {
                    break 'running;
                }
                // ************************* Keyboard - ESC
                Event::KeyDown {
                    keycode: Some(Keycode::Escape),
                    ..
                } => {
                    break 'running;
                }
                // ************************* Keyboard
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

        game::update(&mut joystick_manager, &mut gv);
        renderer::render(
            &mut canvas,
            &mut tex_man,
            &texture_creator,
            &mut gv,
            &joystick_manager,
        )?;
        ::std::thread::sleep(Duration::new(0, 1_000_000_000u32 / 60));
    }

    Ok(())
}
