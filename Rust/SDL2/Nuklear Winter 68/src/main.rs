use sdl2::event::Event;
use sdl2::keyboard::Keycode;

use std::time::Duration;

pub mod joystick;

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
    // ------------------------- joystick

    let _window = video_subsystem
        .window("Nuklear Winter '68", 800, 600)
        .position_centered()
        .build()
        .expect("could not initialize video subsystem");

    // **** managers
    let mut joystick_manager: u16 = 0;

    let mut event_pump = sdl_context.event_pump()?;

    'running: loop {
        println!("joystick: {}", joystick_manager);
        for event in event_pump.poll_iter() {
            match event {
                // ************************* JOYSTICK
                Event::ControllerButtonDown { button, .. } => {
                    joystick::button_down(&mut joystick_manager, button)
                }
                Event::ControllerButtonUp { button, .. } => {
                    joystick::button_up(&mut joystick_manager, button)
                }
                // ------------------------- joystick
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

        ::std::thread::sleep(Duration::new(0, 1_000_000_000u32 / 60));
    }

    Ok(())
}
