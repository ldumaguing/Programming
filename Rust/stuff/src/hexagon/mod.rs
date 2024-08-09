use std::f64::consts::PI;
const COS30: f64 = 0.8660254037844387;

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

pub struct Hexagon {
    pub id: (i64, i64),
}

impl Hexagon {
    fn get_closer(&self, angle: f64, quad: &Quadrant, to: &Hexagon) -> (i64, i64) {
        println!("foo************");
        (13, 13)
    }
}

// ************************* public methods
impl Hexagon {
    pub fn get_hex_distance(&self, to: &Hexagon) -> i64 {
        if self.id.0 == to.id.0 {
            if self.id.1 == to.id.1 {
                return 0;
            }
        }

        let angle = self.get_degrees(to);

        let mut quad: Quadrant = Quadrant::IV;
        if (angle >= 0.0) & (angle < 90.0) {
            quad = Quadrant::I;
        } else if (angle >= 90.0) & (angle < 180.0) {
            quad = Quadrant::II;
        } else if (angle >= 180.0) & (angle < 270.0) {
            quad = Quadrant::III;
        }

        let mut curr_hex = (self.id.0, self.id.1);
        let mut counter = 0;

        curr_hex = self.get_closer(angle, &quad, to);

        counter
    }

    pub fn get_adjacent_id(&self, dir: Direction) -> (i64, i64) {
        let is_odd = self.id.0 % 2;
        match dir {
            Direction::N => (self.id.0, self.id.1 - 1),
            Direction::S => (self.id.0, self.id.1 + 1),
            Direction::NW => {
                if is_odd > 0 {
                    (self.id.0 - 1, self.id.1)
                } else {
                    (self.id.0 - 1, self.id.1 - 1)
                }
            }
            Direction::NE => {
                if is_odd > 0 {
                    (self.id.0 + 1, self.id.1)
                } else {
                    (self.id.0 + 1, self.id.1 - 1)
                }
            }
            Direction::SW => {
                if is_odd > 0 {
                    (self.id.0 - 1, self.id.1 + 1)
                } else {
                    (self.id.0 - 1, self.id.1)
                }
            }
            Direction::SE => {
                if is_odd > 0 {
                    (self.id.0 + 1, self.id.1 + 1)
                } else {
                    (self.id.0 + 1, self.id.1)
                }
            }
        }
    }

    pub fn get_loc(&self) -> (f64, f64) {
        let is_odd = self.id.0 % 2;
        let x: f64 = self.id.0 as f64 * COS30;
        let y: f64 = self.id.1 as f64;
        if is_odd > 0 {
            (x, y + 0.5)
        } else {
            (x, y)
        }
    }

    pub fn get_distance(&self, to: &Hexagon) -> f64 {
        if self.id.0 == to.id.0 {
            if self.id.1 == to.id.1 {
                return 0.0;
            }
        }

        let loc_from = self.get_loc();
        let loc_to = to.get_loc();
        let delta_x = loc_to.0 - loc_from.0;
        let delta_y = loc_to.1 - loc_from.1;

        ((delta_x * delta_x) + (delta_y * delta_y)).sqrt()
    }

    pub fn get_degrees(&self, to: &Hexagon) -> f64 {
        if self.id.0 == to.id.0 {
            if self.id.1 == to.id.1 {
                return -1.0;
            }
        }

        let loc_from = self.get_loc();
        let loc_to = to.get_loc();
        let delta_x = loc_to.0 - loc_from.0;
        let delta_y = loc_to.1 - loc_from.1;

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

        let deg = ((delta_y / delta_x).atan() * 180.0 / PI).abs();
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
}

/*
    pub fn foo(&self) {
        println!("in foo");
        bar();
        Self::bar();
        self.mad();
    }
    fn bar() {
        println!("in Hexagon::bar");
    }
    fn mad(&self) {
        println!("in mad");
    }
}

fn bar() {
    println!("in bar");
}
*/

/*
pub struct (pub i64, pub i64);
pub struct HexLoc(pub f64, pub f64);

const COS30: f64 = 0.8660254037844387;

// **************************************************************************************
pub fn get_path(from: &, to: &) -> Vec<> {
    let mut path: Vec<> = Vec::new();

    let angle: f64 = get_degrees(from, to);
    let mut quad: Quadrant = Quadrant::IV;
    if (angle >= 0.0) & (angle < 90.0) {
        quad = Quadrant::I;
    } else if (angle >= 90.0) & (angle < 180.0) {
        quad = Quadrant::II;
    } else if (angle >= 180.0) & (angle < 270.0) {
        quad = Quadrant::III;
    }

    let mut curr_hex = (from.0, from.1);
    loop {
        if curr_hex.0 == to.0 {
            if curr_hex.1 == to.1 {
                break;
            }
        }
        curr_hex = get_closer(angle, &quad, curr_hex, to);
        path.push((curr_hex.0, curr_hex.1));
    }

    if path.len() == 0 {
        path.push((from.0, from.1));
    }
    path
}

// **************************************************************************************
pub fn get_hex_distance(from: &, to: &) -> i64 {
    if from.0 == to.0 {
        if from.1 == to.1 {
            return 0;
        }
    }
    println!("\n****************************** get_hex_distance");

    let angle: f64 = get_degrees(from, to);
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

    let mut curr_hex = (from.0, from.1);
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
fn get_closer(angle: f64, quad: &Quadrant, curr_hex: , to: &) ->  {
    let fish:  = match quad {
        Quadrant::I => get_closest_hex(angle, curr_hex, to, quad),
        Quadrant::II => get_closest_hex(angle, curr_hex, to, quad),
        Quadrant::III => get_closest_hex(angle, curr_hex, to, quad),
        Quadrant::IV => get_closest_hex(angle, curr_hex, to, quad),
    };
    fish
}

// --------------------------------------------------
fn get_closest_hex(angle: f64, curr_hex: , to: &, quad: &Quadrant) ->  {
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

    let mut delta: f64 = 360.0;
    let mut X: i64 = 0;
    let mut Y: i64 = 0;

    let x:  = get_adjacent_hex_id(&curr_hex, h1);
    if x.0 == to.0 {
        if x.1 == to.1 {
            X = x.0;
            Y = x.1;
            return (X, Y);
        }
    }
    let x_ang: f64 = get_degrees(&x, to);
    if delta > (x_ang - angle).abs() {
        delta = (x_ang - angle).abs();
        X = x.0;
        Y = x.1;
    }

    let y:  = get_adjacent_hex_id(&curr_hex, h2);
    if y.0 == to.0 {
        if y.1 == to.1 {
            X = y.0;
            Y = y.1;
            return (X, Y);
        }
    }
    let y_ang: f64 = get_degrees(&y, to);
    if delta > (y_ang - angle).abs() {
        delta = (y_ang - angle).abs();
        X = y.0;
        Y = y.1;
    }

    let z:  = get_adjacent_hex_id(&curr_hex, h3);
    if z.0 == to.0 {
        if x.1 == to.1 {
            X = z.0;
            Y = z.1;
            return (X, Y);
        }
    }
    let z_ang: f64 = get_degrees(&z, to);
    if delta > (z_ang - angle).abs() {
        X = z.0;
        Y = z.1;
    }

    (X, Y)
}

*/
