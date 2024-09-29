use sdl2::event::Event;
use sdl2::keyboard::Keycode;
use sdl2::pixels::Color;
use sdl2::render::{TextureCreator, WindowCanvas};
use sdl2::video::WindowContext;

use sdl2::rect::Point;
use sdl2::rect::Rect;

use specs::{DispatcherBuilder, Join, World, WorldExt};

use std::collections::HashMap;
use std::path::Path;
use std::sync::Mutex;
use std::time::Duration;

use once_cell::sync::Lazy;

pub mod asteroid;
pub mod components;
pub mod game;
pub mod joystick;
pub mod missile;
pub mod sound_manager;
pub mod texture_manager;
pub mod utils;

const GAME_WIDTH: u32 = 800;
const GAME_HEIGHT: u32 = 600;

fn render(
    canvas: &mut WindowCanvas,
    texture_manager: &mut texture_manager::TextureManager<WindowContext>,
    texture_creator: &TextureCreator<WindowContext>,
    font: &sdl2::ttf::Font,
    ecs: &World,
) -> Result<(), String> {
    //
    let color = Color::RGB(0, 0, 0);
    canvas.set_draw_color(color);
    canvas.clear();

    let positions = ecs.read_storage::<components::Position>();
    {
        canvas.set_draw_color(Color::RGBA(255, 255, 255, 128));

        let stars = ecs.read_storage::<components::Star>();
        for (pos, star) in (&positions, &stars).join() {
            canvas.fill_rect(Rect::new(pos.x as i32, pos.y as i32, star.size, star.size))?;
        }
    }

    let renderables = ecs.read_storage::<components::Renderable>();

    for (renderable, pos) in (&renderables, &positions).join() {
        let src = Rect::new(0, 0, renderable.i_w, renderable.i_h);
        let x: i32 = pos.x as i32;
        let y: i32 = pos.y as i32;
        let dest = Rect::new(
            x - ((renderable.o_w / 2) as i32),
            y - ((renderable.o_h / 2) as i32),
            renderable.o_w,
            renderable.o_h,
        );

        let center = Point::new((renderable.o_w / 2) as i32, (renderable.o_h / 2) as i32);
        let texture = texture_manager.load(&renderable.tex_name)?;
        canvas.copy_ex(
            &texture,
            src,            //source rect
            dest,           // dest rect
            renderable.rot, // angle
            center,         // center
            false,          // flip horizontal
            false,          // flip vertical
        )?;
    }

    let players = ecs.read_storage::<components::Player>();
    for (renderable, pos, _) in (&renderables, &positions, &players).join() {
        let src = Rect::new(0, 0, renderable.i_w, renderable.i_h);
        let x: i32 = pos.x as i32;
        let y: i32 = pos.y as i32;
        let mut dest = Rect::new(
            x - ((renderable.o_w / 2) as i32),
            y - ((renderable.o_h / 2) as i32),
            renderable.o_w,
            renderable.o_h,
        );

        let mut draw_second = false;
        if dest.x < (renderable.o_w / 2).try_into().unwrap() {
            dest.x += crate::GAME_WIDTH as i32;
            draw_second = true;
        } else if dest.x > (crate::GAME_WIDTH - renderable.o_w / 2) as i32 {
            dest.x -= crate::GAME_WIDTH as i32;
            draw_second = true;
        }
        if dest.y < (renderable.o_h / 2).try_into().unwrap() {
            dest.y += crate::GAME_HEIGHT as i32;
            draw_second = true;
        } else if dest.y > (crate::GAME_HEIGHT - renderable.o_h / 2) as i32 {
            dest.y -= crate::GAME_HEIGHT as i32;
            draw_second = true;
        }
        if !draw_second {
            break;
        }

        let center = Point::new((renderable.o_w / 2) as i32, (renderable.o_h / 2) as i32);
        let texture = texture_manager.load(&renderable.tex_name)?;
        canvas.copy_ex(
            &texture,
            src,            //source rect
            dest,           // dest rect
            renderable.rot, // angle
            center,         // center
            false,          // flip horizontal
            false,          // flip vertical
        )?;
    }

    let gamedatas = ecs.read_storage::<components::GameData>();
    for gamedata in (gamedatas).join() {
        // Show Score
        let score: String = "Score: ".to_string() + &gamedata.score.to_string();
        let surface = font
            .render(&score)
            .blended(Color::RGBA(255, 0, 0, 128))
            .map_err(|e| e.to_string())?;
        let texture = texture_creator
            .create_texture_from_surface(&surface)
            .map_err(|e| e.to_string())?;

        let target = Rect::new(10 as i32, 0 as i32, 100 as u32, 50 as u32);
        canvas.copy(&texture, None, Some(target))?;

        // Show Level
        let level: String = "Level: ".to_string() + &gamedata.level.to_string();
        let surface = font
            .render(&level)
            .blended(Color::RGBA(255, 0, 0, 128))
            .map_err(|e| e.to_string())?;
        let texture = texture_creator
            .create_texture_from_surface(&surface)
            .map_err(|e| e.to_string())?;

        let target = Rect::new(
            (crate::GAME_WIDTH - 110) as i32,
            0 as i32,
            100 as u32,
            50 as u32,
        );
        canvas.copy(&texture, None, Some(target))?;

        // High Score
        let high_score_value = &GAMESTATE.lock().unwrap().high_score;
        let high_score: String = "High Score: ".to_string() + &high_score_value.to_string();
        let surface = font
            .render(&high_score)
            .blended(Color::RGBA(255, 0, 0, 128))
            .map_err(|e| e.to_string())?;
        let texture = texture_creator
            .create_texture_from_surface(&surface)
            .map_err(|e| e.to_string())?;

        let target = Rect::new(
            10 as i32,
            (crate::GAME_HEIGHT - 60) as i32,
            100 as u32,
            50 as u32,
        );
        canvas.copy(&texture, None, Some(target))?;
    }

    canvas.present();
    Ok(())
}

