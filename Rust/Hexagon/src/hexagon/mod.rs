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

pub enum HexSpine {
    A = 0,
    B = 1,
    C = 2,
    D = 3,
    E = 4,
    F = 5,
}

pub struct Hexagon {
    pub id: (i64, i64),
    pub placement: i32,
}

impl Hexagon {
    fn get_closer(from: (i64, i64), angle: f64, quad: &Quadrant, to: &Hexagon) -> (i64, i64) {
        let closest = match quad {
            Quadrant::I => Self::get_closest_hex(angle, from, to, quad),
            Quadrant::II => Self::get_closest_hex(angle, from, to, quad),
            Quadrant::III => Self::get_closest_hex(angle, from, to, quad),
            Quadrant::IV => Self::get_closest_hex(angle, from, to, quad),
        };
        closest
    }

    fn get_closest_hex(angle: f64, from: (i64, i64), to: &Hexagon, quad: &Quadrant) -> (i64, i64) {
        let h1: Direction;
        let h2: Direction;
        let h3: Direction;

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

        let mut X = 0;
        let mut Y = 0;
        let from_hex = Hexagon {
            id: (from.0, from.1),
            placement: -1,
        };

        // ************************* h1
        let x = from_hex.get_adjacent_id(h1);
        if x.0 == to.id.0 {
            if x.1 == to.id.1 {
                X = x.0;
                Y = x.1;
                return (X, Y);
            }
        }
        let new_hex = Hexagon {
            id: (x.0, x.1),
            placement: -1,
        };
        let x_ang = new_hex.get_degrees(to);

        // ************************* h2
        let y = from_hex.get_adjacent_id(h2);
        if y.0 == to.id.0 {
            if y.1 == to.id.1 {
                X = y.0;
                Y = y.1;
                return (X, Y);
            }
        }
        let new_hex = Hexagon {
            id: (y.0, y.1),
            placement: -1,
        };
        let y_ang = new_hex.get_degrees(to);

        // ************************* h3
        let z = from_hex.get_adjacent_id(h3);
        if z.0 == to.id.0 {
            if z.1 == to.id.1 {
                X = z.0;
                Y = z.1;
                return (X, Y);
            }
        }
        let new_hex = Hexagon {
            id: (z.0, z.1),
            placement: -1,
        };
        let z_ang = new_hex.get_degrees(to);

        let mut low_ang = (x_ang - angle).abs();
        X = x.0;
        Y = x.1;
        if low_ang > (y_ang - angle).abs() {
            low_ang = (y_ang - angle).abs();
            X = y.0;
            Y = y.1;
        }
        if low_ang > (z_ang - angle).abs() {
            X = z.0;
            Y = z.1;
        }

        println!("----------------> ({},{})", X, Y);
        (X, Y)
    }
}

// ************************* public methods
impl Hexagon {
    pub fn get_course(&self, deg: i64) -> (i64, i64) {
        let deg = 360 - (deg % 360);

        // hypotenuse = 60.0
        // x = h * cos(deg)
        // y = h * sin(deg)
        // output: hex_id
        let h = 60.0;
        let x = (deg as f64 * PI / 180.0).cos() * h;
        let y = (deg as f64 * PI / 180.0).sin() * h;
        let x = ((x / COS30) as i64 + self.id.0);
        let y = y as i64 + self.id.1;
        (x, y)
    }

    pub fn get_spine_id(&self, dir: Direction) -> (i64, i64, i8) {
        let mut s: i8 = 0;
        let mut x: i64 = self.id.0;
        let mut y: i64 = self.id.1;

        if (self.id.0 % 2) == 0 {
            // even x
            match dir {
                Direction::N => {
                    s = HexSpine::A as i8;
                }
                Direction::NE => {
                    s = HexSpine::B as i8;
                }
                Direction::SE => {
                    s = HexSpine::C as i8;
                }
                Direction::S => {
                    y += 1;
                    s = HexSpine::A as i8;
                }
                Direction::SW => {
                    s = HexSpine::E as i8;
                }
                Direction::NW => {
                    s = HexSpine::F as i8;
                }
            }
        } else {
            // odd x
            match dir {
                Direction::N => {
                    x -= 1;
                    s = HexSpine::D as i8;
                }
                Direction::NE => {
                    x += 1;
                    s = HexSpine::E as i8;
                }
                Direction::SE => {
                    x += 1;
                    y += 1;
                    s = HexSpine::F as i8;
                }
                Direction::S => {
                    x -= 1;
                    y += 1;
                    s = HexSpine::D as i8;
                }
                Direction::SW => {
                    x -= 1;
                    y += 1;
                    s = HexSpine::B as i8;
                }
                Direction::NW => {
                    x -= 1;
                    s = HexSpine::C as i8;
                }
            }
        }

        (x, y, s)
    }

    pub fn get_path(&self, to: &Hexagon) -> Vec<(i64, i64)> {
        let mut path: Vec<(i64, i64)> = Vec::new();

        if self.id.0 == to.id.0 {
            if self.id.1 == to.id.1 {
                path.push((to.id.0, to.id.1))
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
        loop {
            if curr_hex.0 == to.id.0 {
                if curr_hex.1 == to.id.1 {
                    break;
                }
            }
            curr_hex = Self::get_closer(curr_hex, angle, &quad, to);
            path.push((curr_hex.0, curr_hex.1));
        }

        path
    }

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
        println!("....{},{}", curr_hex.0, curr_hex.1);
        loop {
            if curr_hex.0 == to.id.0 {
                if curr_hex.1 == to.id.1 {
                    break;
                }
            }
            curr_hex = Self::get_closer(curr_hex, angle, &quad, to);
            counter += 1;
        }

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
