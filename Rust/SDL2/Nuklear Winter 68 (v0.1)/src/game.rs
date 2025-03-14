use specs::Join;
use specs::{Builder, World, WorldExt};
use std::collections::HashMap;

use sdl2::controller::Button;

use crate::GlobalVariables;
use crate::CURSOR_DIM;
use crate::CURSOR_HEX_0X0;
use crate::HEX_0X0;
use crate::MAP_DIM;
use crate::SCREEN_HEIGHT;
use crate::SCREEN_WIDTH;

const ROTATION_SPEED: f64 = 1.5;

/*
struct GlobalVariables {
    hex_0x0: (u32, u32),
    hex_low_right: (u32, u32),
    hexagon: (f32, f32),
    cursor_hex_0x0: (u32, u32),
    cursor_dim: (u32, u32),
}
*/
pub fn update(
    ecs: &mut World,
    key_manager: &mut HashMap<String, bool>,
    joystick_manager: &mut u16,
    gv: &mut GlobalVariables,
) {
    println!("({},{})", gv.hex_0x0.0, gv.hex_0x0.1);
    println!("({},{})", gv.hex_low_right.0, gv.hex_low_right.1);
    println!("({},{})", gv.hexagon.0, gv.hexagon.1);
    println!("({},{})", gv.cursor_hex_0x0.0, gv.cursor_hex_0x0.1);
    println!("({},{})", gv.cursor_dim.0, gv.cursor_dim.1);
    let mut positions = ecs.write_storage::<crate::components::Position>();
    let mut gameboards = ecs.write_storage::<crate::components::GameBoard>();
    let players = ecs.read_storage::<crate::components::Player>();
    let cursors = ecs.read_storage::<crate::components::Cursor>();

    // ***** Shrink
    if (*joystick_manager & 1 << 13) != 0 {
        println!("shrink");
        for (gameboard, _) in (&mut gameboards, &positions).join() {
            gameboard.scale += 0.1;
            if gameboard.scale > 4.0 {
                gameboard.scale = 4.0;
            }
        }
    }

    // ***** Zoom
    if (*joystick_manager & 1 << 14) != 0 {
        println!("zoom");
        for (gameboard, _) in (&mut gameboards, &positions).join() {
            gameboard.scale -= 0.1;
            if gameboard.scale < 1.0 {
                gameboard.scale = 1.0;
            }
        }
    }

    // ***** Mode
    if (*joystick_manager & 1 << 10) != 0 {
        // ***** Map
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
/*
struct GlobalVariables {
    hex_0x0: (u32, u32),
    hex_low_right: (u32, u32),
    hexagon: (f32, f32),
    cursor_hex_0x0: (u32, u32),
    cursor_dim: (u32, u32),
}
*/
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
