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
