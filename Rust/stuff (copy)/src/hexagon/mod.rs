use std::cmp::Ordering;
use std::f32::consts::PI;

pub enum Direction {
    N,
    S,
    NW,
    NE,
    SW,
    SE,
}

pub struct HexID(pub i32, pub i32);
pub struct HexLoc(pub f32, pub f32);

const COS30: f64 = 0.8660254037844387;

// **************************************************************************************
pub fn get_degrees(from: &HexID, to: &HexID) -> f32 {
    let sameX: i8 = match from.0.cmp(&to.0) {
        Ordering::Less => 1,
        Ordering::Greater => 1,
        Ordering::Equal => 0,
    };
    let sameY: i8 = match from.1.cmp(&to.1) {
        Ordering::Less => 1,
        Ordering::Greater => 1,
        Ordering::Equal => 0,
    };
    if (sameX + sameY) == 0 {
        //println!("******************** same hex ********************");
        return -1.0;
    }

    println!("    from {},{}", &from.0, &from.1);
    println!("    to   {},{}", &to.0, &to.1);
    let fromHex: HexLoc = convert_hex_id_2_loc(from);

    println!("    from {},{}", &fromHex.0, &fromHex.1);
    let toHex: HexLoc = convert_hex_id_2_loc(to);
    println!("    to   {},{}", &toHex.0, &toHex.1);

    let delta_x: f32 = &toHex.0 - &fromHex.0;
    println!("    dX   {}", delta_x);
    let delta_y: f32 = &toHex.1 - &fromHex.1;
    println!("    dY   {}", delta_y);

    if delta_x == 0.0 {
        if delta_y < 0.0 {
            //println!("    90 degrees");
            //return; // 90
            return 90.0;
        } else {
            //return; // 270
            return 270.0;
        }
    }

    let deg: f32 = ((delta_y / delta_x).atan() * 180.0 / PI).abs();
    println!("    ...  {}", deg);
    if (delta_x > 0.0) & (delta_y > 0.0) {
        // + +
        //println!("    {} degrees", 360.0-deg);
        return 360.0 - deg;
    } else if (delta_x < 0.0) & (delta_y < 0.0) {
        // - -
        //println!("    {} degrees", 180.0-deg);
        return 180.0 - deg;
    } else if (delta_x < 0.0) & (delta_y > 0.0) {
        // - +
        //println!("    {} degrees", deg+180.0);
        return deg + 180.0;
    } else {
        // + -
        //println!("    {} degrees", deg);
        return deg * 1.0;
    }
}

pub fn convert_hex_id_2_loc(id: &HexID) -> HexLoc {
    let is_odd = &id.0 % 2;
    let x: f64 = id.0 as f64 * COS30;
    let x: f32 = x as f32;
    let y: f32 = id.1 as f32;
    if is_odd > 0 {
        HexLoc(x, y + 0.5)
    } else {
        HexLoc(x, y)
    }
}

pub fn get_adjacent_hex_id(curr_hex: &HexID, dir: Direction) -> HexID {
    let is_odd = curr_hex.0 % 2;
    match dir {
        Direction::N => HexID(curr_hex.0, curr_hex.1 - 1),
        Direction::S => HexID(curr_hex.0, curr_hex.1 + 1),
        Direction::NW => {
            if is_odd > 0 {
                HexID(curr_hex.0 - 1, curr_hex.1)
            } else {
                HexID(curr_hex.0 - 1, curr_hex.1 - 1)
            }
        }
        Direction::NE => {
            if is_odd > 0 {
                HexID(curr_hex.0 + 1, curr_hex.1)
            } else {
                HexID(curr_hex.0 + 1, curr_hex.1 - 1)
            }
        }
        Direction::SW => {
            if is_odd > 0 {
                HexID(curr_hex.0 - 1, curr_hex.1 + 1)
            } else {
                HexID(curr_hex.0 - 1, curr_hex.1)
            }
        }
        Direction::SE => {
            if is_odd > 0 {
                HexID(curr_hex.0 + 1, curr_hex.1 + 1)
            } else {
                HexID(curr_hex.0 + 1, curr_hex.1)
            }
        }
    }
}
