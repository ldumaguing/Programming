// ***** game.rs
use sdl2::controller::Button;

use crate::GlobalVariables;
use crate::MAP_DIM;
use crate::SCREEN_DIM;

pub fn update(joystick_manager: &mut u16, gv: &mut GlobalVariables) {
    if *joystick_manager & (1 << 10) == 0 {
        // ***** cursor mode
        if crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                gv.cursor_loc.0 += 15;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                gv.cursor_loc.0 -= 15;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                gv.cursor_loc.1 += 15;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                gv.cursor_loc.1 -= 15;
            }
        } else {
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                gv.cursor_loc.0 += 1;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                gv.cursor_loc.0 -= 1;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                gv.cursor_loc.1 += 1;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                gv.cursor_loc.1 -= 1;
            }
        }
        if gv.cursor_loc.0 < 0 {
            gv.cursor_loc.0 = 0;
        }
        if gv.cursor_loc.1 < 0 {
            gv.cursor_loc.1 = 0;
        }
        let x: i32 = SCREEN_DIM.0 as i32 - gv.cursor_dim.0 as i32;
        if gv.cursor_loc.0 > x {
            gv.cursor_loc.0 = x;
        }
        let y: i32 = SCREEN_DIM.1 as i32 - gv.cursor_dim.1 as i32;
        if gv.cursor_loc.1 > y {
            gv.cursor_loc.1 = y;
        }
    } else {
        // ***** map mode
        if crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                gv.map_loc.0 += 15;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                gv.map_loc.0 -= 15;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                gv.map_loc.1 += 15;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                gv.map_loc.1 -= 15;
            }
        } else {
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
                gv.map_loc.0 += 1;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
                gv.map_loc.0 -= 1;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
                gv.map_loc.1 += 1;
            }
            if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
                gv.map_loc.1 -= 1;
            }
        }
        if gv.map_loc.0 < 0 {
            gv.map_loc.0 = 0;
        }
        if gv.map_loc.1 < 0 {
            gv.map_loc.1 = 0;
        }
        let x: i32 = gv.map_dim.0 as i32 - SCREEN_DIM.0 as i32;
        if gv.map_loc.0 > x {
            gv.map_loc.0 = x;
        }
        let y: i32 = gv.map_dim.1 as i32 - SCREEN_DIM.1 as i32;
        if gv.map_loc.1 > y {
            gv.map_loc.1 = y;
        }
    }
}
