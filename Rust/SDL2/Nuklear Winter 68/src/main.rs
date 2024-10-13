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
// pub const SCREEN_DIM: (u32, u32) = (1366, 768);  // fullscreen

pub const SCREEN_DIM: (u32, u32) = (800, 600);
// pub const SCREEN_DIM: (u32, u32) = (320, 200);
// pub const SCREEN_DIM: (u32, u32) = (320, 240);
// pub const SCREEN_DIM: (u32, u32) = (640, 480);

// ***** WXGA
// pub const SCREEN_DIM: (u32, u32) = (1280, 800);

// ***** Board Map
pub const MAP_DIM: (u32, u32) = (6372, 4139);
pub const HEX_0X0: (u32, u32) = (367, 215);
const X_HEX_COUNT: i32 = 28; // 29 - 1
const Y_HEX_COUNT: i32 = 19; // 20 - 1
const HEX_LOW_RIGHT: (u32, u32) = (5095, 3920);
pub const HEXAGON: (f32, f32) = (
    (HEX_LOW_RIGHT.0 as f32 - HEX_0X0.0 as f32) / X_HEX_COUNT as f32,
    (HEX_LOW_RIGHT.1 as f32 - HEX_0X0.1 as f32) / Y_HEX_COUNT as f32,
);
const SHIFTS: (f32, f32) = (
    (HEXAGON.0 / 2.0) + HEX_0X0.0 as f32,
    (HEXAGON.1 / 2.0) + HEX_0X0.1 as f32,
);

// ***** Cursor
pub const CURSOR_HEX_0X0: (u32, u32) = (248, 113);
pub const CURSOR_DIM: (u32, u32) = (21, 30);

pub struct GlobalVariables {
    hex_0x0: (u32, u32),
    hex_low_right: (u32, u32),
    hexagon: (f32, f32),
    cursor_hex_0x0: (u32, u32),
    cursor_dim: (u32, u32),
    map_loc: (i32, i32),
    cursor_loc: (i32, i32),
    map_screen_dim: (u32, u32),
    map_scale: f32,
    chit_0x0: (u32, u32),
    chit_sqr: u32,
    shifts: (f32, f32),
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
        hex_0x0: HEX_0X0,
        hex_low_right: HEX_LOW_RIGHT,
        hexagon: HEXAGON,
        cursor_hex_0x0: CURSOR_HEX_0X0,
        cursor_dim: CURSOR_DIM,
        map_loc: (0, 0),
        cursor_loc: (HEX_0X0.0 as i32, HEX_0X0.1 as i32),
        map_screen_dim: SCREEN_DIM,
        map_scale: 1.0,
        chit_0x0: (293, 141),
        chit_sqr: 150,
        shifts: SHIFTS,
    };

    tex_man.load("img/cursor.png")?;
    tex_man.load("images/Map.jpg")?;
    tex_man.load("images/1_130 E100 front.png")?;

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
