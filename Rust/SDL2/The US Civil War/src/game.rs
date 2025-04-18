// ***** game.rs
use sdl2::controller::Button;

use crate::GlobalVariables;
use crate::CHIT_SQR;
use crate::HEXAGON;
use crate::HEX_0X0;
use crate::MAP_DIM;
use crate::SCREEN_DIM;

fn define_hex_id(gv: &mut GlobalVariables) {
    let mut y = ((gv.cursor_loc.1 - gv.chit_0x0.1) / gv.hexagon.1) as i32;
    let mut x: i32;
    if (y % 2) == 0 {
        x = ((gv.cursor_loc.0 - gv.chit_0x0.0) / gv.hexagon.0) as i32;
    } else {
        let z: f64 = gv.chit_0x0.0 + (gv.chit_sqr / 2.0);
        x = ((gv.cursor_loc.0 - z) / gv.hexagon.0) as i32;
    }
    if gv.cursor_loc.1 < gv.chit_0x0.1 {
        y = -1;
    }
    if gv.cursor_loc.0 < gv.chit_0x0.0 {
        x = -1;
    }
    if (y % 2) != 0 {
        if gv.cursor_loc.0 < gv.hex_0x0.0 {
            x = -1;
        }
    }
    /*
    let mut x = ((gv.cursor_loc.0 - gv.chit_0x0.0) / gv.hexagon.0) as i32;
    let mut y: i32;
    if (x % 2) == 0 {
        y = ((gv.cursor_loc.1 - gv.chit_0x0.1) / gv.hexagon.1) as i32;
    } else {
        let z: f64 = gv.chit_0x0.1 + (gv.chit_sqr / 2.0);
        y = ((gv.cursor_loc.1 - z) / gv.hexagon.1) as i32;
    }

    if gv.cursor_loc.0 < gv.chit_0x0.0 {
        x = -1;
    }
    if gv.cursor_loc.1 < gv.chit_0x0.1 {
        y = -1;
    }
    if (x % 2) != 0 {
        if gv.cursor_loc.1 < gv.hex_0x0.1 {
            y = -1;
        }
    }
    */

    gv.hex_id = (x, y);
    println!("cursor({},{}): ", gv.cursor_loc.0, gv.cursor_loc.1);
    println!("map_loc({},{}): ", gv.map_loc.0, gv.map_loc.1);
    println!("scale {}: ", gv.map_scale);
    println!("hexagon({},{}): ", gv.hexagon.0, gv.hexagon.1);
    println!("********** hex_0x0({},{}): ", gv.hex_0x0.0, gv.hex_0x0.1);
    println!("chit_sqr {}: ", gv.chit_sqr);
    println!("********** chit_0x0({},{}): ", gv.chit_0x0.0, gv.chit_0x0.1);
    println!("hex_id({},{}): ", gv.hex_id.0, gv.hex_id.1);
    println!();
}

// ***** scaling map
fn scaling(gv: &mut GlobalVariables) {
    let x: f64 = SCREEN_DIM.0 as f64 * gv.map_scale as f64;
    let y: f64 = SCREEN_DIM.1 as f64 * gv.map_scale as f64;
    gv.map_screen_dim.0 = x;
    gv.map_screen_dim.1 = y;

    let hx: f64 = HEXAGON.0 as f64 / gv.map_scale as f64;
    let hy: f64 = HEXAGON.1 as f64 / gv.map_scale as f64;
    gv.hexagon = (hx, hy);

    let hx: f64 = HEX_0X0.0 as f64 / gv.map_scale as f64;
    let hy: f64 = HEX_0X0.1 as f64 / gv.map_scale as f64;
    gv.hex_0x0 = (hx + 1.0, hy + 1.0);
}

