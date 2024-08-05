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
pub fn get_hex_distance(from: &HexID, to: &HexID) -> i32 {
    if from.0 == to.0 {
        if from.1 == to.1 {
            return 0;
        }
    }

    let mut curr_hex = HexID(from.0, from.1);
    println!("............ {},{}", curr_hex.0, curr_hex.1);
    curr_hex.0 = 3;
    println!("............ {},{}", curr_hex.0, curr_hex.1);
    0
}

pub fn get_distance(from: &HexID, to: &HexID) -> f32 {
    if from.0 == to.0 {
        if from.1 == to.1 {
            return 0.0;
        }
    }

    let from_hex: HexLoc = convert_hex_id_2_loc(from);
    let to_hex: HexLoc = convert_hex_id_2_loc(to);
    let delta_x: f32 = &to_hex.0 - &from_hex.0;
    let delta_y: f32 = &to_hex.1 - &from_hex.1;

    ((delta_x * delta_x) + (delta_y * delta_y)).sqrt()
}

pub fn get_degrees(from: &HexID, to: &HexID) -> f32 {
    if from.0 == to.0 {
        if from.1 == to.1 {
            return -1.0;
        }
    }

    let from_hex: HexLoc = convert_hex_id_2_loc(from);
    let to_hex: HexLoc = convert_hex_id_2_loc(to);
    let delta_x: f32 = &to_hex.0 - &from_hex.0;
    let delta_y: f32 = &to_hex.1 - &from_hex.1;

    if delta_x == 0.0 {
        if delta_y < 0.0 {
            return 90.0;
        } else {
            return 270.0;
        }
    }

    let deg: f32 = ((delta_y / delta_x).atan() * 180.0 / PI).abs();
    if (delta_x > 0.0) & (delta_y > 0.0) {
        return 360.0 - deg;
    } else if (delta_x < 0.0) & (delta_y < 0.0) {
        return 180.0 - deg;
    } else if (delta_x < 0.0) & (delta_y > 0.0) {
        return deg + 180.0;
    } else {
        return deg;
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
