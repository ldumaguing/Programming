use std::f32::consts::PI;

enum Quadrant {
    I,
    II,
    III,
    IV,
}

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
pub fn get_path(from: &HexID, to: &HexID) -> Vec<HexID> {
    let mut path: Vec<HexID> = Vec::new();

    let angle: f32 = get_degrees(from, to);
    let mut quad: Quadrant = Quadrant::IV;
    if (angle >= 0.0) & (angle < 90.0) {
        quad = Quadrant::I;
    } else if (angle >= 90.0) & (angle < 180.0) {
        quad = Quadrant::II;
    } else if (angle >= 180.0) & (angle < 270.0) {
        quad = Quadrant::III;
    }

    let mut curr_hex = HexID(from.0, from.1);
    loop {
        if curr_hex.0 == to.0 {
            if curr_hex.1 == to.1 {
                break;
            }
        }
        curr_hex = get_closer(angle, &quad, curr_hex, to);
        path.push(HexID(curr_hex.0, curr_hex.1));
    }

    if path.len() == 0 {
        path.push(HexID(from.0, from.1));
    }
    path
}

// **************************************************************************************
pub fn get_hex_distance(from: &HexID, to: &HexID) -> i32 {
    if from.0 == to.0 {
        if from.1 == to.1 {
            return 0;
        }
    }
    println!("\n****************************** get_hex_distance");

    let angle: f32 = get_degrees(from, to);
    println!("............ {} degrees", angle);

    let mut quad: Quadrant = Quadrant::IV;
    if (angle >= 0.0) & (angle < 90.0) {
        quad = Quadrant::I;
    } else if (angle >= 90.0) & (angle < 180.0) {
        quad = Quadrant::II;
    } else if (angle >= 180.0) & (angle < 270.0) {
        quad = Quadrant::III;
    }

    println!(
        "............ {} quadrant",
        match quad {
            Quadrant::I => "I",
            Quadrant::II => "II",
            Quadrant::III => "III",
            Quadrant::IV => "IV",
        }
    );

    let mut curr_hex = HexID(from.0, from.1);
    let mut counter = 0;
    println!("...{},{}", curr_hex.0, curr_hex.1);
    loop {
        if curr_hex.0 == to.0 {
            if curr_hex.1 == to.1 {
                break;
            }
        }
        curr_hex = get_closer(angle, &quad, curr_hex, to);
        println!("...{},{}", curr_hex.0, curr_hex.1);
        counter += 1;
    }
    counter
}

// --------------------------------------------------------------------------------------
fn get_closer(angle: f32, quad: &Quadrant, curr_hex: HexID, to: &HexID) -> HexID {
    let fish: HexID = match quad {
        Quadrant::I => get_closest_hex(angle, curr_hex, to, quad),
        Quadrant::II => get_closest_hex(angle, curr_hex, to, quad),
        Quadrant::III => get_closest_hex(angle, curr_hex, to, quad),
        Quadrant::IV => get_closest_hex(angle, curr_hex, to, quad),
    };
    fish
}

// --------------------------------------------------
fn get_closest_hex(angle: f32, curr_hex: HexID, to: &HexID, quad: &Quadrant) -> HexID {
    let mut h1: Direction = Direction::N;
    let mut h2: Direction = Direction::N;
    let mut h3: Direction = Direction::N;

    match quad {
        Quadrant::I => {
            h1 = Direction::SE;
            h2 = Direction::NE;
            h3 = Direction::N;
        }
        Quadrant::II => {
            h1 = Direction::N;
            h2 = Direction::NW;
            h3 = Direction::SW;
        }
        Quadrant::III => {
            h1 = Direction::NW;
            h2 = Direction::SW;
            h3 = Direction::S;
        }
        Quadrant::IV => {
            h1 = Direction::S;
            h2 = Direction::SE;
            h3 = Direction::NE;
        }
    };

    let mut delta: f32 = 360.0;
    let mut X: i32 = 0;
    let mut Y: i32 = 0;

    let x: HexID = get_adjacent_hex_id(&curr_hex, h1);
    if x.0 == to.0 {
        if x.1 == to.1 {
            X = x.0;
            Y = x.1;
            return HexID(X, Y);
        }
    }
    let x_ang: f32 = get_degrees(&x, to);
    if delta > (x_ang - angle).abs() {
        delta = (x_ang - angle).abs();
        X = x.0;
        Y = x.1;
    }

    let y: HexID = get_adjacent_hex_id(&curr_hex, h2);
    if y.0 == to.0 {
        if y.1 == to.1 {
            X = y.0;
            Y = y.1;
            return HexID(X, Y);
        }
    }
    let y_ang: f32 = get_degrees(&y, to);
    if delta > (y_ang - angle).abs() {
        delta = (y_ang - angle).abs();
        X = y.0;
        Y = y.1;
    }

    let z: HexID = get_adjacent_hex_id(&curr_hex, h3);
    if z.0 == to.0 {
        if x.1 == to.1 {
            X = z.0;
            Y = z.1;
            return HexID(X, Y);
        }
    }
    let z_ang: f32 = get_degrees(&z, to);
    if delta > (z_ang - angle).abs() {
        X = z.0;
        Y = z.1;
    }

    HexID(X, Y)
}

// **************************************************************************************
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

// **************************************************************************************
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

    if delta_y == 0.0 {
        if delta_x < 0.0 {
            return 180.0;
        } else {
            return 0.0;
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

// **************************************************************************************
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