pub fn update(joystick_manager: &mut u16, gv: &mut GlobalVariables) {
    if crate::joystick::is_button_pressed(joystick_manager, &Button::A) {
        define_hex_id(gv);
        crate::joystick::button_up(joystick_manager, Button::A);
    }
    // *****
    if crate::joystick::is_button_pressed(joystick_manager, &Button::LeftShoulder) {
        let scl_x: f64 = MAP_DIM.0 as f64 / SCREEN_DIM.0 as f64;
        let scl_y: f64 = MAP_DIM.1 as f64 / SCREEN_DIM.1 as f64;
        println!("......... {}, {}", scl_x, scl_y);
        let old = gv.map_scale;
        gv.map_scale += 0.2;
        if gv.map_scale > scl_x {
            gv.map_scale = old;
        }
        if gv.map_scale > scl_y {
            gv.map_scale = old;
        }

        scaling(gv);

        crate::joystick::button_up(joystick_manager, Button::LeftShoulder);
    }
    if crate::joystick::is_button_pressed(joystick_manager, &Button::RightShoulder) {
        gv.map_scale -= 0.2;
        if gv.map_scale < 0.4 {
            gv.map_scale = 0.4;
        }

        scaling(gv);

        crate::joystick::button_up(joystick_manager, Button::RightShoulder);
    }

    if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
        if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
            gv.cursor_loc.0 += 25.0;
        }
        if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
            gv.cursor_loc.0 -= 25.0;
        }
        if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
            gv.cursor_loc.1 += 25.0;
        }
        if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
            gv.cursor_loc.1 -= 25.0;
        }
    } else {
        if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadRight) {
            gv.cursor_loc.0 += 2.0;
        }
        if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadLeft) {
            gv.cursor_loc.0 -= 2.0;
        }
        if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadDown) {
            gv.cursor_loc.1 += 2.0;
        }
        if crate::joystick::is_button_pressed(joystick_manager, &Button::DPadUp) {
            gv.cursor_loc.1 -= 2.0;
        }
    }
    // *****
    if gv.cursor_loc.0 < 0.0 {
        gv.cursor_loc.0 = 0.0;
        if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
            gv.map_loc.0 -= 25.0;
        } else {
            gv.map_loc.0 -= 2.0;
        }
    }
    if gv.cursor_loc.1 < 0.0 {
        gv.cursor_loc.1 = 0.0;
        if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
            gv.map_loc.1 -= 25.0;
        } else {
            gv.map_loc.1 -= 2.0;
        }
    }
    let x = SCREEN_DIM.0 as f64 - gv.cursor_dim.0;
    if gv.cursor_loc.0 > x {
        gv.cursor_loc.0 = x;
        if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
            gv.map_loc.0 += 25.0;
        } else {
            gv.map_loc.0 += 2.0;
        }
    }
    let y = SCREEN_DIM.1 as f64 - gv.cursor_dim.1;
    if gv.cursor_loc.1 > y {
        gv.cursor_loc.1 = y;
        if !crate::joystick::is_button_pressed(joystick_manager, &Button::RightStick) {
            gv.map_loc.1 += 25.0;
        } else {
            gv.map_loc.1 += 2.0;
        }
    }
    // ******************************
    if gv.map_loc.0 < 0.0 {
        gv.map_loc.0 = 0.0;
    }
    if gv.map_loc.1 < 0.0 {
        gv.map_loc.1 = 0.0;
    }
    let x = gv.map_loc.0 + gv.map_screen_dim.0;
    if (MAP_DIM.0 as f64) < x {
        gv.map_loc.0 = MAP_DIM.0 as f64 - gv.map_screen_dim.0;
    }
    let y = gv.map_loc.1 + gv.map_screen_dim.1;
    if (MAP_DIM.1 as f64) < y {
        gv.map_loc.1 = MAP_DIM.1 as f64 - gv.map_screen_dim.1;
    }

    // *****
    gv.chit_sqr = CHIT_SQR as f64 / gv.map_scale;

    let x = gv.hex_0x0.0 - (gv.map_loc.0 / gv.map_scale);
    let x = x - (gv.chit_sqr / 2.0);

    let y = gv.hex_0x0.1 - (gv.map_loc.1 / gv.map_scale);
    let y = y - (gv.chit_sqr / 2.0);

    gv.chit_0x0 = (x, y);

    /*
    println!("cursor({},{}): ", gv.cursor_loc.0, gv.cursor_loc.1);
    println!("map_loc({},{}): ", gv.map_loc.0, gv.map_loc.1);
    println!("scale {}: ", gv.map_scale);
    println!("hexagon({},{}): ", gv.hexagon.0, gv.hexagon.1);
    println!("hex_0x0({},{}): ", gv.hex_0x0.0, gv.hex_0x0.1);
    println!("chit_sqr {}: ", gv.chit_sqr);
    println!("chit_0x0({},{}): ", gv.chit_0x0.0, gv.chit_0x0.1);
    println!("hex_id({},{}): ", gv.hex_id.0, gv.hex_id.1);
    println!();
    */
}

pub fn load_game(gv: &mut GlobalVariables) {
    println!("cursor({},{}): ", gv.cursor_loc.0, gv.cursor_loc.1);
    println!("map_loc({},{}): ", gv.map_loc.0, gv.map_loc.1);
    println!("scale {}: ", gv.map_scale);
    println!("hexagon({},{}): ", gv.hexagon.0, gv.hexagon.1);
    println!("hex_0x0({},{}): ", gv.hex_0x0.0, gv.hex_0x0.1);
    println!("chit_sqr {}: ", gv.chit_sqr);
}
