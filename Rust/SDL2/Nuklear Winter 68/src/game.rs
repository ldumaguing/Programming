// ***** game.rs
use sdl2::controller::Button;

use crate::GlobalVariables;
use crate::MAP_DIM;
use crate::SCREEN_DIM;

pub fn update(joystick_manager: &mut u16, gv: &mut GlobalVariables) {
    if crate::joystick::is_button_pressed(joystick_manager, &Button::A) {
        println!("cursor({},{}): ", gv.cursor_loc.0, gv.cursor_loc.1);
        println!("map({},{}): ", gv.map_loc.0, gv.map_loc.1);
        println!("scale {}: ", gv.map_scale);
        println!();
    }
    // *****
    if crate::joystick::is_button_pressed(joystick_manager, &Button::LeftShoulder) {
        gv.map_scale += 0.2;
        if gv.map_scale > 3.0 {
            gv.map_scale = 3.0;
        }
        let x: f64 = SCREEN_DIM.0 as f64 * gv.map_scale as f64;
        let y: f64 = SCREEN_DIM.1 as f64 * gv.map_scale as f64;
        gv.map_screen_dim.0 = x as u32;
        gv.map_screen_dim.1 = y as u32;

        crate::joystick::button_up(joystick_manager, Button::LeftShoulder);
    }
    if crate::joystick::is_button_pressed(joystick_manager, &Button::RightShoulder) {
        gv.map_scale -= 0.2;
        if gv.map_scale < 0.4 {
            gv.map_scale = 0.4;
        }
        let x: f64 = SCREEN_DIM.0 as f64 * gv.map_scale as f64;
        let y: f64 = SCREEN_DIM.1 as f64 * gv.map_scale as f64;
        gv.map_screen_dim.0 = x as u32;
        gv.map_screen_dim.1 = y as u32;

        crate::joystick::button_up(joystick_manager, Button::RightShoulder);
    }

    if *joystick_manager & (1 << 10) == 0 {
        // ***** cursor mode
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
                gv.cursor_loc.0 += 6;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                gv.cursor_loc.0 -= 6;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                gv.cursor_loc.1 += 6;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                gv.cursor_loc.1 -= 6;
            }
        }
        // *****
        if gv.cursor_loc.0 < 0 {
            gv.cursor_loc.0 = 0;
            if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                gv.map_loc.0 -= 25;
            } else {
                gv.map_loc.0 -= 6;
            }
        }
        if gv.cursor_loc.1 < 0 {
            gv.cursor_loc.1 = 0;
            if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                gv.map_loc.1 -= 25;
            } else {
                gv.map_loc.1 -= 6;
            }
        }
        let x: i32 = SCREEN_DIM.0 as i32 - gv.cursor_dim.0 as i32;
        if gv.cursor_loc.0 > x {
            gv.cursor_loc.0 = x;
            if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                gv.map_loc.0 += 25;
            } else {
                gv.map_loc.0 += 6;
            }
        }
        let y: i32 = SCREEN_DIM.1 as i32 - gv.cursor_dim.1 as i32;
        if gv.cursor_loc.1 > y {
            gv.cursor_loc.1 = y;
            if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
                gv.map_loc.1 += 25;
            } else {
                gv.map_loc.1 += 6;
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
