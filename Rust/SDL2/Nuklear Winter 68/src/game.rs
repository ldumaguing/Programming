// ***** game.rs
use sdl2::controller::Button;

use crate::GlobalVariables;
use crate::HEXAGON;
use crate::HEX_0X0;
use crate::MAP_DIM;
use crate::SCREEN_DIM;

fn atone_map(joystick_manager: &u16, gv: &mut GlobalVariables) {
    let x: f64 = SCREEN_DIM.0 as f64 * gv.map_scale as f64;
    let y: f64 = SCREEN_DIM.1 as f64 * gv.map_scale as f64;
    gv.map_screen_dim.0 = x as u32;
    gv.map_screen_dim.1 = y as u32;

    let hx: f64 = HEXAGON.0 as f64 / gv.map_scale as f64;
    let hy: f64 = HEXAGON.1 as f64 / gv.map_scale as f64;
    let shift_x: f64 = hx / 2.0;
    gv.hexagon = (hx as f32, hy as f32);

    let hx: f64 = HEX_0X0.0 as f64 / gv.map_scale as f64;
    let hy: f64 = HEX_0X0.1 as f64 / gv.map_scale as f64;
    let shift_x: f64 = hx + shift_x;
    gv.hex_0x0 = (hx as u32, hy as u32);

    gv.borders.0 = shift_x as f32;
    gv.cursor_loc.0 = shift_x as i32;
}

pub fn update(joystick_manager: &mut u16, gv: &mut GlobalVariables) {
    println!("cursor({},{}): ", gv.cursor_loc.0, gv.cursor_loc.1);
    println!("map({},{}): ", gv.map_loc.0, gv.map_loc.1);
    println!("scale {}: ", gv.map_scale);
    println!("hexagon({},{}): ", gv.hexagon.0, gv.hexagon.1);
    println!("hex_0x0({},{}): ", gv.hex_0x0.0, gv.hex_0x0.1);
    println!("borders({},{}): ", gv.borders.0, gv.borders.1);
    println!("chit_0x0({},{}): ", gv.chit_0x0.0, gv.chit_0x0.1);
    println!();

    // *****
    if crate::joystick::is_button_pressed(joystick_manager, &Button::Back) {
        let x: f64 = SCREEN_DIM.0 as f64 * gv.map_scale as f64;
        let y: f64 = SCREEN_DIM.1 as f64 * gv.map_scale as f64;
        gv.map_screen_dim.0 = x as u32;
        gv.map_screen_dim.1 = y as u32;

        let hx: f64 = HEXAGON.0 as f64 / gv.map_scale as f64;
        let hy: f64 = HEXAGON.1 as f64 / gv.map_scale as f64;
        let shift_x: f64 = hx / 2.0;
        gv.hexagon = (hx as f32, hy as f32);

        let hx: f64 = HEX_0X0.0 as f64 / gv.map_scale as f64;
        let hy: f64 = HEX_0X0.1 as f64 / gv.map_scale as f64;
        let shift_x: f64 = hx + shift_x;
        gv.hex_0x0 = (hx as u32, hy as u32);

        gv.borders.0 = shift_x as f32;
        gv.cursor_loc.0 = shift_x as i32;
    }
    // *****
    if crate::joystick::is_button_pressed(joystick_manager, &Button::LeftShoulder) {
        gv.map_scale += 0.2;
        if gv.map_scale > 3.0 {
            gv.map_scale = 3.0;
        }

        atone_map(joystick_manager, gv);

        crate::joystick::button_up(joystick_manager, Button::LeftShoulder);
    }
    if crate::joystick::is_button_pressed(joystick_manager, &Button::RightShoulder) {
        gv.map_scale -= 0.2;
        if gv.map_scale < 0.4 {
            gv.map_scale = 0.4;
        }

        atone_map(joystick_manager, gv);

        crate::joystick::button_up(joystick_manager, Button::RightShoulder);
    }

    // ***** cursor mode
    if *joystick_manager & (1 << 10) == 0 {
        if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                gv.cursor_loc.0 += 25;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                gv.cursor_loc.0 -= 25;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                gv.cursor_loc.1 += 25;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                gv.cursor_loc.1 -= 25;
            }
        } else {
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                gv.cursor_loc.0 += 2;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                gv.cursor_loc.0 -= 2;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                gv.cursor_loc.1 += 2;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                gv.cursor_loc.1 -= 2;
            }
        }
        // *****
        if gv.cursor_loc.0 < 0 {
            gv.cursor_loc.0 = 0;
            if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                gv.map_loc.0 -= 25;
            } else {
                gv.map_loc.0 -= 2;
            }
        }
        if gv.cursor_loc.1 < 0 {
            gv.cursor_loc.1 = 0;
            if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                gv.map_loc.1 -= 25;
            } else {
                gv.map_loc.1 -= 2;
            }
        }
        let x: i32 = SCREEN_DIM.0 as i32 - gv.cursor_dim.0 as i32;
        if gv.cursor_loc.0 > x {
            gv.cursor_loc.0 = x;
            if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                gv.map_loc.0 += 25;
            } else {
                gv.map_loc.0 += 2;
            }
        }
        let y: i32 = SCREEN_DIM.1 as i32 - gv.cursor_dim.1 as i32;
        if gv.cursor_loc.1 > y {
            gv.cursor_loc.1 = y;
            if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                gv.map_loc.1 += 25;
            } else {
                gv.map_loc.1 += 2;
            }
        }
        // ******************************
        if gv.map_loc.0 < 0 {
            gv.map_loc.0 = 0;
        }
        if gv.map_loc.1 < 0 {
            gv.map_loc.1 = 0;
        }
        let x: i32 = gv.map_loc.0 + gv.map_screen_dim.0 as i32;
        if MAP_DIM.0 < x as u32 {
            gv.map_loc.0 = MAP_DIM.0 as i32 - gv.map_screen_dim.0 as i32;
        }
        let y: i32 = gv.map_loc.1 + gv.map_screen_dim.1 as i32;
        if MAP_DIM.1 < y as u32 {
            gv.map_loc.1 = MAP_DIM.1 as i32 - gv.map_screen_dim.1 as i32;
        }
    }
}