struct State {
    ecs: World,
}

pub struct GameState {
    high_score: u32,
}

static GAMESTATE: Lazy<Mutex<GameState>> = Lazy::new(|| Mutex::new(GameState { high_score: 0 }));

fn main() -> Result<(), String> {
    println!("Starting Rusteroids");
    sdl2::hint::set("SDL_JOYSTICK_THREAD", "1"); // ************************* LARRY

    let sdl_context = sdl2::init()?;
    let video_subsystem = sdl_context.video()?;

    // ************************* LARRY
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
    // ************************* larry

    let window = video_subsystem
        .window("Rusteroids", GAME_WIDTH, GAME_HEIGHT)
        .position_centered()
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
    tex_man.load("img/asteroid.png")?;
    tex_man.load("img/missile.png")?;

    let mut sound_manager = sound_manager::SoundManager::new();
    // Load Sounds to prevent loading during gameplay
    sound_manager.load_sound(&"sounds/fx/missile.ogg".to_string());

    // Prepare fonts
    let ttf_context = sdl2::ttf::init().map_err(|e| e.to_string())?;
    let font_path: &Path = Path::new(&"fonts/OpenSans-Bold.ttf");
    let mut font = ttf_context.load_font(font_path, 128)?;
    font.set_style(sdl2::ttf::FontStyle::BOLD);

    let mut event_pump = sdl_context.event_pump()?;
    let mut key_manager: HashMap<String, bool> = HashMap::new();
    let mut joystick_manager: u16 = 0;

    let mut gs = State { ecs: World::new() };
    gs.ecs.register::<components::Position>();
    gs.ecs.register::<components::Renderable>();
    gs.ecs.register::<components::Player>();
    gs.ecs.register::<components::Asteroid>();
    gs.ecs.register::<components::Missile>();
    gs.ecs.register::<components::GameData>();
    gs.ecs.register::<components::Star>();
    gs.ecs.register::<components::SoundCue>();

    let mut dispatcher = DispatcherBuilder::new()
        .with(asteroid::AsteroidMover, "asteroid_mover", &[])
        .with(asteroid::AsteroidCollider, "asteroid_collider", &[])
        .with(missile::MissileMover, "missile_mover", &[])
        .with(missile::MissileStriker, "missile_striker", &[])
        .build();

    game::load_world(&mut gs.ecs);

    'running: loop {
        println!("joystick: {}", joystick_manager);
        for event in event_pump.poll_iter() {
            match event {
                // ************************* LARRY
                Event::ControllerButtonDown { button, .. } => {
                    joystick::button_down(&mut joystick_manager, button)
                }
                Event::ControllerButtonUp { button, .. } => {
                    joystick::button_up(&mut joystick_manager, button)
                }
                // ************************* larry
                Event::Quit { .. } => {
                    break 'running;
                }
                Event::KeyDown {
                    keycode: Some(Keycode::Escape),
                    ..
                } => {
                    break 'running;
                }
                Event::KeyDown {
                    keycode: Some(Keycode::Space),
                    ..
                } => {
                    utils::key_down(&mut key_manager, " ".to_string());
                }
                Event::KeyUp {
                    keycode: Some(Keycode::Space),
                    ..
                } => {
                    utils::key_up(&mut key_manager, " ".to_string());
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

        game::update(&mut gs.ecs, &mut key_manager, &mut joystick_manager);
        dispatcher.dispatch(&gs.ecs);
        gs.ecs.maintain();

        let cues = gs.ecs.write_storage::<components::SoundCue>();
        let entities = gs.ecs.entities();

        for (cue, entity) in (&cues, &entities).join() {
            sound_manager.play_sound(cue.filename.to_string());
            entities.delete(entity).ok();
        }

        render(&mut canvas, &mut tex_man, &texture_creator, &font, &gs.ecs)?;

        // Time management
        ::std::thread::sleep(Duration::new(0, 1_000_000_000u32 / 60));
    }

    Ok(())
}
