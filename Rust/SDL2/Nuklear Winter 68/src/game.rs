use specs::Join;
use specs::{Builder, World, WorldExt};
use std::collections::HashMap;

use sdl2::controller::Button;

use crate::CURSOR_DIM;
use crate::CURSOR_HEX_0X0;
use crate::HEX_0X0;
use crate::MAP_DIM;
use crate::SCREEN_HEIGHT;
use crate::SCREEN_WIDTH;

const ROTATION_SPEED: f64 = 1.5;

pub fn update(
    ecs: &mut World,
    key_manager: &mut HashMap<String, bool>,
    joystick_manager: &mut u16,
) {
    let mut positions = ecs.write_storage::<crate::components::Position>();
    let players = ecs.read_storage::<crate::components::Player>();
    let cursors = ecs.read_storage::<crate::components::Cursor>();
    let gameboards = ecs.read_storage::<crate::components::GameBoard>();

    // ***** Mode
    if (*joystick_manager & 1 << 10) != 0 {
        println!("not zero");
        for (_, pos) in (&gameboards, &mut positions).join() {
            if crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                    pos.x += 15.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                    pos.x -= 15.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                    pos.y += 15.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                    pos.y -= 15.0;
                }
            } else {
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                    pos.x += 1.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                    pos.x -= 1.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                    pos.y += 1.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                    pos.y -= 1.0;
                }
            }
            if pos.x < 0.0 {
                pos.x = 0.0;
            }
            if pos.y < 0.0 {
                pos.y = 0.0;
            }
            let x: f64 = MAP_DIM.0 as f64 - SCREEN_WIDTH as f64;
            if pos.x > x {
                pos.x = x;
            }
            let y: f64 = MAP_DIM.1 as f64 - SCREEN_HEIGHT as f64;
            if pos.y > y {
                pos.y = y;
            }
        }
    } else {
        // ***** Cursor
        for (_, pos) in (&cursors, &mut positions).join() {
            if crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                    pos.x += 15.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                    pos.x -= 15.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                    pos.y += 15.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                    pos.y -= 15.0;
                }
            } else {
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                    pos.x += 1.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                    pos.x -= 1.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                    pos.y += 1.0;
                }
                if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                    pos.y -= 1.0;
                }
            }
            if pos.x < 0.0 {
                pos.x = 0.0;
            }
            if pos.y < 0.0 {
                pos.y = 0.0;
            }
            let x: f64 = SCREEN_WIDTH as f64 - CURSOR_DIM.0 as f64;
            if pos.x > x {
                pos.x = x;
            }
            let y: f64 = SCREEN_HEIGHT as f64 - CURSOR_DIM.1 as f64;
            if pos.y > y {
                pos.y = y;
            }
        }
    }

    // ***** ship
    for (_, pos) in (&players, &mut positions).join() {
        if crate::utils::is_key_pressed(&key_manager, "D") {
            pos.rot += ROTATION_SPEED;
        }
        if crate::utils::is_key_pressed(&key_manager, "A") {
            pos.rot -= ROTATION_SPEED;
        }
        if pos.rot > 360.0 {
            pos.rot -= 360.0;
        }
        if pos.rot < 0.0 {
            pos.rot += 360.0;
        }
    }
}

// *************************************************************************************************
pub fn load_world(ecs: &mut World) {
    // *****************************************************************
    ecs.create_entity()
        .with(crate::components::Position {
            x: 0.0,
            y: 0.0,
            rot: 0.0,
        })
        .with(crate::components::Renderable {
            tex_name: String::from("img/cursor.png"),
            i_w: 235,
            i_h: 206,
            o_w: 235,
            o_h: 206,
            frame: 0,
            total_frames: 1,
            rot: 0.0,
        })
        .with(crate::components::Cursor {})
        .build();

    // *****************************************************************
    ecs.create_entity()
        .with(crate::components::Position {
            x: 100.0,
            y: 100.0,
            rot: 0.0,
        })
        .with(crate::components::Renderable {
            tex_name: String::from("images/Map.jpg"),
            i_w: SCREEN_WIDTH,
            i_h: SCREEN_HEIGHT,
            o_w: SCREEN_WIDTH,
            o_h: SCREEN_HEIGHT,
            frame: 0,
            total_frames: 1,
            rot: 0.0,
        })
        .with(crate::components::GameBoard { scale: 1.0 })
        .build();

    // *****************************************************************
    ecs.create_entity()
        .with(crate::components::Position {
            x: 350.0,
            y: 250.0,
            rot: 0.0,
        })
        .with(crate::components::Renderable {
            tex_name: String::from("img/space_ship.png"),
            i_w: 100,
            i_h: 100,
            o_w: 100,
            o_h: 100,
            frame: 0,
            total_frames: 1,
            rot: 0.0,
        })
        .with(crate::components::Player {})
        .build();
}
